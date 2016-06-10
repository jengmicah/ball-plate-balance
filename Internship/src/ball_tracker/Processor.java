package ball_tracker;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JSlider;

import org.opencv.calib3d.Calib3d;
import org.opencv.core.Core;
import org.opencv.core.Mat;
import org.opencv.core.MatOfInt4;
import org.opencv.core.MatOfPoint;
import org.opencv.core.MatOfPoint2f;
import org.opencv.core.Point;
import org.opencv.core.Rect;
import org.opencv.core.Scalar;
import org.opencv.core.Size;
import org.opencv.imgproc.Imgproc;
import org.opencv.videoio.VideoCapture;

/*
 * All the processing is done here. Isolate certain colors and detect the midpoints of the blobs.
 * Make sure you align the camera with the plane as accurately as possible. There is still some error 
 * in the perspective transformation.
 */
public class Processor {

	Mat src_image,hsv_image,gray_image,bin_image,dst_image;
	Panel livePanel, binPanel;
	VideoCapture webcam;
	Rect obj_rect = new Rect(0,0,0,0);
	JSlider h_slider1, s_slider1,v_slider1,h_slider2,s_slider2,v_slider2;
	Mat erode_element;
	int x,y,x2,y2;
	boolean foundBall = false;
	ArrayList<Point> points;
	int pointListSize = 10;
	JFrame sliderFrame;
	MouseListener listener;
	MatOfPoint2f srcList, dstList;
	Point[] src_corners = new Point[4], dst_corners = new Point[4];
	int index = 0;

	public Processor(VideoCapture webcam, boolean run, Panel livePanel, Panel binPanel, 
			JSlider h_slider1, JSlider s_slider1, JSlider v_slider1, 
			JSlider h_slider2, JSlider s_slider2, JSlider v_slider2, MouseListener listener){
		this.webcam = webcam;
		this.livePanel = livePanel;
		this.binPanel = binPanel;
		this.h_slider1 = h_slider1; this.h_slider2 = h_slider2;
		this.s_slider1 = s_slider1; this.s_slider2 = s_slider2; 
		this.v_slider1 = v_slider1; this.v_slider2 = v_slider2;
		this.listener = listener;
		src_image = new Mat(); hsv_image = new Mat();
		gray_image = new Mat(); bin_image = new Mat();
		erode_element = new Mat();
		points = new ArrayList<Point>();
		srcList = new MatOfPoint2f(); dstList = new MatOfPoint2f();
	}

	public double[] process() {
		/*
		 * Loop of entire algorithm
		 */
		webcam.read(src_image); //read one frame
		if(src_image != null && !src_image.empty()) { //if a frame is captured
			dst_image = src_image.clone();
			/////// PERFORM TRANSFORMATION //////////
			if(!listener.pointsSet) { // If there is a frame, has the user clicked 4 points?
				initializePoints(src_corners); // If the user has not clicked the points, keep waiting for them
			} else { // If the user clicked 4 points, go on to the transformation process
				// Use distance formula to find width and height of the output src_image (the bigger width/height)
				double widthA = Math.sqrt((Math.pow(src_corners[0].x - src_corners[1].x,2.0) + (Math.pow(src_corners[0].y - src_corners[1].y,2.0)))); 
				double widthB = Math.sqrt((Math.pow(src_corners[2].x - src_corners[3].x,2.0) + (Math.pow(src_corners[2].y - src_corners[3].y,2.0))));
				double heightA = Math.sqrt((Math.pow(src_corners[0].x - src_corners[3].x,2.0) + (Math.pow(src_corners[0].y - src_corners[3].y,2.0))));
				double heightB = Math.sqrt((Math.pow(src_corners[1].x - src_corners[2].x,2.0) + (Math.pow(src_corners[1].y - src_corners[2].y,2.0))));
				double maxWidth = Math.max(widthA,widthB);
				double maxHeight = Math.max(heightA,heightB);
				// Contains the corners of the desired transformed object (rectangle)
				dst_corners[0] = new Point(0,0);
				dst_corners[1] = new Point(maxWidth - 1, 0);
				dst_corners[2] = new Point(maxWidth - 1, maxHeight - 1);
				dst_corners[3] = new Point(0, maxHeight - 1);
				// Convert src and dst arrays to MatOfPoint2f for findHomography()
				srcList.fromArray(src_corners);
				dstList.fromArray(dst_corners);
				// Perform perspective transformation
				Mat hg = Calib3d.findHomography(srcList, dstList);
				Imgproc.warpPerspective(src_image, dst_image, hg, new Size(maxWidth,maxHeight));

				//				if(dst_image.width() < dst_image.height()) Imgproc.resize(dst_image, dst_image, new Size(dst_image.width() * (src_image.height()/dst_image.height()), src_image.height()));
				//				else Imgproc.resize(dst_image, dst_image, new Size(src_image.width(), dst_image.height() * (src_image.width()/dst_image.width())));
			}
			///////// PERFORM COLOR FILTERING ///////////
			Imgproc.cvtColor(dst_image,hsv_image,Imgproc.COLOR_BGR2HSV); //convert BGR to HSV
			Imgproc.cvtColor(dst_image,gray_image,Imgproc.COLOR_BGR2GRAY); //convert BGR to grayscale
			hsv_image = applyMorphOp(hsv_image);
			Scalar min = new Scalar(h_slider1.getValue(),s_slider1.getValue(),v_slider1.getValue(),0); //set value to slider value
			Scalar max = new Scalar(h_slider2.getValue(),s_slider2.getValue(),v_slider2.getValue(),0);
			double[] point = findObj(dst_image,hsv_image,bin_image,min,max, 200);
			drawTrail(dst_image, points, pointListSize);

			//show captured frame
			livePanel.setImageWithMat(dst_image);
			livePanel.repaint();
			binPanel.setImageWithMat(bin_image);
			binPanel.repaint();

			return point;				
		}
		return null;
	}

	public void initializePoints(Point[] src_corners) {
		/*
		 * Fills the object src_corners based on user input.
		 * 1st Point = top-left
		 * 2nd Point = top-right
		 * 3rd Point = bottom-right
		 * 4th Point = bottom-left
		 */
		if(listener.pointAdded) {
			// Set the next empty index of src_corners equal to this clicked point
			src_corners[index] = new Point(listener.x, listener.y);
			// Print out coordinates relative to JFrame
			System.out.println(src_corners[index].x + "," + src_corners[index].y);
			// Increment for the array
			index++;
			// If four points have been added, move on to do transformation calculations
			if(index >= 4) listener.pointsSet = true;
			// Make sure the default for pointAdded is false so that it doesn't keep adding the same point
			listener.pointAdded = false; 
		}
	}

	public Mat applyMorphOp(Mat image) {
		/*
		 * Applies morphological operations to further enhance tracking
		 */
		Mat temp = new Mat();
		image.copyTo(temp);

		// down-scale and upscale the image to filter out the noise
		Mat smallerImg = new Mat(new Size(temp.width()/2, temp.height()/2),temp.type());
		Imgproc.pyrDown(temp, smallerImg, smallerImg.size());
		Imgproc.pyrUp(smallerImg, temp, temp.size());

		Imgproc.blur(temp,temp,new Size(10,10)); //BLER
		erode_element = Imgproc.getStructuringElement(Imgproc.MORPH_ELLIPSE, new Size(2*5 + 1, 2*5 + 1), new Point());
		Imgproc.erode(temp,temp,erode_element); //EROAD
		Imgproc.dilate(temp,temp,erode_element); //DYLAIT
		return temp;
	}

	public void drawTrail(Mat src, ArrayList<Point> pointList, int listSize) {
		/*
		 * Draws the trail from the centroid of the tracked object
		 */
		for(int i = 1; i < listSize; i++) {
			int thickness = (int)Math.sqrt((100/i) * 2.5); //decreasing thickness as the trail goes on
			if(pointList.size() > i )Imgproc.line(src, pointList.get(i), pointList.get(i-1), new Scalar(i,i*25,255), thickness);
		}
	}

	public void pushToList(Point newPoint, ArrayList<Point> pointList, int listSize) {
		/*
		 * Appends point at beginning of ArrayList 
		 * (2nd element becomes 1st, 3rd becomes 2nd, and so on)
		 * This makes the trail fade
		 */
		pointList.add(0, newPoint); 
		if(pointList.size() > listSize) pointList.remove(pointList.size() - 1); //never exceed 10 elements
	}

	public double[] findObj(Mat src, Mat hsv, Mat bin, Scalar min, Scalar max, int color) {
		/*
		 * Given a binary matrix, find object location (simple contour detection in a threshold image)
		 * Return a double array with x,y coordinates of the midpoint of the object
		 */
		Core.inRange(hsv,min,max,bin); //bin becomes binary after inRange is called
		Mat temp = new Mat();
		bin.copyTo(temp);

		List<MatOfPoint> contours = new ArrayList<MatOfPoint>(); //these two vectors needed for output of findContours
		MatOfInt4 hierarchy = new MatOfInt4();
		Imgproc.findContours(temp,contours,hierarchy,Imgproc.RETR_EXTERNAL,Imgproc.CHAIN_APPROX_SIMPLE );// retrieves external contours
		//				for( int i = 0; i< contours.size(); i++ ){Imgproc.drawContours(src, contours, i, new Scalar(0,255,0), 2);}

		if(contours.size() > 0) { //if contours vector is not empty, we have found some objects			
			foundBall = true;
			int index = findLargestContour(contours);
			obj_rect = Imgproc.boundingRect(contours.get(index)); //make bounding rect around largest vector

			x = obj_rect.x; //assign x,y values based on rect   
			y = obj_rect.y;
			x2 = obj_rect.x + obj_rect.width;
			y2 = obj_rect.y + obj_rect.height;

			int midX = (x + x2)/2;
			int midY = (y + y2)/2;

			pushToList(new Point(midX, midY), points, pointListSize); //add these points to the ArrayList for the trail

			//			double[] obj = {midX,midY};
			double[] obj = translatePoint(midX,midY);
			Imgproc.rectangle(src, new Point(x, y), new Point(x2, y2), new Scalar(0,color,255),2); //draw rectangle around the object
			Imgproc.circle(src, new Point(midX, midY), 4, new Scalar(255,color,0));
			Imgproc.putText(src,"(" + obj[0] +","+ obj[1] + ")", new Point(x,y),2,1, new Scalar(color,0,0),2);

			return output(obj, dst_image.width(), 0, 540, 0, dst_image.height(), 0); //return TRANSLATED point from 0 -540 (idk why 540)
		} else {
			foundBall = false;
			return null;
		}
	}

	public int findLargestContour(List<MatOfPoint> contours) {
		/*
		 * Finds contour with max area
		 * Returns index of that contour
		 */
		double maxArea = 0;
		int generalIndex = 0;
		int contourIndex = 0;
		Iterator<MatOfPoint> each = contours.iterator();
		while (each.hasNext()) {
			MatOfPoint wrapper = each.next();
			double area = Imgproc.contourArea(wrapper);
			if (area > maxArea){
				maxArea = area;
				contourIndex = generalIndex;
			}
			generalIndex++;
		}
		return contourIndex;
	}

	public double[] translatePoint(double x, double y) { //origin is at the bottom/middle of the frame
		double[] translated = {x, livePanel.getHeight() - y};
		return translated;
	}

	public double[] output(double[] obj, int old_max, int old_min, int new_max, int new_min,
			int old_max2, int old_min2) {
		double[] obj2 = new double[2];
		obj2[0] = (((obj[0] - old_min) * (new_max - new_min)) / (old_max - old_min)) + new_min;
		obj2[1] = (((obj[1] - old_min) * (new_max - new_min)) / (old_max2 - old_min2)) + new_min;
		//		double[] temp = new double[2];
		//		temp[0] = Math.abs(obj2[0] - 540);
		//		temp[1] = Math.abs(obj2[1] - 540);
		return obj2;
	}

	public boolean getFoundBall() {
		return foundBall;
	}
}