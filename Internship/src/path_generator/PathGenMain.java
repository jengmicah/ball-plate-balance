package path_generator;
import java.awt.Dimension;
import java.awt.Toolkit;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

import org.opencv.core.Core;
import org.opencv.videoio.VideoCapture;
import org.opencv.videoio.Videoio;

/*
 * This class just sets up the frames. The control flow of the program references this class only if
 * something is altered on the frame (a slider is moved, or button is pressed)
 */

public class PathGenMain {
	private int camNum = 0;
	private JFrame liveFrame;
	private Panel livePanel;
	private static VideoCapture webcam;
	private int videoWidth, videoHeight;
	private static boolean run = true;
	private Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
	private int screenWidth = (int)screenSize.getWidth();
	private int screenHeight = (int)screenSize.getHeight();
	MyListener myListener;
	
	public PathGenMain() {
		//loads opencv library
		System.loadLibrary(Core.NATIVE_LIBRARY_NAME); 
		//a bunch o' frames
		liveFrame = new JFrame("Live Feed");
		//		binFrame = new JFrame("Threshold");
		//a bunch o' panels
		livePanel = new Panel();
		//		binPanel = new Panel();
		//load webcam (lolz)
		loadWebcam();
		//set up each window
		myListener = new MyListener();
		setFrame(liveFrame, livePanel, screenWidth/2-videoWidth,0, videoWidth+30, videoHeight+60, true);
		//		setFrame(binFrame, binPanel, screenWidth/2, 0, videoWidth+45, videoHeight+75, false);
		//start class does that all the processing
		new ColorProcessor(webcam, run, livePanel, myListener);
	}

	public void setFrame(JFrame frame, JPanel panel, int x, int y, int width, int height, boolean mouse) {
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); //x = close
//		panel.setSize(width, height);
		frame.setResizable(false);
		frame.setBounds(x, y, width, height); //size + position
		frame.setContentPane(panel); //add panel
		frame.setVisible(true);
		frame.addWindowListener(new WindowAdapter() { //what happens when window closes
			public void windowClosing(WindowEvent e) {
				System.out.println("Exiting..");
				run = false; //stops the loop in SpeedSender
				webcam.release(); //exit webcam
				e.getWindow().dispose();
			}
		});
		livePanel.addMouseListener(myListener);
		livePanel.addMouseMotionListener(myListener);
	}

	public void loadWebcam() {
		webcam = new VideoCapture();
		webcam.open(camNum); //turn on the webcam 
		//		webcam.set(Videoio.CV_CAP_PROP_FRAME_WIDTH, 640); //set resolution of webcam
		//		webcam.set(Videoio.CV_CAP_PROP_FRAME_HEIGHT, 480);
		videoWidth = (int)webcam.get(Videoio.CV_CAP_PROP_FRAME_WIDTH);
		videoHeight = (int)webcam.get(Videoio.CV_CAP_PROP_FRAME_HEIGHT);
		System.out.println(videoWidth); System.out.println(videoHeight);
		if(webcam.isOpened()) { System.out.println("Found webcam: " + webcam.toString()); } //check if webcam has been turned on
		else { JOptionPane.showMessageDialog(null,"Webcam was not detected\nShutting down..."); System.exit(0); }
	}

	public VideoCapture getWebcam() {
		return webcam;
	}

	public static void main(String args[]) {
		new PathGenMain();
	}
}