package ball_tracker;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JSlider;
import javax.swing.JTextField;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

import org.opencv.core.Core;
import org.opencv.videoio.VideoCapture;
import org.opencv.videoio.Videoio;

/*
 * This class just sets up the frames. The control flow of the program references this class only if
 * something is altered on the frame (a slider is moved, or button is pressed)
 */
public class Setup {
	private int camNum = 0;
	private JFrame liveFrame, binFrame, sliderFrame;
	private Panel livePanel, binPanel;
	private VideoCapture webcam;
	private int videoWidth, videoHeight;
	private boolean run = true;
	private JSlider h_slider, s_slider, v_slider, h_slider2, s_slider2, v_slider2, blur_slider, erode_slider;
	private int h_max = 180; //max hue
	private int s_max = 255; //max saturation
	private int v_max = 255; //max value/brightness
	private int min = 0;
	private JPanel sliderPanel;
	private JTextField textField;
	private ChangeListener listener;
	private Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
	private int screenWidth = (int)screenSize.getWidth();
	private int screenHeight = (int)screenSize.getHeight();
	private JButton button;
	private ColorProcessor proc;
	private MyListener myListener;

	public Setup() {
		//loads opencv library
		System.loadLibrary(Core.NATIVE_LIBRARY_NAME); 
		//a bunch o' frames
		liveFrame = new JFrame("Live Feed");
		binFrame = new JFrame("Threshold");
		sliderFrame = new JFrame("Slider");
		//a bunch o' panels
		livePanel = new Panel();
		binPanel = new Panel();
		sliderPanel = new JPanel();
		//initializing slider values (blue)
		h_slider = new JSlider(min, h_max, 95);
		s_slider = new JSlider(min, s_max, 150);
		v_slider = new JSlider(min, v_max, 75);
		h_slider2 = new JSlider(min, h_max, 145);
		s_slider2 = new JSlider(min, s_max, 255);
		v_slider2 = new JSlider(min, v_max, 255);
		blur_slider = new JSlider(1, 50, 10);
		erode_slider = new JSlider(min, 20, 5);
		//textbox with value of HSV sliders
		textField = new JTextField();
		//button that saves the HSV values into a text file
		button = new JButton("Save");
		myListener = new MyListener();
		//load webcam (lolz)
		loadWebcam();
		//set up each window
		setFrame(liveFrame, livePanel, screenWidth/2-videoWidth,0, videoWidth+30, videoHeight+60, true);
		setFrame(binFrame, binPanel, screenWidth/2, 0, videoWidth+30, videoHeight+60, false);
		setFrame(sliderFrame, sliderPanel,(int)(screenWidth*0.05),screenHeight/2,(int)(screenWidth/1.1),400, false);
		//set up specifically for window with sliders
		setSlider(sliderFrame, sliderPanel, textField);
		//start class does that all the processing
		proc = new ColorProcessor(webcam, run, livePanel, binPanel, h_slider, s_slider, v_slider, h_slider2, s_slider2, v_slider2, blur_slider, erode_slider, myListener);
	}

	public void setFrame(JFrame frame, JPanel panel, int x, int y, int width, int height, boolean listen) {
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); //x = close
		frame.setBounds(x, y, width, height); //size + position
		frame.setContentPane(panel); //add panel
		frame.setResizable(false);
		frame.setVisible(true);
		frame.addWindowListener(new WindowAdapter() { //what happens when window closes
			public void windowClosing(WindowEvent e) {
				System.out.println("Exiting..");
				run = false; //stops the loop in SpeedSender
				webcam.release(); //exit webcam
				e.getWindow().dispose();
			}
		});
		//		if(listen) {
		//			frame.addMouseListener(myListener);
		//			frame.addMouseMotionListener(myListener);
		//		}
	}

	public void setSlider(JFrame frame, JPanel panel1, JTextField textField) {
		//sets up position and value of the sliders
		frame.setLayout(new GridLayout(0,2));
		h_slider.setPaintTicks(true);
		h_slider.setMajorTickSpacing(h_max);
		addSlider(h_slider, "Hmin");

		h_slider2.setPaintTicks(true);
		h_slider2.setMajorTickSpacing(h_max);
		addSlider(h_slider2, "Hmax");

		s_slider.setPaintTicks(true);
		s_slider.setMajorTickSpacing(s_max);
		addSlider(s_slider, "Smin");

		s_slider2.setPaintTicks(true);
		s_slider2.setMajorTickSpacing(s_max);
		addSlider(s_slider2, "Smax");

		v_slider.setPaintTicks(true);
		v_slider.setMajorTickSpacing(v_max);
		addSlider(v_slider, "Vmin");

		v_slider2.setPaintTicks(true);
		v_slider2.setMajorTickSpacing(v_max);
		addSlider(v_slider2, "Vmax");

		blur_slider.setPaintTicks(true);
		blur_slider.setMajorTickSpacing(50);
		addSlider(blur_slider, "Matt's Special Blur");

		erode_slider.setPaintTicks(true);
		erode_slider.setMajorTickSpacing(20);
		addSlider(erode_slider, "Erode");

		//don't mind this
		button.setVisible(true);
		button.setPreferredSize(new Dimension(100,100));
		button.addActionListener(new ActionListener() { 
			public void actionPerformed(ActionEvent e) { 
				BufferedWriter out = null;
				try {
					File file = new File("myfile.txt");
					if (!file.exists()) {file.createNewFile();}

					out = new BufferedWriter(new FileWriter(file));
					out.write("Hmin: " + h_slider.getValue()); out.newLine();
					out.write("Hmax: " + h_slider2.getValue()); out.newLine();
					out.write("Smin: " + s_slider.getValue()); out.newLine();
					out.write("Smax: " + s_slider2.getValue()); out.newLine();
					out.write("Vmin: " + v_slider.getValue()); out.newLine();
					out.write("Vmax: " + v_slider2.getValue()); out.newLine();
					out.write("Matt's Special Blur: " + blur_slider.getValue()); out.newLine();
					out.write("ErosionSize: " + erode_slider.getValue());
					out.flush();
					out.close();
				} catch (IOException ioe) {
					ioe.printStackTrace();
				}
			}
		});
		sliderPanel.add(button);
	}

	public void addSlider(JSlider slider, String description) {
		JTextField textField = new JTextField();
		JPanel panel = new JPanel();
		JLabel desc = new JLabel(description);

		listener = new ChangeListener(){ // common listener for all sliders
			public void stateChanged(ChangeEvent event){
				JSlider source = (JSlider) event.getSource(); // update text field when the slider value changes
				textField.setText("" + source.getValue());
			}
		}; //this block must be after the local declaration of textField but before panel adds textField

		slider.addChangeListener(listener);
		desc.setFont(new Font("SansSerif", Font.BOLD, 20));	
		textField.setColumns(3);
		textField.setFont(new Font("SansSerif", Font.BOLD, 20));
		panel.add(slider);
		panel.add(desc);
		panel.add(textField);

		sliderPanel.add(panel);
	}

	public void loadWebcam() {
		webcam = new VideoCapture();
		webcam.open(camNum); //turn on the webcam 
		//		webcam.set(Videoio.CV_CAP_PROP_FRAME_WIDTH, 640); //set resolution of webcam
		//		webcam.set(Videoio.CV_CAP_PROP_FRAME_HEIGHT, 480);
		videoWidth = (int)webcam.get(Videoio.CV_CAP_PROP_FRAME_WIDTH);
		videoHeight = (int)webcam.get(Videoio.CV_CAP_PROP_FRAME_HEIGHT);
		if(webcam.isOpened()) { System.out.println("Found webcam: " + webcam.toString()); } //check if webcam has been turned on
		else { JOptionPane.showMessageDialog(null,"Webcam was not detected\nShutting down..."); System.exit(0); }
		webcam.set(Videoio.CAP_PROP_FPS, 60.0);
	}

	public VideoCapture getWebcam() {
		return webcam;
	}

	public boolean isRun() {
		return run;
	}

	public ColorProcessor getProc() {
		return proc;
	}

	public void setProc(ColorProcessor proc) {
		this.proc = proc;
	}
}