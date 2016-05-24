package path_generator;

import java.awt.event.MouseEvent;

import javax.swing.event.MouseInputAdapter;

public class MyListener extends MouseInputAdapter {
	
	private int xVal, yVal;
	
	public void mousePressed(MouseEvent e) {
		int x = e.getX()-10, y = e.getY()-10;
		setXVal(x);
		setYVal(y);
		System.out.println("(" + x + "," + y + ")");
	}

	public void mouseDragged(MouseEvent e) {
		// do your code
	}

	public void mouseReleased(MouseEvent e) {
		// reset your variables
	}

	public int getYVal() {return yVal;}
	public void setYVal(int yVal) {this.yVal = yVal;}
	public int getXVal() {return xVal;}
	public void setXVal(int xVal) {this.xVal = xVal;}
}