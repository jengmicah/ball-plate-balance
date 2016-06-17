import java.awt.Dimension;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.Toolkit;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

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
 * This class just sets up the frames. The control flow of the program goes to this class only if
 * something is altered on the frame (a slider is moved, or button is pressed)
 */
public class Setup {
	private int camNum = 0;
	private JFrame liveFrame, binFrame, sliderFrame, consoleFrame;
	private Panel livePanel, binPanel;
	private JPanel sliderPanel, consolePanel;
	private VideoCapture webcam;
	private int videoWidth, videoHeight;
	private boolean run = true;
	private JSlider h_slider1, s_slider1, v_slider1, h_slider2, s_slider2, v_slider2;
	private int h_max = 180; // Max hue
	private int s_max = 255; // Max saturation
	private int v_max = 255; // Max value/brightness
	private int min = 0;
	private JTextArea console;
	private ChangeListener listener;
	private Processor proc;
	private MouseListener mouselistener;
	Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
	int screenWidth = (int)screenSize.getWidth();
	int screenHeight = (int)screenSize.getHeight();

	public Setup() {
		// Load OpenCV library
		System.loadLibrary(Core.NATIVE_LIBRARY_NAME); 
		// JFrames
		System.setProperty("apple.laf.useScreenMenuBar", "true");
		System.setProperty("com.apple.mrj.application.apple.menu.about.name", "WikiTeX");
		try {UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());} 
		catch (ClassNotFoundException | InstantiationException | IllegalAccessException | UnsupportedLookAndFeelException e) {e.printStackTrace();}
		liveFrame = new JFrame("Source");
		binFrame = new JFrame("Binary");
		sliderFrame = new JFrame("Sliders");
		consoleFrame = new JFrame("Console");
		// JPanels
		livePanel = new Panel();
		binPanel = new Panel();
		sliderPanel = new JPanel();
		consolePanel = new JPanel();
		// Initial slider values (orange)
		h_slider1 = new JSlider(min, h_max, 0);
		s_slider1 = new JSlider(min, s_max, 150);
		v_slider1 = new JSlider(min, v_max, 75);
		h_slider2 = new JSlider(min, h_max, 180);
		s_slider2 = new JSlider(min, s_max, 255);
		v_slider2 = new JSlider(min, v_max, 255);
		// Text box with value of HSV sliders
		console = new JTextArea(17,40);
		mouselistener = new MouseListener();
		// Set up webcam
		loadWebcam();
		// Set up each JFrame with the correct settings
		setFrame(liveFrame, livePanel, 0,screenHeight/2 - 20, videoWidth+30, videoHeight+60, false, true, true);
		setFrame(binFrame, binPanel, videoWidth, screenHeight/2 - 20, videoWidth+30, videoHeight+60, false, false, true);
		setFrame(consoleFrame, consolePanel,1250,screenHeight/2 - 20,videoWidth+30,videoHeight+60, true, false, true);
		// Set up specifically for slider window
		setFrame(sliderFrame, sliderPanel,(int)(screenWidth*0.05),(int)(screenHeight/1.8),800,400, false, false, false);
		setSlider(sliderPanel, sliderFrame, h_slider1, s_slider1, v_slider1, h_slider2, s_slider2, v_slider2);
		// Start processing once all windows are set up
		proc = new Processor(webcam, run, livePanel, binPanel, h_slider1,s_slider1,v_slider1, h_slider2,s_slider2,v_slider2, mouselistener);
	}

	public void setFrame(JFrame frame, JPanel panel, int x, int y, int width, int height, boolean isConsole, boolean hasMouse, boolean isVisible) {
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // x = close
		frame.setBounds(x, y, width, height); // Size + position
		frame.setContentPane(panel);
		frame.addWindowListener(new WindowAdapter() { // When window closes...
			public void windowClosing(WindowEvent e) {
				console.append("Exiting..");
				run = false; // Stop loop
				webcam.release();
				e.getWindow().dispose();
				System.exit(0);
			}
		});
		if(isVisible) frame.setVisible(true);
		if(hasMouse) panel.addMouseListener(mouselistener);
		if(isConsole) { 
			console.setEditable(false); console.setFont(new Font("Serif", 5, 20));
			DefaultCaret caret = (DefaultCaret)console.getCaret();
			caret.setUpdatePolicy(DefaultCaret.ALWAYS_UPDATE);
			JScrollPane scrollPane = new JScrollPane(console);
			panel.add(scrollPane);
		}
	}

	public void setSlider(JPanel panel, JFrame frame, JSlider h_slider1, JSlider s_slider1, JSlider v_slider1, JSlider h_slider2, JSlider s_slider2, JSlider v_slider2) {
		// Set up position and value of the sliders
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
		webcam.open(camNum);
		webcam.set(Videoio.CV_CAP_PROP_FRAME_WIDTH, 640); //set resolution of webcam
		webcam.set(Videoio.CV_CAP_PROP_FRAME_HEIGHT, 480);
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

	public Processor getProc() {
		return proc;
	}

	public JTextArea getConsole() {
		return console;
	}
}