package ball_tracker;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

/*
 * This sends packets of data with the x-coordinate of the object being tracked to the indicated server port, which
 * is intended to be a userInput into SystemModeler
 * 
 * "C:\Program Files\Java\jre1.8.0_91\bin\javaw.exe" -Djava.library.path=C:\lib\opencv\build\java;C:\lib\opencv\build\java\x64;C:\lib\opencv\build\java\x64 -Dfile.encoding=Cp1252 -classpath C:\Projects\Arturo\Internship\bin;C:\lib\opencv\build\java\opencv-310.jar ball_tracker.SpeedSender 127.0.0.1 56953
 */

public class SpeedSender {
	//comment out this main method to communicate with SysMo
//		public static void main(String[] args){
//			Setup f = new Setup(); //begins ColorFiltering
//			double[] userInput = new double[2];
//			while(f.isRun() && f.getWebcam().isOpened() && f.getProc() != null){ //while the windows and webcam are open
//				userInput = f.getProc().process();	//run the color filtering method in ColorProcessor
//				if(f.getProc().getFoundBall()) {
//					f.getConsole().append("[" + userInput[0] + ", " + userInput[1] + "]\n");
//				}
//			}			
//		}
	public static void main(String[] args) throws IOException, InterruptedException {

		Setup f = new Setup(); //begin setup

		if (args.length != 2) { // Validate that the user input server IP and port
			f.getConsole().append("Usage: java SpeedSender <host name> <port number>\n");
			System.exit(1);
		}
		String host = args[0]; // First set of numbers (127.0.0.1) is the IP of the host that the server is running on
		int port = Integer.parseInt(args[1]); // Second set (#####) is the port that the server is listening to


		try (Socket socket = new Socket(host, port); // Establish connection to specified port	
				PrintWriter out = new PrintWriter(socket.getOutputStream(), true);){ // Open output stream to the socket

			f.getConsole().append("Connected to " + host + " on port " + port + "\n");
			double[] userInput;
			String hexString, command, tcppackage; // Variables for socket-server communication			

			while(f.isRun() && f.getWebcam().isOpened() && f.getProc() != null){ // Make sure all components are running
				userInput = f.getProc().process(); // Get inputs
				if(f.getProc().getFoundBall()) { // If ball is on screen, send coordinates

					/*
					 * Send ball x coordinate
					 */
					tcppackage = "setInputValues({\"X\", " + userInput[0] + "})"; // Sets destination + input value
					hexString = String.format("01030000%02X000000", tcppackage.length()); // Sets data in hex
					command = hexToASCII(hexString)+ tcppackage; // Socket client sends data to server in ASCII codes
					out.print(command); // Send data to server
					out.flush(); // Make sure all data is sent (sends out all data in buffer)
					f.getConsole().append("x-coordinate: " + userInput[0]);

					/*
					 * Send ball y coordinate
					 */
					tcppackage = "setInputValues({\"Y\", " + userInput[1] + "})";
					hexString = String.format("01030000%02X000000", tcppackage.length());
					command = hexToASCII(hexString)+ tcppackage;
					out.print(command);
					out.flush();
					f.getConsole().append("     y-coordinate: " + userInput[1] + "\n");

					Thread.sleep(50);
				}
			}
			out.close();
			socket.close();
			f.getConsole().append("Exiting");
		} catch (UnknownHostException e) {
			f.getConsole().append("Don't know about host " + host);
			System.exit(1);
		} catch (IOException e) {
			f.getConsole().append("Couldn't get I/O for the connection to " + host);
			System.exit(1);
		} 
	}

	private static String hexToASCII(String hexValue){ //uh.
		StringBuilder output = new StringBuilder("");
		for (int i = 0; i < hexValue.length(); i += 2)
		{
			String str = hexValue.substring(i, i + 2);
			output.append((char) Integer.parseInt(str, 16));
		}
		return output.toString();
	}
}

//BufferedReader in = new BufferedReader(new InputStreamReader(echoSocket.getInputStream()));
//BufferedReader stdIn = new BufferedReader(new InputStreamReader(System.in))
//char[] buf = new char[255];
//String response;
//System.out.println(userInput[0]);
//tcppackage = "setInputValues({\"userInput\", " + userInput[0] + "})";
//hexString = String.format("01030000%02X000000", tcppackage.length());
//System.out.println(hexString);
//command = hexToASCII(hexString)+ tcppackage;
//System.out.println("hex String: "+ hexString+"|");
//System.out.println("Ascii String: " + command+"|");
//out.print(command);
//out.flush();
//buf = new char[255];
//in.read(buf,0,255);
//response = new String(buf);
//System.out.println("received: " + response );