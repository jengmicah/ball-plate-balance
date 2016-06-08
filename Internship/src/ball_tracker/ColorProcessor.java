package ball_tracker;
import java.awt.Component;
import java.awt.Container;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JSlider;

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
 */
public class ColorProcessor {

	private Mat src,hsv,gray, bin, bin2;
	private Panel livePanel, binPanel, binPanel2;
	private VideoCapture webcam;
	private Rect obj_rect = new Rect(0,0,0,0);
	private JSlider h_slider1, s_slider1,v_slider1,h_slider2,s_slider2,v_slider2;
	private JSlider h_slider3, s_slider3,v_slider3,h_slider4,s_slider4,v_slider4;
	private Mat erode_element;
	private int x,y,x2,y2;
	private boolean foundBall = false, foundPlate = false;
	private ArrayList<Point> points;
	List<MatOfPoint> squares;
	int pointListSize = 10;
	JFrame sliderFrame;
	Point[] plateCorn = new Point[4];

	public ColorProcessor(VideoCapture webcam, boolean run, Panel livePanel, Panel binPanel, Panel binPanel2, 
			JSlider h_slider1, JSlider s_slider1, JSlider v_slider1, 
			JSlider h_slider2, JSlider s_slider2, JSlider v_slider2, 
			JSlider h_slider3, JSlider s_slider3, JSlider v_slider3, 
			JSlider h_slider4, JSlider s_slider4, JSlider v_slider4){
		this.webcam = webcam;
		this.livePanel = livePanel;
		this.binPanel = binPanel;
		this.binPanel2 = binPanel2;
		this.h_slider1 = h_slider1; this.h_slider2 = h_slider2; this.h_slider3 = h_slider3; this.h_slider4 = h_slider4; 
		this.s_slider1 = s_slider1; this.s_slider2 = s_slider2; this.s_slider3 = s_slider3; this.s_slider4 = s_slider4; 
		this.v_slider1 = v_slider1; this.v_slider2 = v_slider2; this.v_slider3 = v_slider3; this.v_slider4 = v_slider4; 
		src = new Mat();
		hsv = new Mat();
		gray = new Mat();
		bin = new Mat(); bin2 = new Mat();
		erode_element = new Mat();
		points = new ArrayList<Point>();
		squares = new ArrayList<MatOfPoint>();
	}

	public double[] process() {
		/*
		 * Loop of entire algorithm
		 */
		webcam.read(src); //read one frame
		if(src != null && !src.empty()) { //if a frame is captured
			Imgproc.cvtColor(src,hsv,Imgproc.COLOR_BGR2HSV); //convert BGR to HSV
			Imgproc.cvtColor(src,gray,Imgproc.COLOR_BGR2GRAY); //convert BGR to grayscale
			hsv = applyMorphOp(hsv);
			Scalar min = new Scalar(h_slider1.getValue(),s_slider1.getValue(),v_slider1.getValue(),0); //set value to slider value
			Scalar max = new Scalar(h_slider2.getValue(),s_slider2.getValue(),v_slider2.getValue(),0);
			double[] point = findObj(src,hsv,bin,min,max, 200);
			drawTrail(src, points, pointListSize);

			//			Scalar min2 = new Scalar(h_slider3.getValue(),s_slider3.getValue(),v_slider3.getValue(),0); //set value to slider value
			//			Scalar max2 = new Scalar(h_slider4.getValue(),s_slider4.getValue(),v_slider4.getValue(),0);
			//			findPlate(src,hsv,bin2,min2,max2,0);

			//			findSquares(src, squares, min, max);

			//show captured frame
			livePanel.setImageWithMat(src);
			livePanel.repaint();
			binPanel.setImageWithMat(bin);
			binPanel.repaint();
			//			binPanel2.setImageWithMat(bin2);
			//			binPanel2.repaint();

			return point;				
		}
		return null;
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

			int x = obj_rect.x; //assign x,y values based on rect   
			int y = obj_rect.y;
			int x2 = obj_rect.x + obj_rect.width;
			int y2 = obj_rect.y + obj_rect.height;

			double midX = (x + x2)/2.;
			double midY = (y + y2)/2.;

			pushToList(new Point(midX, midY), points, pointListSize); //add these points to the ArrayList for the trail

			//			double[] obj = {midX,midY};
			double[] obj = translatePoint(midX,midY);
			Imgproc.rectangle(src, new Point(x, y), new Point(x2, y2), new Scalar(0,color,255),2); //draw rectangle around the object
			Imgproc.circle(src, new Point(midX, midY), 4, new Scalar(255,color,0));
			Imgproc.putText(src,"(" + obj[0] +","+ obj[1] + ")", new Point(x,y),2,1, new Scalar(color,0,0),2);

			return output(obj); //return TRANSLATED point (just for SysMo) -- all other calculations need to be done with original coordinates
		} else {
			foundBall = false;
			return null;
		}
	}

	public void findPlate(Mat src, Mat hsv, Mat bin, Scalar min, Scalar max, int color) {
		/*
		 * Given a binary matrix, find plate corners(simple contour detection in a threshold image)
		 */
		Core.inRange(hsv,min,max,bin); //bin becomes binary after inRange is called
		Mat temp = new Mat();
		bin.copyTo(temp);

		List<MatOfPoint> contours = new ArrayList<MatOfPoint>(); //these two vectors needed for output of findContours
		MatOfInt4 hierarchy = new MatOfInt4();
		Imgproc.findContours(temp,contours,hierarchy,Imgproc.RETR_EXTERNAL,Imgproc.CHAIN_APPROX_SIMPLE );// retrieves external contours
		//				for( int i = 0; i< contours.size(); i++ ){Imgproc.drawContours(src, contours, i, new Scalar(0,255,0), 2);}

		if(contours.size() > 0) { //if contours vector is not empty, we have found some objects			
			foundPlate = true;
			for(int i = 0; i < contours.size(); i++) {
				obj_rect = Imgproc.boundingRect(contours.get(i)); //make bounding rect around largest vector

				int x = obj_rect.x; //assign x,y values based on rect   
				int y = obj_rect.y;
				int x2 = obj_rect.x + obj_rect.width;
				int y2 = obj_rect.y + obj_rect.height;

				int midX = (x + x2)/2;
				int midY = (y + y2)/2;

				double[] obj = translatePoint(midX,midY);
				Imgproc.rectangle(src, new Point(x, y), new Point(x2, y2), new Scalar(0,color,255),2); //draw rectangle around the object
				Imgproc.circle(src, new Point(midX, midY), 4, new Scalar(255,color,0));
				//				Imgproc.putText(src,"(" + obj[0] +","+ obj[1] + ")", new Point(x,y),2,1, new Scalar(color,0,0),2);
			}
		} else {
			foundPlate = false;
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

	public double angle( Point pt1, Point pt2, Point pt0 ) {
		/* 
		 * helper function:
		 * finds a cosine of angle between vectors
		 * from pt0->pt1 and from pt0->pt2
		 */
		double dx1 = pt1.x - pt0.x;
		double dy1 = pt1.y - pt0.y;
		double dx2 = pt2.x - pt0.x;
		double dy2 = pt2.y - pt0.y;
		return (dx1*dx2 + dy1*dy2)/Math.sqrt((dx1*dx1 + dy1*dy1)*(dx2*dx2 + dy2*dy2) + 1e-10);
	}

	public void findSquares(Mat src, List<MatOfPoint> squares, Scalar min, Scalar max){
		/*
		 *  returns sequence of squares detected on the image.
		 *	the sequence is stored in the specified memory storage
		 */
		Core.inRange(hsv,min,max,bin); //bin becomes binary after inRange is called
		Mat temp = new Mat();
		bin.copyTo(temp);

		List<MatOfPoint> contours = new ArrayList<MatOfPoint>(); //these two vectors needed for output of findContours
		MatOfInt4 hierarchy = new MatOfInt4();
		Imgproc.findContours(temp,contours,hierarchy,Imgproc.RETR_EXTERNAL,Imgproc.CHAIN_APPROX_SIMPLE );// retrieves external contours
		for( int i = 0; i< contours.size(); i++ ){Imgproc.drawContours(src, contours, i, new Scalar(0,255,0), 2);}
		MatOfPoint approx = new MatOfPoint();

		for(int i = 0; i < contours.size(); i++ ) {
			// approximate contour with accuracy proportional
			// to the contour perimeter
			approx = approxPolyDP(contours.get(i),  Imgproc.arcLength(new MatOfPoint2f(contours.get(i).toArray()), true)*0.02, true);
			// square contours should have 4 vertices after approximation
			// relatively large area (to filter out noisy contours)
			// and be convex.
			// Note: absolute value of an area is used because
			// area may be positive or negative - in accordance with the
			// contour orientation
			if(approx.size().height == 4 &&
					Math.abs(Imgproc.contourArea(approx)) > 1000 &&
					Imgproc.isContourConvex(approx)){
				double maxCosine = 0;

				for( int j = 2; j < 5; j++ ) {
					// find the maximum cosine of the angle between joint edges
					double cosine = Math.abs(angle(approx.toArray()[j%4], approx.toArray()[j-2], approx.toArray()[j-1]));
					maxCosine = Math.max(maxCosine, cosine);
				}

				// if cosines of all angles are small
				// (all angles are ~90 degree) then write quandrange
				// vertices to resultant sequence
				if(maxCosine < 0.3)
					squares.add(approx);
			}
			for(int k = 0; k < squares.size(); k++)
				Imgproc.drawContours(src, squares, -1, new Scalar(0,0,255), 2);
		}
	}

	public MatOfPoint approxPolyDP(MatOfPoint curve, double epsilon, boolean closed) {
		MatOfPoint2f tempMat=new MatOfPoint2f();

		Imgproc.approxPolyDP(new MatOfPoint2f(curve.toArray()), tempMat, epsilon, closed);

		return new MatOfPoint(tempMat.toArray());
	}

	public double[] translatePoint(double x, double y) { //origin is at the bottom/middle of the frame
		double[] translated = {x, livePanel.getHeight() - y};
		return translated;
	}

	public double[] output(double[] obj) {
		double[] obj2 = new double[2];
		obj2[0] = (((obj[0] - 0) * (540-0)) / (600 - 0)) + 0;
		obj2[1] = (((obj[1] - 0) * (540-0)) / (480 - 0)) + 0;
//		double[] temp = new double[2];
//		temp[0] = Math.abs(obj2[0] - 540);
//		temp[1] = Math.abs(obj2[1] - 540);
		return obj2;
	}

	public Mat getSrc() {
		return src;
	}

	public boolean getFoundBall() {
		return foundBall;
	}
}