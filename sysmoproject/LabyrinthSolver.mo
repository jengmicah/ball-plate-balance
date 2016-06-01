package LabyrinthSolver
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

  model hardware
    Modelica.Blocks.Nonlinear.Limiter limiter(uMin = 0.3, uMax = 0.7) annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput servo_angle_input annotation(Placement(visible = true, transformation(origin = {-170, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    ModelPlug.Pins.Servo servo(Pin = 9) annotation(Placement(visible = true, transformation(origin = {-2.175, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput rightSensorValueInMeter annotation(Placement(visible = true, transformation(origin = {170, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add(k2 = +1) annotation(Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = ServoDeviation) annotation(Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Filter inputFilter(f_cut = 10, order = 1) annotation(Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Sqrt sqrt1 annotation(Placement(visible = true, transformation(origin = {60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Filter outputFilter(f_cut = 3, order = 1) annotation(Placement(visible = true, transformation(origin = {140, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const1(k = SensorDeviation) annotation(Placement(visible = true, transformation(origin = {60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ModelPlug.Boards.CustomFirmata arduino(Port = "COM4", UpdatePeriod = 0.001, BaudRate = 57600) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-15, -41.624}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -73.139}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  equation
    connect(u, sqrt1.u) annotation(Line(visible = true, origin = {30.75, -40.812}, points = {{-45.75, -0.812}, {14.25, -0.812}, {14.25, 0.812}, {17.25, 0.812}}, color = {0, 0, 127}));
    connect(const.y, add.u2) annotation(Line(visible = true, origin = {-97.75, -23}, points = {{-11.25, -17}, {2.75, -17}, {2.75, 17}, {5.75, 17}}, color = {0, 0, 127}));
    connect(outputFilter.y, rightSensorValueInMeter) annotation(Line(visible = true, origin = {160.5, 0}, points = {{-9.5, 0}, {9.5, 0}}, color = {0, 0, 127}));
    connect(add1.y, outputFilter.u) annotation(Line(visible = true, origin = {119.5, 0}, points = {{-8.5, 0}, {8.5, 0}}, color = {0, 0, 127}));
    connect(limiter.y, servo.u) annotation(Line(visible = true, origin = {-19.75, 10}, points = {{-9.25, -10}, {-0.25, -10}, {-0.25, 30}, {7.575, 30}}, color = {0, 0, 127}));
    connect(add.y, limiter.u) annotation(Line(visible = true, origin = {-60.5, 0}, points = {{-8.5, 0}, {8.5, 0}}, color = {0, 0, 127}));
    connect(inputFilter.y, add.u1) annotation(Line(visible = true, origin = {-97.75, 23}, points = {{-11.25, 17}, {2.75, 17}, {2.75, -17}, {5.75, -17}}, color = {0, 0, 127}));
    connect(inputFilter.u, servo_angle_input) annotation(Line(visible = true, origin = {-145.5, 20}, points = {{13.5, 20}, {5.5, 20}, {5.5, -20}, {-24.5, -20}}, color = {0, 0, 127}));
    connect(const1.y, add1.u1) annotation(Line(visible = true, origin = {79.75, 23}, points = {{-8.75, 17}, {0.25, 17}, {0.25, -17}, {8.25, -17}}, color = {0, 0, 127}));
    connect(sqrt1.y, add1.u2) annotation(Line(visible = true, origin = {79.75, -23}, points = {{-8.75, -17}, {0.25, -17}, {0.25, 17}, {8.25, 17}}, color = {0, 0, 127}));
    connect(servo.pinConnector, arduino.boardConnector) annotation(Line(visible = true, origin = {9.565, 24}, points = {{-1.74, 16}, {10.435, 16}, {10.435, -4}, {-9.565, -4}, {-9.565, -24}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {0, 0, 255}, extent = {{-63.13, -63.973}, {63.13, 63.973}}), Text(visible = true, origin = {-3.644, 3.095}, extent = {{-53.644, -25}, {53.644, 25}}, textString = "Hardware")}), Diagram(coordinateSystem(extent = {{-191.637, -105}, {220, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end hardware;

  model BallBalance
    Modelica.Blocks.Continuous.Der der1 annotation(Placement(visible = true, transformation(origin = {-140, 58.061}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Gain p(k = 0.352277) annotation(Placement(visible = true, transformation(origin = {-100, 98.13}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Gain d(k = 0.295788) annotation(Placement(visible = true, transformation(origin = {-57.498, 58.072}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Add add annotation(Placement(visible = true, transformation(origin = {-20, 78.13}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Continuous.Filter filter1(f_cut = 10) annotation(Placement(visible = true, transformation(origin = {-102.498, 58.13}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Feedback feedback annotation(Placement(visible = true, transformation(origin = {-120, -1.87}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse pulse(offset = -0.05, amplitude = 0.07, startTime = 5, width = 50, period = 10, nperiod = -1) annotation(Placement(visible = true, transformation(origin = {-160, -1.87}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Der der2 annotation(Placement(visible = true, transformation(origin = {25, 54.061}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Gain p1(k = 0.352277) annotation(Placement(visible = true, transformation(origin = {65, 94.13}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Gain d1(k = 0.295788) annotation(Placement(visible = true, transformation(origin = {107.502, 54.072}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {145, 74.13}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Continuous.Filter filter2(f_cut = 10) annotation(Placement(visible = true, transformation(origin = {62.502, 54.13}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(visible = true, transformation(origin = {45, -5.87}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse pulse1(offset = -0.05, amplitude = 0.07, startTime = 5, width = 50, period = 10, nperiod = -1) annotation(Placement(visible = true, transformation(origin = {5, -5.87}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    hardware hardware1 annotation(Placement(visible = true, transformation(origin = {-65, 15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    hardware hardware2 annotation(Placement(visible = true, transformation(origin = {110, 16.565}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput X annotation(Placement(visible = true, transformation(origin = {-123.051, 25}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-97.643, 23.81}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput Y annotation(Placement(visible = true, transformation(origin = {40, 23.051}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-89.643, 15.81}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  equation
    connect(Y, hardware2.u) annotation(Line(visible = true, origin = {83.5, 16.151}, points = {{-43.5, 6.9}, {13.5, 6.9}, {13.5, -6.9}, {16.5, -6.9}}, color = {0, 0, 127}));
    connect(X, hardware1.u) annotation(Line(visible = true, origin = {-88.513, 16.343}, points = {{-34.538, 8.657}, {10.513, 8.657}, {10.513, -8.657}, {13.513, -8.657}}, color = {0, 0, 127}));
    connect(hardware2.rightSensorValueInMeter, feedback1.u2) annotation(Line(visible = true, origin = {91.2, -3.696}, points = {{28.8, 20.261}, {31.8, 20.261}, {31.8, -15.174}, {-46.2, -15.174}, {-46.2, -10.174}}, color = {0, 0, 127}));
    connect(add1.y, hardware2.servo_angle_input) annotation(Line(visible = true, origin = {128, 50.604}, points = {{28, 23.526}, {31, 23.526}, {31, 10.513}, {-31, 10.513}, {-31, -34.039}, {-28, -34.039}}, color = {0, 0, 127}));
    connect(hardware1.rightSensorValueInMeter, feedback.u2) annotation(Line(visible = true, origin = {-79.8, -1.922}, points = {{24.8, 16.922}, {27.8, 16.922}, {27.8, -12.948}, {-40.2, -12.948}, {-40.2, -7.948}}, color = {0, 0, 127}));
    connect(add.y, hardware1.servo_angle_input) annotation(Line(visible = true, origin = {-42, 52.749}, points = {{33, 25.381}, {36, 25.381}, {36, 12.368}, {-36, 12.368}, {-36, -37.749}, {-33, -37.749}}, color = {0, 0, 127}));
    connect(filter2.y, d1.u) annotation(Line(visible = true, origin = {88.502, 54.101}, points = {{-15, 0.029}, {4, 0.029}, {4, -0.029}, {7, -0.029}}, color = {0, 0, 127}));
    connect(der2.y, filter2.u) annotation(Line(visible = true, origin = {45.377, 54.096}, points = {{-9.377, -0.035}, {2.126, -0.034}, {2.126, 0.035}, {5.125, 0.034}}, color = {0, 0, 127}));
    connect(d1.y, add1.u2) annotation(Line(visible = true, origin = {127.876, 61.101}, points = {{-9.374, -7.029}, {2.124, -7.029}, {2.124, 7.029}, {5.124, 7.029}}, color = {0, 0, 127}));
    connect(p1.y, add1.u1) annotation(Line(visible = true, origin = {117.25, 87.13}, points = {{-41.25, 7}, {12.75, 7}, {12.75, -7}, {15.75, -7}}, color = {0, 0, 127}));
    connect(pulse1.y, feedback1.u1) annotation(Line(visible = true, origin = {26.5, -5.87}, points = {{-10.5, 0}, {10.5, 0}}, color = {0, 0, 127}));
    connect(feedback1.y, der2.u) annotation(Line(visible = true, origin = {34.5, 27.44}, points = {{19.5, -33.31}, {30.5, -33.31}, {30.5, 6.69}, {-29.5, 6.69}, {-29.5, 26.621}, {-21.5, 26.621}}, color = {0, 0, 127}));
    connect(der2.u, p1.u) annotation(Line(visible = true, origin = {19, 74.096}, points = {{-6, -20.035}, {-14, -20.034}, {-14, 20.034}, {34, 20.034}}, color = {0, 0, 127}));
    connect(filter1.y, d.u) annotation(Line(visible = true, origin = {-76.498, 58.101}, points = {{-15, 0.029}, {4, 0.029}, {4, -0.029}, {7, -0.029}}, color = {0, 0, 127}));
    connect(der1.y, filter1.u) annotation(Line(visible = true, origin = {-119.623, 58.096}, points = {{-9.377, -0.035}, {2.126, -0.034}, {2.126, 0.035}, {5.125, 0.034}}, color = {0, 0, 127}));
    connect(d.y, add.u2) annotation(Line(visible = true, origin = {-37.124, 65.101}, points = {{-9.374, -7.029}, {2.124, -7.029}, {2.124, 7.029}, {5.124, 7.029}}, color = {0, 0, 127}));
    connect(p.y, add.u1) annotation(Line(visible = true, origin = {-47.75, 91.13}, points = {{-41.25, 7}, {12.75, 7}, {12.75, -7}, {15.75, -7}}, color = {0, 0, 127}));
    connect(pulse.y, feedback.u1) annotation(Line(visible = true, origin = {-138.5, -1.87}, points = {{-10.5, 0}, {10.5, 0}}, color = {0, 0, 127}));
    connect(feedback.y, der1.u) annotation(Line(visible = true, origin = {-130.5, 31.44}, points = {{19.5, -33.31}, {30.5, -33.31}, {30.5, 6.69}, {-29.5, 6.69}, {-29.5, 26.621}, {-21.5, 26.621}}, color = {0, 0, 127}));
    connect(der1.u, p.u) annotation(Line(visible = true, origin = {-146, 78.096}, points = {{-6, -20.035}, {-14, -20.034}, {-14, 20.034}, {34, 20.034}}, color = {0, 0, 127}));
    annotation(experiment(__Wolfram_SynchronizeWithRealTime = false), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end BallBalance;

  model DrSingerBallandBeamTest
    annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end DrSingerBallandBeamTest;
  annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end LabyrinthSolver;
