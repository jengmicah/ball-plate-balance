package path_generator;
import org.opencv.core.Mat;
import org.opencv.core.Point;
import org.opencv.core.Scalar;
import org.opencv.imgproc.Imgproc;
import org.opencv.videoio.VideoCapture;

/*
 * All the processing is done here. Isolate certain colors and detect the midpoints of the blobs.
 */
public class ColorProcessor {

	private Mat img1;
	private Panel livePanel;
	private VideoCapture webcam;
	private boolean run;
	int counter = 1;
	MyListener myListener;
	
	public ColorProcessor(VideoCapture webcam, boolean run, Panel livePanel, MyListener myListener) {
		this.webcam = webcam;
		this.livePanel = livePanel;
		this.run = run;
		this.myListener = myListener;
		img1 = new Mat();
		
		process();
	}

	public void process() {
		while(run) {
			webcam.read(img1); //read one frame
			if(img1 != null && !img1.empty()) { //if a frame is captured
				Imgproc.circle(img1, new Point(myListener.getXVal(), myListener.getYVal()), 5, new Scalar(255,0,0), -1);
				livePanel.setImageWithMat(img1);
				livePanel.repaint();
			}
		}
	}
}