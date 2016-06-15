model pointfive
  Modelica.Blocks.Sources.Constant const(k = 0.5) annotation(Placement(visible = true, transformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModelPlug.Boards.Arduino arduino(Port = "COM3") annotation(Placement(visible = true, transformation(origin = {27.609, 16.711}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModelPlug.Pins.Servo servo(Pin = 10) annotation(Placement(visible = true, transformation(origin = {-57.397, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModelPlug.Pins.Servo servo1(Pin = 9) annotation(Placement(visible = true, transformation(origin = {-60, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(servo1.pinConnector, arduino.boardConnector) annotation(Line(visible = true, origin = {1.436, 3.355}, points = {{-51.436, -13.355}, {12.632, -13.355}, {12.632, 13.355}, {26.172, 13.355}}));
  connect(servo.pinConnector, arduino.boardConnector) annotation(Line(visible = true, origin = {2.087, 33.355}, points = {{-49.484, 16.645}, {11.981, 16.645}, {11.981, -16.645}, {25.522, -16.645}}));
  connect(const.y, servo1.u) annotation(Line(visible = true, origin = {-73.756, 5}, points = {{-5.244, 15}, {0.744, 15}, {0.744, -15}, {3.756, -15}}, color = {0, 0, 127}));
  connect(const.y, servo.u) annotation(Line(visible = true, origin = {-71.804, 35}, points = {{-7.196, -15}, {1.394, -15}, {1.394, 15}, {4.407, 15}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end pointfive;
