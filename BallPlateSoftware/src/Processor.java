import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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
 * All the processing is done here. Isolate certain colors and detect the midpoints of the contour rectangles.
 * Align the camera with the plane as accurately as possible. There is still some error with the perspective transformation.
 */
public class Processor {

	private Mat src_image; // All the image variables
	private Panel livePanel, binPanel; // Panels for displaying images
	private VideoCapture webcam; // Webcam (huh.)
	
	// Object Detection Variables
	private Mat hsv_image, gray_image, bin_image;
	private Rect obj_rect = new Rect(0, 0, 0, 0); // Rectangle over detected object
	private JSlider h_slider1, s_slider1, v_slider1, h_slider2, s_slider2, v_slider2; // Sliders
	private Mat erode_element;
	private int x, y, x2, y2; // Corners of obj_rect
	private boolean foundBall = false;
	private ArrayList<Point> points; // Contains previous locations of ball midpoint
	private int pointListSize = 10; // Number of points the points ArrayList holds (length of trail)	
	
	// Perspective Transformation Variables
	private Mat dst_image;
	private MouseListener listener; // Listener object for mouse clicks
	private MatOfPoint2f srcList, dstList; // Holds points for perspective transformation
	private Point[] src_corners = new Point[4], dst_corners = new Point[4]; // Look at previous line
	private int index = 0; // Index of array holding clicked corner points for perspective transformation
	
	// Constructor
	public Processor(VideoCapture webcam, boolean run, Panel livePanel, Panel binPanel, 
			JSlider h_slider1, JSlider s_slider1, JSlider v_slider1, 
			JSlider h_slider2, JSlider s_slider2, JSlider v_slider2, MouseListener listener){
		// Initialization
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
		webcam.read(src_image); // Read one frame
		if(src_image != null && !src_image.empty()) { // Check if a frame was captured
			dst_image = src_image.clone(); // Before any transformation occurs, the transformed image is the source image
			
			////////////// Perspective Transformation //////////////
			if(!listener.pointsSet) { // Check for 4 clicked points
				 // Keep waiting for the points
				initializePoints(src_corners);
			} else {
				// Use distance formula to find width and height of the output src_image (the bigger width/height)
				double widthA = Math.sqrt((Math.pow(src_corners[0].x - src_corners[1].x, 2.0) + (Math.pow(src_corners[0].y - src_corners[1].y, 2.0)))); 
				double widthB = Math.sqrt((Math.pow(src_corners[2].x - src_corners[3].x, 2.0) + (Math.pow(src_corners[2].y - src_corners[3].y, 2.0))));
				double heightA = Math.sqrt((Math.pow(src_corners[0].x - src_corners[3].x, 2.0) + (Math.pow(src_corners[0].y - src_corners[3].y, 2.0))));
				double heightB = Math.sqrt((Math.pow(src_corners[1].x - src_corners[2].x, 2.0) + (Math.pow(src_corners[1].y - src_corners[2].y, 2.0))));
				double maxWidth = Math.max(widthA, widthB);
				double maxHeight = Math.max(heightA, heightB);
				// Contains the corners of the desired transformed object (rectangle with the maxWidth and maxHeight)
				dst_corners[0] = new Point(0, 0);
				dst_corners[1] = new Point(maxWidth - 1, 0);
				dst_corners[2] = new Point(maxWidth - 1, maxHeight - 1);
				dst_corners[3] = new Point(0, maxHeight - 1);
				// Convert src and dst arrays to MatOfPoint2f for findHomography()
				srcList.fromArray(src_corners);
				dstList.fromArray(dst_corners);
				// Perform perspective transformation
				Mat hg = Calib3d.findHomography(srcList, dstList);
				Imgproc.warpPerspective(src_image, dst_image, hg, new Size(maxWidth, maxHeight));
			}
			
			////////////// Color Filtering //////////////
			// Convert BGR to HSV
			Imgproc.cvtColor(dst_image, hsv_image, Imgproc.COLOR_BGR2HSV);
			// Convert BGR to grayscale
			Imgproc.cvtColor(dst_image, gray_image, Imgproc.COLOR_BGR2GRAY);
			hsv_image = applyMorphOp(hsv_image);
			// Set HSV values to slider values
			Scalar min = new Scalar(h_slider1.getValue(), s_slider1.getValue(), v_slider1.getValue(), 0); 
			Scalar max = new Scalar(h_slider2.getValue(), s_slider2.getValue(), v_slider2.getValue(), 0);
			double[] point = findObj(dst_image, hsv_image, bin_image, min, max, 200);
			drawTrail(dst_image, points, pointListSize);

			// Show captured frame
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
			System.out.println(src_corners[index].x + ", " + src_corners[index].y);
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
		 * Applies morphological operations to make tracking easier and more efficient
		 */
		Mat temp = new Mat();
		image.copyTo(temp);

		// down-scale and upscale the image to filter out the noise
		//		Mat smallerImg = new Mat(new Size(temp.width()/2., temp.height()/2.), temp.type());
		//		Imgproc.pyrDown(temp, smallerImg, smallerImg.size());
		//		Imgproc.pyrUp(smallerImg, temp, temp.size());

		Imgproc.blur(temp, temp, new Size(10, 10));
		erode_element = Imgproc.getStructuringElement(Imgproc.MORPH_ELLIPSE, new Size(11,11), new Point());
		Imgproc.erode(temp, temp, erode_element);
		Imgproc.dilate(temp, temp, erode_element);
		return temp;
	}

	public void drawTrail(Mat src, ArrayList<Point> pointList, int listSize) {
		/*
		 * Draws the trail from the centroid of the tracked object
		 */
		for(int i = 1; i < listSize; i++) {
			// Decrease thickness as the trail goes on
			int thickness = (int)Math.sqrt((100/i) * 2.5); 
			if(pointList.size() > i) Imgproc.line(src, pointList.get(i), pointList.get(i-1), new Scalar(i, i*25, 255), thickness);
		}
	}

	public double[] findObj(Mat src, Mat hsv, Mat bin, Scalar min, Scalar max, int color) {
		/*
		 * Given a binary matrix, find object location (simple contour detection in a threshold image)
		 * Return a double array with x, y coordinates of the midpoint of the object
		 */
		Core.inRange(hsv, min, max, bin); // bin matrix converts to binary after inRange is called
		Mat temp = new Mat();
		bin.copyTo(temp);

		List<MatOfPoint> contours = new ArrayList<MatOfPoint>(); 
		MatOfInt4 hierarchy = new MatOfInt4();
		// Retrieves external contours
		Imgproc.findContours(temp, contours, hierarchy, Imgproc.RETR_EXTERNAL, Imgproc.CHAIN_APPROX_SIMPLE ); 
		// Draws all contours
		for(int i = 0; i < contours.size(); i++){Imgproc.drawContours(src, contours, i, new Scalar(0, 255, 0), 2);}

		if(contours.size() > 0) {
			foundBall = true;
			int index = findLargestContour(contours);
			// Make bounding rectangle around largest vector
			obj_rect = Imgproc.boundingRect(contours.get(index)); 
			// Assign x-y values based on corners
			x = obj_rect.x; 
			y = obj_rect.y;
			x2 = obj_rect.x + obj_rect.width;
			y2 = obj_rect.y + obj_rect.height;
			int midX = (x + x2)/2;
			int midY = (y + y2)/2;
			// Add these points to the ArrayList for the trail
			pushToList(new Point(midX, midY), points, pointListSize);
			double[] obj = translatePoint(midX, midY);
			Imgproc.rectangle(src, new Point(x, y), new Point(x2, y2), new Scalar(0, color, 255), 2);
			Imgproc.circle(src, new Point(midX, midY), 4, new Scalar(255, color, 0));
			return convertRange(src, obj, dst_image.cols(), 640.0, dst_image.rows(), 480.0);
		} else {
			foundBall = false;
			return null;
		}
	}

	public void pushToList(Point newPoint, ArrayList<Point> pointList, int listSize) {
		/*
		 * Appends point at beginning of the ArrayList 
		 */
		pointList.add(0, newPoint);
		if(pointList.size() > listSize) pointList.remove(pointList.size() - 1); // Never exceed 10 elements
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

	public double[] translatePoint(double x, double y) { 
		/*
		 * Move origin to the center of the frame
		 */
		double[] translated = {x - dst_image.cols()/2, dst_image.rows()/2 - y};
		return translated;
	}

	public double[] convertRange(Mat src, double[] obj, double old_range, double new_range, double old_range2, double new_range2) {
		/*
		 * Convert range of points in pixels to inches (SysMo input)
		 */
		double[] obj2 = new double[2];
		// Multiply original value by new-old window resolution ratio
		obj2[0] = (obj[0] * (new_range / old_range));
		obj2[1] = (obj[1] * (new_range2 / old_range2));
		// Translate pixels to inches
		obj2[0] *= 12.5/640.0;
		obj2[1] *= 10.625/480.0;
		
		Imgproc.putText(src, "(" + (float)obj2[0] + ", "+ (float)obj2[1] + ")", new Point(10, 30), 2, 1, new Scalar(255, 25, 255), 2);

		return obj2;
	}

	public boolean getFoundBall() {
		return foundBall;
	}
}