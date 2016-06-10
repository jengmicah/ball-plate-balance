package ball_tracker;

import java.awt.event.MouseEvent;

import javax.swing.event.MouseInputAdapter;

/*
 * This class is only used for the initialization stage.
 * The user will input 4 points (the corner points of the object to be transformed)
 * This MouseListener class is what receives and sets the x and y coordinates.
 */
public class MouseListener extends MouseInputAdapter {

	int x = 0, y = 0;
	boolean pointsSet = false; // Shows if all 4 points are initialized
	boolean pointAdded = false; // Shows if 1 point has been initialized

	public void mousePressed(MouseEvent e) {
		if(!pointsSet) { // Are all 4 points initialized?
			x = e.getX()-10; // Set the x and y coordinates equal to the x-y coordinate of the mouse cursor
			y = e.getY()-10; // The -10 confirms at the point is at the tip of the cursor
			pointAdded = true; // 1 point has been added
		}
	}
}