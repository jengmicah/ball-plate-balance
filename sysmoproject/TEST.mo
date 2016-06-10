package TEST
  model Platform
    inner Modelica.Mechanics.MultiBody.World world(animateGravity = true, g = 0) annotation(Placement(visible = true, transformation(origin = {-127.284, 87.087}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation(Placement(visible = true, transformation(origin = {-136.987, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(useAxisFlange = true, n = {1, 0, 0}) annotation(Placement(visible = true, transformation(origin = {-60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Sources.Position position annotation(Placement(visible = true, transformation(origin = {-75, 12.018}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Sine sine annotation(Placement(visible = true, transformation(origin = {-105, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Sine sine1(freqHz = .5) annotation(Placement(visible = true, transformation(origin = {-5, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Sources.Position position1 annotation(Placement(visible = true, transformation(origin = {25, -5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {-1, -.9, 0}) annotation(Placement(visible = true, transformation(origin = {50, -35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n = {1, 0, 0}, useAxisFlange = true) annotation(Placement(visible = true, transformation(origin = {90, -35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox2(length = 2, width = 2, height = .1) annotation(Placement(visible = true, transformation(origin = {-15, -35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(r = {0, 0, 0}, angle = 90, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis, n = {0, 0, 1}) annotation(Placement(visible = true, transformation(origin = {20, -35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox3(length = 2, width = 2, height = .1, color = {255, 0, 0}) annotation(Placement(visible = true, transformation(origin = {127.992, -35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(revolute.frame_b, bodyBox3.frame_a) annotation(Line(visible = true, origin = {108.996, -35}, points = {{-8.996, 0}, {8.996, 0}}));
    connect(bodyBox2.frame_b, fixedRotation.frame_a) annotation(Line(visible = true, origin = {2.5, -35}, points = {{-7.5, 0}, {7.5, 0}}));
    connect(revolute1.frame_b, bodyBox2.frame_a) annotation(Line(visible = true, origin = {-32.862, -32.5}, points = {{-17.138, 2.5}, {4.637, 2.5}, {4.637, -2.5}, {7.862, -2.5}}));
    connect(fixedRotation.frame_b, fixedTranslation.frame_a) annotation(Line(visible = true, origin = {35, -35}, points = {{-5, 0}, {5, 0}}));
    connect(position1.flange, revolute.axis) annotation(Line(visible = true, origin = {71.667, -11.667}, points = {{-36.667, 6.667}, {18.333, 6.667}, {18.333, -13.333}}));
    connect(position.flange, revolute1.axis) annotation(Line(visible = true, origin = {-61.667, 1.345}, points = {{-3.333, 10.673}, {1.667, 10.673}, {1.667, -21.345}}));
    connect(sine.y, position.phi_ref) annotation(Line(visible = true, origin = {-90.25, 36.009}, points = {{-3.75, 23.991}, {0.25, 23.991}, {0.25, -23.991}, {3.25, -23.991}}, color = {0, 0, 127}));
    connect(sine1.y, position1.phi_ref) annotation(Line(visible = true, origin = {9.75, 12.5}, points = {{-3.75, 17.5}, {0.25, 17.5}, {0.25, -17.5}, {3.25, -17.5}}, color = {0, 0, 127}));
    connect(fixedTranslation.frame_b, revolute.frame_a) annotation(Line(visible = true, origin = {70, -35}, points = {{-10, 0}, {10, 0}}));
    connect(fixed.frame_b, revolute1.frame_a) annotation(Line(visible = true, origin = {-98.494, -30}, points = {{-28.494, 0}, {28.494, -0}}));
    annotation(experiment(__Wolfram_SynchronizeWithRealTime = false), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end Platform;

  model BallBalance
    Modelica.Blocks.Continuous.Der der1 annotation(Placement(visible = true, transformation(origin = {-140, 58.061}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Gain p(k = 0.352277) annotation(Placement(visible = true, transformation(origin = {-97.116, 98.352}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Gain d(k = 0.295788) annotation(Placement(visible = true, transformation(origin = {-57.498, 58.072}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Add add annotation(Placement(visible = true, transformation(origin = {-25, 88.28}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Continuous.Filter filter1(f_cut = 10) annotation(Placement(visible = true, transformation(origin = {-102.498, 58.13}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Feedback feedback annotation(Placement(visible = true, transformation(origin = {-120, -1.87}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Der der2 annotation(Placement(visible = true, transformation(origin = {25, 54.061}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Gain p1(k = 0.352277) annotation(Placement(visible = true, transformation(origin = {65, 94.13}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Gain d1(k = 0.295788) annotation(Placement(visible = true, transformation(origin = {107.502, 54.072}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {145, 74.13}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Continuous.Filter filter2(f_cut = 10) annotation(Placement(visible = true, transformation(origin = {62.502, 54.13}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(visible = true, transformation(origin = {45, -5.87}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput X annotation(Placement(visible = true, transformation(origin = {-110, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-97.643, 23.81}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput Y annotation(Placement(visible = true, transformation(origin = {57.066, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-89.643, 15.81}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    NewHardware newHardware annotation(Placement(visible = true, transformation(origin = {-15, -36.714}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = 0.5) annotation(Placement(visible = true, transformation(origin = {-163.075, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const1(k = 0.5) annotation(Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(const1.y, feedback1.u1) annotation(Line(visible = true, origin = {30.5, -2.935}, points = {{-9.5, 2.935}, {1.5, 2.935}, {1.5, -2.935}, {6.5, -2.935}}, color = {0, 0, 127}));
    connect(const.y, feedback.u1) annotation(Line(visible = true, origin = {-136.519, -0.935}, points = {{-15.557, 0.935}, {3.519, 0.935}, {3.519, -0.935}, {8.519, -0.935}}, color = {0, 0, 127}));
    connect(newHardware.rightSensorValueInMeter1, feedback1.u2) annotation(Line(visible = true, origin = {28.333, -33.954}, points = {{-33.333, -10.042}, {16.667, -10.042}, {16.667, 20.084}}, color = {0, 0, 127}));
    connect(Y, newHardware.u1) annotation(Line(visible = true, origin = {-5.776, -62.255}, points = {{62.842, -17.745}, {-22.224, -17.745}, {-22.224, 17.745}, {-18.395, 17.745}}, color = {0, 0, 127}));
    connect(add1.y, newHardware.servo_angle_input1) annotation(Line(visible = true, origin = {65.609, 34.109}, points = {{90.391, 40.021}, {93.391, 40.021}, {93.391, 27.008}, {-93.609, 27.008}, {-93.609, -67.029}, {-89.954, -67.029}}, color = {0, 0, 127}));
    connect(X, newHardware.u) annotation(Line(visible = true, origin = {-47.552, -60.081}, points = {{-62.448, -19.919}, {19.552, -19.919}, {19.552, 19.919}, {23.345, 19.919}}, color = {0, 0, 127}));
    connect(newHardware.rightSensorValueInMeter, feedback.u2) annotation(Line(visible = true, origin = {-49.8, -20.207}, points = {{44.8, -10.506}, {47.8, -10.506}, {47.8, 5.337}, {-70.2, 5.337}, {-70.2, 10.337}}, color = {0, 0, 127}));
    connect(add.y, newHardware.servo_angle_input) annotation(Line(visible = true, origin = {-19.385, 44.945}, points = {{5.385, 43.336}, {8.385, 43.336}, {8.385, 30.323}, {-8.615, 30.323}, {-8.615, -73.659}, {-4.926, -73.659}}, color = {0, 0, 127}));
    connect(filter2.y, d1.u) annotation(Line(visible = true, origin = {88.502, 54.101}, points = {{-15, 0.029}, {4, 0.029}, {4, -0.029}, {7, -0.029}}, color = {0, 0, 127}));
    connect(der2.y, filter2.u) annotation(Line(visible = true, origin = {45.377, 54.096}, points = {{-9.377, -0.035}, {2.126, -0.034}, {2.126, 0.035}, {5.125, 0.034}}, color = {0, 0, 127}));
    connect(d1.y, add1.u2) annotation(Line(visible = true, origin = {127.876, 61.101}, points = {{-9.374, -7.029}, {2.124, -7.029}, {2.124, 7.029}, {5.124, 7.029}}, color = {0, 0, 127}));
    connect(p1.y, add1.u1) annotation(Line(visible = true, origin = {117.25, 87.13}, points = {{-41.25, 7}, {12.75, 7}, {12.75, -7}, {15.75, -7}}, color = {0, 0, 127}));
    connect(feedback1.y, der2.u) annotation(Line(visible = true, origin = {34.5, 27.44}, points = {{19.5, -33.31}, {30.5, -33.31}, {30.5, 6.69}, {-29.5, 6.69}, {-29.5, 26.621}, {-21.5, 26.621}}, color = {0, 0, 127}));
    connect(der2.u, p1.u) annotation(Line(visible = true, origin = {19, 74.096}, points = {{-6, -20.035}, {-14, -20.034}, {-14, 20.034}, {34, 20.034}}, color = {0, 0, 127}));
    connect(filter1.y, d.u) annotation(Line(visible = true, origin = {-76.498, 58.101}, points = {{-15, 0.029}, {4, 0.029}, {4, -0.029}, {7, -0.029}}, color = {0, 0, 127}));
    connect(der1.y, filter1.u) annotation(Line(visible = true, origin = {-119.623, 58.096}, points = {{-9.377, -0.035}, {2.126, -0.034}, {2.126, 0.035}, {5.125, 0.034}}, color = {0, 0, 127}));
    connect(d.y, add.u2) annotation(Line(visible = true, origin = {-40.874, 70.176}, points = {{-5.623, -12.104}, {0.874, -12.104}, {0.874, 12.104}, {3.874, 12.104}}, color = {0, 0, 127}));
    connect(p.y, add.u1) annotation(Line(visible = true, origin = {-50.779, 96.316}, points = {{-35.337, 2.036}, {10.779, 2.036}, {10.779, -2.036}, {13.779, -2.036}}, color = {0, 0, 127}));
    connect(feedback.y, der1.u) annotation(Line(visible = true, origin = {-130.5, 31.44}, points = {{19.5, -33.31}, {30.5, -33.31}, {30.5, 6.69}, {-29.5, 6.69}, {-29.5, 26.621}, {-21.5, 26.621}}, color = {0, 0, 127}));
    connect(der1.u, p.u) annotation(Line(visible = true, origin = {-146, 78.096}, points = {{-6, -20.035}, {-14, -20.034}, {-14, 20.034}, {36.884, 20.256}}, color = {0, 0, 127}));
    annotation(experiment(StopTime = 1000.0, Interval = 0.01, __Wolfram_SynchronizeWithRealTime = true), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end BallBalance;

  model NewHardware
    Modelica.Blocks.Interfaces.RealInput servo_angle_input annotation(Placement(visible = true, transformation(origin = {-160, -31.804}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-93.106, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput rightSensorValueInMeter annotation(Placement(visible = true, transformation(origin = {-72.731, -36.282}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {3.56, -37.191}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-92.062, -34.487}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput servo_angle_input1 annotation(Placement(visible = true, transformation(origin = {-160, 67.918}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-93.443, 37.938}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput rightSensorValueInMeter1 annotation(Placement(visible = true, transformation(origin = {-67.269, 66.282}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -72.818}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput u1 annotation(Placement(visible = true, transformation(origin = {6.44, 65}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-91.717, -77.971}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Continuous.Filter inputFilter1(f_cut = 10, order = 1) annotation(Placement(visible = true, transformation(origin = {-122.157, 67.666}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Filter inputFilter(f_cut = 10, order = 1) annotation(Placement(visible = true, transformation(origin = {-116.98, -31.804}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ModelPlug.Pins.Servo servo(Pin = 10) annotation(Placement(visible = true, transformation(origin = {164.714, -36.726}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ModelPlug.Boards.CustomFirmata arduino(Port = "COM5", UpdatePeriod = 0.001, BaudRate = 57600) annotation(Placement(visible = true, transformation(origin = {186.44, 18.274}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ModelPlug.Pins.Servo servo1(Pin = 9) annotation(Placement(visible = true, transformation(origin = {169.714, 65}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ConvertRange convertRange annotation(Placement(visible = true, transformation(origin = {114.714, -34.511}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ConvertRange convertRange1 annotation(Placement(visible = true, transformation(origin = {102.407, 64.935}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(u1, convertRange1.u) annotation(Line(visible = true, origin = {69.915, 65.38}, points = {{-63.475, -0.38}, {19.492, -0.38}, {19.492, 0.38}, {24.492, 0.38}}, color = {0, 0, 127}));
    connect(u, convertRange.u) annotation(Line(visible = true, origin = {78.425, -35.439}, points = {{-74.865, -1.752}, {23.288, -1.752}, {23.288, 1.752}, {28.288, 1.752}}, color = {0, 0, 127}));
    connect(rightSensorValueInMeter1, inputFilter1.y) annotation(Line(visible = true, origin = {-98.685, 66.974}, points = {{31.416, -0.692}, {-9.472, -0.692}, {-9.472, 0.692}, {-12.472, 0.692}}, color = {0, 0, 127}));
    connect(inputFilter.y, rightSensorValueInMeter) annotation(Line(visible = true, origin = {-87.655, -34.043}, points = {{-18.325, 2.239}, {1.7, 2.239}, {1.7, -2.239}, {14.925, -2.239}}, color = {0, 0, 127}));
    connect(servo1.pinConnector, arduino.boardConnector) annotation(Line(visible = true, origin = {184.198, 49.424}, points = {{-4.484, 15.576}, {2.242, 15.575}, {2.242, -31.15}}));
    connect(servo.pinConnector, arduino.boardConnector) annotation(Line(visible = true, origin = {182.531, -18.393}, points = {{-7.817, -18.333}, {3.909, -18.333}, {3.909, 36.667}}));
    connect(convertRange.y, servo.u) annotation(Line(visible = true, origin = {145.6, -36.237}, points = {{-21.317, 0.489}, {6.101, 0.489}, {6.101, -0.489}, {9.114, -0.489}}, color = {0, 0, 127}));
    connect(convertRange1.y, servo1.u) annotation(Line(visible = true, origin = {146.273, 64.349}, points = {{-34.297, -0.651}, {10.428, -0.651}, {10.428, 0.651}, {13.441, 0.651}}, color = {0, 0, 127}));
    connect(inputFilter.u, servo_angle_input) annotation(Line(visible = true, origin = {-144.49, -31.804}, points = {{15.51, 0}, {-15.51, -0}}, color = {0, 0, 127}));
    connect(inputFilter1.u, servo_angle_input1) annotation(Line(visible = true, origin = {-142.814, 67.792}, points = {{8.657, -0.126}, {4.264, -0.126}, {4.264, 0.126}, {-17.186, 0.126}}, color = {0, 0, 127}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {0, 0, 255}, extent = {{-63.13, -63.973}, {63.13, 63.973}}), Text(visible = true, origin = {-3.644, 3.095}, extent = {{-53.644, -25}, {53.644, 25}}, textString = "Hardware")}), Diagram(coordinateSystem(extent = {{-191.637, -105}, {220, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end NewHardware;

  model ConvertRange
    Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-147.5, 37.5}, extent = {{-37.5, -37.5}, {37.5, 37.5}}, rotation = 0), iconTransformation(origin = {-80, 8.246}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Math.Add add annotation(Placement(visible = true, transformation(origin = {-82.826, 12.03}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(visible = true, transformation(origin = {-127.081, -2.842}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const2(k = 0.5) annotation(Placement(visible = true, transformation(origin = {-130, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {-30.876, -8.376}, extent = {{-11.624, -11.624}, {11.624, 11.624}}, rotation = 0)));
    Modelica.Blocks.Math.Division division annotation(Placement(visible = true, transformation(origin = {41.669, -31.669}, extent = {{-21.669, -21.669}, {21.669, 21.669}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const1(k = 540) annotation(Placement(visible = true, transformation(origin = {-35, -55}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {95, -11.079}, extent = {{-16.079, -16.079}, {16.079, 16.079}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const3(k = 0.25) annotation(Placement(visible = true, transformation(origin = {30, 33.376}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {132.18, 47.18}, extent = {{-17.18, -17.18}, {17.18, 17.18}}, rotation = 0), iconTransformation(origin = {95.693, -12.374}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(add1.y, y) annotation(Line(visible = true, origin = {125.682, 8.341}, points = {{-12.996, -19.42}, {6.498, -19.42}, {6.498, 38.84}}, color = {0, 0, 127}));
    connect(const3.y, add1.u1) annotation(Line(visible = true, origin = {65.529, 15.972}, points = {{-24.529, 17.404}, {7.176, 17.404}, {7.176, -17.404}, {10.176, -17.404}}, color = {0, 0, 127}));
    connect(division.y, add1.u2) annotation(Line(visible = true, origin = {71.655, -26.198}, points = {{-6.151, -5.471}, {1.05, -5.471}, {1.05, 5.471}, {4.05, 5.471}}, color = {0, 0, 127}));
    connect(const1.y, division.u2) annotation(Line(visible = true, origin = {4.25, -49.835}, points = {{-28.25, -5.165}, {8.417, -5.165}, {8.417, 5.165}, {11.417, 5.165}}, color = {0, 0, 127}));
    connect(product1.y, division.u1) annotation(Line(visible = true, origin = {5.727, -13.522}, points = {{-23.817, 5.146}, {6.939, 5.146}, {6.939, -5.146}, {9.939, -5.146}}, color = {0, 0, 127}));
    connect(product1.u2, const2.y) annotation(Line(visible = true, origin = {-98.956, -32.675}, points = {{54.131, 17.325}, {-17.044, 17.325}, {-17.044, -17.325}, {-20.044, -17.325}}, color = {0, 0, 127}));
    connect(add.y, product1.u1) annotation(Line(visible = true, origin = {-51.7, 5.314}, points = {{-14.626, 6.716}, {3.875, 6.716}, {3.875, -6.716}, {6.875, -6.716}}, color = {0, 0, 127}));
    connect(const.y, add.u2) annotation(Line(visible = true, origin = {-106.14, 0.094}, points = {{-9.941, -2.936}, {2.314, -2.936}, {2.314, 2.936}, {5.314, 2.936}}, color = {0, 0, 127}));
    connect(add.u1, u) annotation(Line(visible = true, origin = {-115.16, 29.265}, points = {{14.334, -8.235}, {9.003, -8.235}, {9.003, 8.235}, {-32.34, 8.235}}, color = {0, 0, 127}));
    annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end ConvertRange;
  annotation(experiment(__Wolfram_SynchronizeWithRealTime = false), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end TEST;
