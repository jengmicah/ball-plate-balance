# Ball Plate Balancing System

Demo can be found [here](https://www.youtube.com/watch?v=LUU5mwL9HSI).

Using a closed feedback loop, this system is capable of balancing a ball at any point on the plane. We modified a BRIO labyrinth game by attaching two position servos to the knobs that control plate rotations over the x and z-axis. This is wired to an Arduino UNO. On the computer, the system is being modeled and simulated in SystemModeler. With a camera mounted above the rotating platform, a Java OpenCV application filters the HSV color space to detect the position of the ball's centroid with respect to the plate (a perspective transformation may be needed for more accurate results depending on parallax error). This application then sends TCP/IP packets containing the position of the ball over the network to the port of the running SystemModeler simulation. The model then responds to the ball's movement and commands servo rotations respectively. The rotation of the servo moves the ball and the loop continues.

Requires a licensed version of SystemModeler and Java's OpenCV 3.1.0 wrapper.
