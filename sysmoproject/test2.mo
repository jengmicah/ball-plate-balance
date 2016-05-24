model test2
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = true, g = 0) annotation(Placement(visible = true, transformation(origin = {-100, 65}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation(Placement(visible = true, transformation(origin = {-136.987, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(useAxisFlange = true, n = {1, 0, 0}) annotation(Placement(visible = true, transformation(origin = {-60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox1(length = 2, width = 2, height = .1, lengthDirection = to_unit1(r - r_shape)) annotation(Placement(visible = true, transformation(origin = {-10, -32.46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Position position annotation(Placement(visible = true, transformation(origin = {-75, 12.018}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine annotation(Placement(visible = true, transformation(origin = {-107.836, 15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine1(freqHz = .5) annotation(Placement(visible = true, transformation(origin = {7.164, 35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Position position1 annotation(Placement(visible = true, transformation(origin = {40, 32.018}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {-1, -1, 0}) annotation(Placement(visible = true, transformation(origin = {50, -35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox(length = 2, width = 2, height = .1, color = {255, 0, 0}) annotation(Placement(visible = true, transformation(origin = {135, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n = {1, 0, 0}, useAxisFlange = true) annotation(Placement(visible = true, transformation(origin = {76.624, -29.675}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(r = {0, 0, 0}, angle = 90, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis, n = {0, 0, 1}) annotation(Placement(visible = true, transformation(origin = {20, -35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(bodyBox1.frame_b, fixedRotation.frame_a) annotation(Line(visible = true, origin = {5.994, -33.73}, points = {{-5.994, 1.27}, {0.994, 1.27}, {0.994, -1.27}, {4.006, -1.27}}));
  connect(fixedRotation.frame_b, fixedTranslation.frame_a) annotation(Line(visible = true, origin = {35, -35}, points = {{-5, 0}, {5, 0}}));
  connect(revolute.frame_b, bodyBox.frame_a) annotation(Line(visible = true, origin = {113.793, -29.837}, points = {{-27.169, 0.162}, {7.981, 0.162}, {7.981, -0.162}, {11.207, -0.163}}));
  connect(fixedTranslation.frame_b, revolute.frame_a) annotation(Line(visible = true, origin = {63.462, -32.337}, points = {{-3.462, -2.663}, {0.15, -2.663}, {0.15, 2.663}, {3.162, 2.663}}));
  connect(sine1.y, position1.phi_ref) annotation(Line(visible = true, origin = {24.041, 33.509}, points = {{-5.877, 1.491}, {0.959, 1.491}, {0.959, -1.491}, {3.959, -1.491}}, color = {0, 0, 127}));
  connect(position1.flange, revolute.axis) annotation(Line(visible = true, origin = {67.749, 14.787}, points = {{-17.749, 17.231}, {8.875, 17.231}, {8.875, -34.462}}));
  connect(position.flange, revolute1.axis) annotation(Line(visible = true, origin = {-61.667, 1.345}, points = {{-3.333, 10.673}, {1.667, 10.673}, {1.667, -21.345}}));
  connect(sine.y, position.phi_ref) annotation(Line(visible = true, origin = {-90.959, 13.509}, points = {{-5.877, 1.491}, {0.959, 1.491}, {0.959, -1.491}, {3.959, -1.491}}, color = {0, 0, 127}));
  connect(revolute1.frame_b, bodyBox1.frame_a) annotation(Line(visible = true, origin = {-29.112, -31.23}, points = {{-20.888, 1.23}, {5.887, 1.23}, {5.887, -1.23}, {9.112, -1.23}}));
  connect(fixed.frame_b, revolute1.frame_a) annotation(Line(visible = true, origin = {-98.494, -30}, points = {{-28.494, 0}, {28.494, -0}}));
  annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end test2;
