package ball_tracker;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.HashMap;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSlider;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.text.DefaultCaret;

import org.opencv.core.Core;
import org.opencv.videoio.VideoCapture;
import org.opencv.videoio.Videoio;

/*
 * This class just sets up the frames. The control flow of the program references this class only if
 * something is altered on the frame (a slider is moved, or button is pressed)
 */
public class Setup {
	private int camNum = 0;
	private JFrame liveFrame, binFrame, binFrame2, sliderFrame, sliderFrame2, consoleFrame;
	private Panel livePanel, binPanel, binPanel2;
	private JPanel sliderPanel, sliderPanel2, consolePanel;
	private VideoCapture webcam;
	private int videoWidth, videoHeight;
	private boolean run = true;
	public JSlider h_slider1, s_slider1, v_slider1, h_slider2, s_slider2, v_slider2, blur_slider, erode_slider;
	public JSlider h_slider3, s_slider3, v_slider3, h_slider4, s_slider4, v_slider4, blur_slider4, erode_slider4;
	private int h_max = 180; //max hue
	private int s_max = 255; //max saturation
	private int v_max = 255; //max value/brightness
	private int min = 0;
	private JTextField textField;
	private JTextArea console;
	private ChangeListener listener;
	private Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
	private int screenWidth = (int)screenSize.getWidth();
	private int screenHeight = (int)screenSize.getHeight();
	private JButton button;
	private ColorProcessor proc;
	int counter = 0;

	public Setup() {
		//loads opencv library
		System.loadLibrary(Core.NATIVE_LIBRARY_NAME); 
		//a bunch o' frames
		System.setProperty("apple.laf.useScreenMenuBar", "true");
		System.setProperty("com.apple.mrj.application.apple.menu.about.name", "WikiTeX");
		try {UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());} 
		catch (ClassNotFoundException | InstantiationException | IllegalAccessException | UnsupportedLookAndFeelException e) {e.printStackTrace();}
		liveFrame = new JFrame("Live Feed");
		binFrame = new JFrame("Ball"); binFrame2 = new JFrame("Plate");
		sliderFrame = new JFrame("Ball"); sliderFrame2 = new JFrame("Plate");
		consoleFrame = new JFrame("Console");
		//a bunch o' panels
		livePanel = new Panel();
		binPanel = new Panel(); binPanel2 = new Panel();
		sliderPanel = new JPanel(); sliderPanel2 = new JPanel();
		consolePanel = new JPanel();
		//initializing slider values (orange)
		h_slider1 = new JSlider(min, h_max, 0);
		s_slider1 = new JSlider(min, s_max, 150);
		v_slider1 = new JSlider(min, v_max, 75);
		h_slider2 = new JSlider(min, h_max, 180);
		s_slider2 = new JSlider(min, s_max, 218);
		v_slider2 = new JSlider(min, v_max, 255);

		h_slider3 = new JSlider(min, h_max, 0);
		s_slider3 = new JSlider(min, s_max, 150);
		v_slider3 = new JSlider(min, v_max, 75);
		h_slider4 = new JSlider(min, h_max, 180);
		s_slider4 = new JSlider(min, s_max, 218);
		v_slider4 = new JSlider(min, v_max, 255);
		blur_slider = new JSlider(1, 50, 10);
		erode_slider = new JSlider(min, 20, 5);
		//textbox with value of HSV sliders
		textField = new JTextField();
		console = new JTextArea(18,40);
		//button that saves the HSV values into a text file
		button = new JButton("STAHHHHP");
		//load webcam
		loadWebcam();
		//set up each window
<<<<<<< HEAD
		setFrame(liveFrame, livePanel, 0,0, videoWidth+30, videoHeight+60, false);
		setFrame(binFrame, binPanel, videoWidth, 0, videoWidth+30, videoHeight+60, false);
//		setFrame(binFrame2, binPanel2, (int)(screenWidth/1.5), 0, videoWidth+30, videoHeight+60, false);
		setFrame(sliderFrame, sliderPanel,(int)(screenWidth*0.05),(int)(screenHeight/1.8),800,400, false);
//		setFrame(sliderFrame2, sliderPanel2,(int)(screenWidth*0.55),(int)(screenHeight/1.8),800,400, false);
		setFrame(consoleFrame, consolePanel,0,0,700,700, true);
=======
		setFrame(liveFrame, livePanel, screenWidth/2-videoWidth,0, videoWidth+30, videoHeight+60, false);
		setFrame(binFrame, binPanel, screenWidth/2, 0, videoWidth+30, videoHeight+60, false);
		setFrame(sliderFrame, sliderPanel,(int)(screenWidth*0.05),screenHeight/2,1500,500, false);
		setFrame(consoleFrame, consolePanel,0,0,600,600, true);
>>>>>>> 3f4a514fb64b08a5b8b4dd7600515065c36b62f1
		//set up specifically for window with sliders
		setSlider(sliderPanel, sliderFrame, h_slider1, s_slider1, v_slider1, h_slider2, s_slider2, v_slider2);
//		setSlider(sliderPanel2, sliderFrame2, h_slider3, s_slider3, v_slider3, h_slider4, s_slider4, v_slider4);
		//start class does that all the processing
		proc = new ColorProcessor(webcam, run, livePanel, binPanel, binPanel2, h_slider1,s_slider1,v_slider1, h_slider2,s_slider2,v_slider2, h_slider3,s_slider3,v_slider3, h_slider4,s_slider4,v_slider4);
	}

	public void setFrame(JFrame frame, JPanel panel, int x, int y, int width, int height, boolean slide) {
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); //x = close
		frame.setBounds(x, y, width, height); //size + position
		frame.setContentPane(panel); //add panel
		//		frame.setResizable(false);
		frame.setVisible(true);
		frame.addWindowListener(new WindowAdapter() { //what happens when window closes
			public void windowClosing(WindowEvent e) {
				console.append("Exiting..");
				run = false; //stops the loop in SpeedSender
				webcam.release(); //exit webcam
				e.getWindow().dispose();
				System.exit(0);
			}
		});
		if(slide) { 
			console.setEditable(false);
			console.setFont(new Font("Serif", 5, 20));
			DefaultCaret caret = (DefaultCaret)console.getCaret();
			caret.setUpdatePolicy(DefaultCaret.ALWAYS_UPDATE);
			JScrollPane scrollPane = new JScrollPane (console);
			//don't mind this
			button.setVisible(true);
			button.setPreferredSize(new Dimension(200,30));
			button.addActionListener(new ActionListener() { 
				public void actionPerformed(ActionEvent e) {
					console.append("Exiting..");
					run = false; //stops the loop in SpeedSender
					webcam.release(); //exit webcam
					System.exit(0);
				}
			});
			panel.add(scrollPane);
			panel.add(button);
		}
	}

	public void setSlider(JPanel panel, JFrame frame, JSlider h_slider1, JSlider s_slider1, JSlider v_slider1, JSlider h_slider2, JSlider s_slider2, JSlider v_slider2) {
		//sets up position and value of the sliders
		frame.setLayout(new GridLayout(0,2));

		h_slider1.setPaintTicks(true);
		h_slider1.setMajorTickSpacing(h_max);
		addSlider(panel, h_slider1, "Hmin");

		h_slider2.setPaintTicks(true);
		h_slider2.setMajorTickSpacing(h_max);
		addSlider(panel, h_slider2, "Hmax");

		s_slider1.setPaintTicks(true);
		s_slider1.setMajorTickSpacing(s_max);
		addSlider(panel, s_slider1, "Smin");

		s_slider2.setPaintTicks(true);
		s_slider2.setMajorTickSpacing(s_max);
		addSlider(panel, s_slider2, "Smax");

		v_slider1.setPaintTicks(true);
		v_slider1.setMajorTickSpacing(v_max);
		addSlider(panel, v_slider1, "Vmin");

		v_slider2.setPaintTicks(true);
		v_slider2.setMajorTickSpacing(v_max);
		addSlider(panel, v_slider2, "Vmax");
	}

	public void addSlider(JPanel sliderPanel, JSlider slider, String description) {
		slider.setVisible(true);
		JTextField textField = new JTextField();
		JPanel panel = new JPanel();
		JLabel desc = new JLabel(description);
		slider.setName(description);
//		System.out.println(slider.getName());

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
		//		webcam.set(Videoio.CV_CAP_PROP_FRAME_WIDTH, 800); //set resolution of webcam
		//		webcam.set(Videoio.CV_CAP_PROP_FRAME_HEIGHT, 600);
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

	public JTextArea getConsole() {
		return console;
	}
}