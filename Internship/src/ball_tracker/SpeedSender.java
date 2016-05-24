package ball_tracker;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

/*
 * This sends packets of data with the x-coordinate of the object being tracked to the indicated server port, which
 * is intended to be a userInput into SystemModeler
 * 
 * "C:\Program Files\Java\jre1.8.0_91\bin\javaw.exe" -Djava.library.path=C:\lib\opencv\build\java;C:\lib\opencv\build\java\x64;C:\lib\opencv\build\java\x64 -Dfile.encoding=Cp1252 -classpath C:\Projects\Arturo\InternshipSoftware\bin;C:\lib\opencv\build\java\opencv-310.jar ball_tracker.SpeedSender 127.0.0.1 56953
 */

public class SpeedSender {
	//comment out this main method to communicate with SysMo
	public static void main(String[] args){
		Setup f = new Setup(); //begins ColorFiltering
		String userInput;

		while(f.isRun() && f.getWebcam().isOpened() && f.getProc() != null){ //while the windows and webcam are open
			userInput = f.getProc().process() + "";	//run the color filtering method in ColorProcessor
			System.out.println(userInput);
		}			
	}
	//		public static void main(String[] args) throws IOException, InterruptedException {
	//			if (args.length != 2) {
	//				System.err.println("Usage: java EchoClient <host name> <port number>");
	//				System.exit(1);
	//			}
	//	
	//			String hostName = args[0];
	//			int portNumber = Integer.parseInt(args[1]);
	//	
	//			Setup f = new Setup(); //begins ColorFiltering
	//	
	//			try (
	//					Socket echoSocket = new Socket(hostName, portNumber);
	//					PrintWriter out = new PrintWriter(echoSocket.getOutputStream(), true);
	//					BufferedReader in = new BufferedReader(new InputStreamReader(echoSocket.getInputStream()));
	//					BufferedReader stdIn = new BufferedReader(new InputStreamReader(System.in))
	//					){
	//				String userInput;
	//				String hexString;
	//				String command;
	//				char[] buf = new char[255];
	//				String response;
	//				String tcppackage;
	//	
	//				while(f.isRun() && f.getWebcam().isOpened() && f.getProc() != null){					
	//					userInput = f.getProc().process() + "";
	//					System.out.println(userInput);
	//					tcppackage = "setInputValues({\"userInput\", " + userInput + "})";
	//					hexString = String.format("01030000%02X000000", tcppackage.length());
	//					System.out.println(hexString);
	//					command = hexToASCII(hexString)+ tcppackage;
	//					System.out.println("hex String: "+ hexString+"|");
	//					System.out.println("Ascii String: " + command+"|");
	//					out.print(command);
	//					out.flush();
	//					buf = new char[255];
	//					in.read(buf,0,255);
	//					response = new String(buf);
	//					System.out.println("received: " + response );
	//					Thread.sleep(50);
	//				}
	//			} catch (UnknownHostException e) {
	//				System.err.println("Don't know about host " + hostName);
	//				System.exit(1);
	//			} catch (IOException e) {
	//				System.err.println("Couldn't get I/O for the connection to " +
	//						hostName);
	//				System.exit(1);
	//			} 
	//		}

	private static String hexToASCII(String hexValue){
		StringBuilder output = new StringBuilder("");
		for (int i = 0; i < hexValue.length(); i += 2)
		{
			String str = hexValue.substring(i, i + 2);
			output.append((char) Integer.parseInt(str, 16));
		}
		return output.toString();
	}
}