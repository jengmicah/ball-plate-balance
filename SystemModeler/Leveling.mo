model Leveling
  ModelPlug.Pins.Servo servo(Pin = 10) annotation(Placement(visible = true, transformation(origin = {-33.075, 26.925}, extent = {{-26.925, -26.925}, {26.925, 26.925}}, rotation = 0)));
  ModelPlug.Pins.Servo servo1(Pin = 9) annotation(Placement(visible = true, transformation(origin = {-32.5, -32.5}, extent = {{-27.5, -27.5}, {27.5, 27.5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0.5) annotation(Placement(visible = true, transformation(origin = {-112.458, 27.542}, extent = {{-22.458, -22.458}, {22.458, 22.458}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0.5) annotation(Placement(visible = true, transformation(origin = {-111.638, -31.638}, extent = {{-21.638, -21.638}, {21.638, 21.638}}, rotation = 0)));
  ModelPlug.Boards.Arduino arduino(Port = "COM5") annotation(Placement(visible = true, transformation(origin = {79.202, -19.202}, extent = {{-29.202, -29.202}, {29.202, 29.202}}, rotation = 0)));
equation
  connect(servo1.pinConnector, arduino.boardConnector) annotation(Line(visible = true, origin = {41.261, -25.851}, points = {{-46.261, -6.649}, {4.16, -6.649}, {4.16, 6.649}, {37.941, 6.649}}));
  connect(arduino.boardConnector, servo.pinConnector) annotation(Line(visible = true, origin = {39.578, 3.861}, points = {{39.624, -23.063}, {3.053, -23.063}, {3.053, 23.063}, {-45.729, 23.063}}));
  connect(servo1.u, const1.y) annotation(Line(visible = true, origin = {-79.377, -32.069}, points = {{19.377, -0.431}, {-5.459, -0.431}, {-5.459, 0.431}, {-8.459, 0.431}}, color = {0, 0, 127}));
  connect(const.y, servo.u) annotation(Line(visible = true, origin = {-68.455, 27.233}, points = {{-19.299, 0.309}, {5.422, 0.309}, {5.422, -0.309}, {8.455, -0.309}}, color = {0, 0, 127}));
  annotation(experiment(StopTime = 100.0, Interval = 0.01, __Wolfram_SynchronizeWithRealTime = true), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Leveling;
