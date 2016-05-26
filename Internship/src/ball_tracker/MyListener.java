package ball_tracker;

import java.awt.event.MouseEvent;

import javax.swing.event.MouseInputAdapter;

public class MyListener extends MouseInputAdapter {

	private int xVal, yVal;
	int counter = 1;

	public void mousePressed(MouseEvent e) {
		if(counter <= 2) {
			int x = e.getX()-13, y = e.getY()-46;
			setXVal(x);
			setYVal(y);
			System.out.println("(" + x + "," + y + ")");
			counter++;
		}
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