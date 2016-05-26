package LabyrinthSolver
  model Labyrinth
    LabyrinthSolver.Platform test4_1 annotation(Placement(visible = true, transformation(origin = {0, 1.624}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end Labyrinth;

  model ball1
    ballforce ballforce1 annotation(Placement(visible = true, transformation(origin = {-45, 65}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BallAndBeam.Components.GravitationalPull rollingBall annotation(Placement(visible = true, transformation(origin = {-46.772, 92.5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BallAndBeam.Components.GravitationalPull rollingBall1 annotation(Placement(visible = true, transformation(origin = {-46.949, -12.5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end ball1;

  model ballforce1
    Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-120.024, 60.536}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-90, 67.641}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = g * m) annotation(Placement(visible = true, transformation(origin = {-40.024, 76.023}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Sin sin annotation(Placement(visible = true, transformation(origin = {-40.024, 46.023}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {-0.024, 60.536}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Translational.Sources.Force force annotation(Placement(visible = true, transformation(origin = {49.976, 65.536}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Translational.Components.Mass mass annotation(Placement(visible = true, transformation(origin = {84.976, 65.536}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b annotation(Placement(visible = true, transformation(origin = {113.341, 65.536}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92.719, 68.332}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput u1 annotation(Placement(visible = true, transformation(origin = {-118.365, -40.487}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-87.825, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const1(k = g * m) annotation(Placement(visible = true, transformation(origin = {-36.683, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Sin sin1 annotation(Placement(visible = true, transformation(origin = {-36.683, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Product product2 annotation(Placement(visible = true, transformation(origin = {1.635, -40.487}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Translational.Sources.Force force1 annotation(Placement(visible = true, transformation(origin = {51.635, -35.487}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Translational.Components.Mass mass1 annotation(Placement(visible = true, transformation(origin = {86.635, -35.487}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b1 annotation(Placement(visible = true, transformation(origin = {115, -35.487}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {96.232, -73.571}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(mass1.flange_b, flange_b1) annotation(Line(visible = true, origin = {105.817, -35.487}, points = {{-9.182, 0}, {9.183, 0}}, color = {0, 127, 0}));
    connect(product2.y, force1.f) annotation(Line(visible = true, origin = {31.385, -37.987}, points = {{-18.75, -2.5}, {5.25, -2.5}, {5.25, 2.5}, {8.25, 2.5}}, color = {0, 0, 127}));
    connect(force1.flange, mass1.flange_a) annotation(Line(visible = true, origin = {69.135, -35.487}, points = {{-7.5, 0}, {7.5, 0}}, color = {0, 127, 0}));
    connect(sin1.y, product2.u2) annotation(Line(visible = true, origin = {-15.695, -53.244}, points = {{-9.988, -6.756}, {2.329, -6.756}, {2.329, 6.756}, {5.33, 6.757}}, color = {0, 0, 127}));
    connect(const1.y, product2.u1) annotation(Line(visible = true, origin = {-15.695, -32.244}, points = {{-9.988, 2.244}, {2.329, 2.244}, {2.329, -2.244}, {5.33, -2.243}}, color = {0, 0, 127}));
    connect(u1, sin1.u) annotation(Line(visible = true, origin = {-67.603, -50.244}, points = {{-50.762, 9.757}, {15.921, 9.756}, {15.921, -9.756}, {18.92, -9.756}}, color = {0, 0, 127}));
    connect(mass.flange_b, flange_b) annotation(Line(visible = true, origin = {104.159, 65.536}, points = {{-9.183, 0}, {9.182, 0}}, color = {0, 127, 0}));
    connect(product1.y, force.f) annotation(Line(visible = true, origin = {29.726, 63.036}, points = {{-18.75, -2.5}, {5.25, -2.5}, {5.25, 2.5}, {8.25, 2.5}}, color = {0, 0, 127}));
    connect(force.flange, mass.flange_a) annotation(Line(visible = true, origin = {67.476, 65.536}, points = {{-7.5, 0}, {7.5, 0}}, color = {0, 127, 0}));
    connect(sin.y, product1.u2) annotation(Line(visible = true, origin = {-17.774, 50.279}, points = {{-11.25, -4.256}, {2.75, -4.256}, {2.75, 4.256}, {5.75, 4.256}}, color = {0, 0, 127}));
    connect(const.y, product1.u1) annotation(Line(visible = true, origin = {-17.774, 71.279}, points = {{-11.25, 4.744}, {2.75, 4.744}, {2.75, -4.744}, {5.75, -4.744}}, color = {0, 0, 127}));
    connect(u, sin.u) annotation(Line(visible = true, origin = {-70.524, 53.279}, points = {{-49.5, 7.257}, {15.5, 7.256}, {15.5, -7.256}, {18.5, -7.256}}, color = {0, 0, 127}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {2.444, 0.846}, extent = {{-72.444, -39.154}, {72.444, 39.154}}, textString = "Ball Force")}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end ballforce1;

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

  model onedofbalance
    BallAndBeam.Components.Hardware hardware(arduino.Port = "COM4", servo.Pin = 9) annotation(Placement(visible = true, transformation(origin = {92.982, -15}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
    Modelica.Blocks.Continuous.Der der1 annotation(Placement(visible = true, transformation(origin = {-73.481, 56.996}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Gain p(k = 0.352277) annotation(Placement(visible = true, transformation(origin = {-33.481, 97.065}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Gain d(k = 0.295788) annotation(Placement(visible = true, transformation(origin = {9.021, 57.007}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Add add annotation(Placement(visible = true, transformation(origin = {46.519, 77.065}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Continuous.Filter filter1(f_cut = 10) annotation(Placement(visible = true, transformation(origin = {-35.979, 57.065}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Feedback feedback annotation(Placement(visible = true, transformation(origin = {-45, -32.935}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse pulse(offset = -0.05, amplitude = 0.07, startTime = 5, width = 50, period = 10, nperiod = -1) annotation(Placement(visible = true, transformation(origin = {-85, -32.935}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(add.y, hardware.servo_angle_input) annotation(Line(visible = true, origin = {62.75, 51.033}, points = {{-5.231, 26.033}, {0.731, 26.033}, {0.731, -26.033}, {0.232, -66.033}}, color = {0, 0, 127}));
    connect(der1.u, p.u) annotation(Line(visible = true, origin = {-79.481, 77.031}, points = {{-6, -20.035}, {-14, -20.034}, {-14, 20.034}, {34, 20.034}}, color = {0, 0, 127}));
    connect(feedback.y, der1.u) annotation(Line(visible = true, origin = {-55.5, 0.375}, points = {{19.5, -33.31}, {30.5, -33.31}, {30.5, 6.69}, {-29.5, 6.69}, {-29.5, 26.621}, {-29.981, 56.621}}, color = {0, 0, 127}));
    connect(pulse.y, feedback.u1) annotation(Line(visible = true, origin = {-63.5, -32.935}, points = {{-10.5, 0}, {10.5, 0}}, color = {0, 0, 127}));
    connect(p.y, add.u1) annotation(Line(visible = true, origin = {18.769, 90.065}, points = {{-41.25, 7}, {12.75, 7}, {12.75, -7}, {15.75, -7}}, color = {0, 0, 127}));
    connect(d.y, add.u2) annotation(Line(visible = true, origin = {29.395, 64.036}, points = {{-9.374, -7.029}, {2.124, -7.029}, {2.124, 7.029}, {5.124, 7.029}}, color = {0, 0, 127}));
    connect(der1.y, filter1.u) annotation(Line(visible = true, origin = {-53.105, 57.031}, points = {{-9.377, -0.035}, {2.125, -0.035}, {2.125, 0.035}, {5.125, 0.035}}, color = {0, 0, 127}));
    connect(filter1.y, d.u) annotation(Line(visible = true, origin = {-9.979, 57.036}, points = {{-15, 0.029}, {4, 0.029}, {4, -0.029}, {7, -0.029}}, color = {0, 0, 127}));
    connect(hardware.rightSensorValueInMeter, feedback.u2) annotation(Line(visible = true, origin = {57.004, -34.587}, points = {{65.978, 19.587}, {69.015, 19.587}, {69.015, -16.413}, {-102.004, -16.413}, {-102.004, -6.348}}, color = {0, 0, 127}));
    annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end onedofbalance;

  model hardware
    Modelica.Blocks.Nonlinear.Limiter limiter(uMin = 0.3, uMax = 0.7) annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput servo_angle_input annotation(Placement(visible = true, transformation(origin = {-170, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    ModelPlug.Pins.Servo servo(Pin = 9) annotation(Placement(visible = true, transformation(origin = {-2.175, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ModelPlug.Pins.AnalogInput rightSensorAnalogInput(Pin = 14, MinValue = 0, MaxValue = 1) annotation(Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput rightSensorValueInMeter annotation(Placement(visible = true, transformation(origin = {170, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add(k2 = +1) annotation(Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = ServoDeviation) annotation(Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Filter inputFilter(f_cut = 10, order = 1) annotation(Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Sqrt sqrt1 annotation(Placement(visible = true, transformation(origin = {60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Filter outputFilter(f_cut = 3, order = 1) annotation(Placement(visible = true, transformation(origin = {140, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const1(k = SensorDeviation) annotation(Placement(visible = true, transformation(origin = {60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ModelPlug.Boards.CustomFirmata arduino(Port = port, UpdatePeriod = 0.001, BaudRate = 57600) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(const.y, add.u2) annotation(Line(visible = true, origin = {-97.75, -23}, points = {{-11.25, -17}, {2.75, -17}, {2.75, 17}, {5.75, 17}}, color = {0, 0, 127}));
    connect(rightSensorAnalogInput.y, sqrt1.u) annotation(Line(visible = true, origin = {29, -40}, points = {{-19, 0}, {19, 0}}, color = {0, 0, 127}));
    connect(outputFilter.y, rightSensorValueInMeter) annotation(Line(visible = true, origin = {160.5, 0}, points = {{-9.5, 0}, {9.5, 0}}, color = {0, 0, 127}));
    connect(add1.y, outputFilter.u) annotation(Line(visible = true, origin = {119.5, 0}, points = {{-8.5, 0}, {8.5, 0}}, color = {0, 0, 127}));
    connect(limiter.y, servo.u) annotation(Line(visible = true, origin = {-19.75, 10}, points = {{-9.25, -10}, {-0.25, -10}, {-0.25, 30}, {7.575, 30}}, color = {0, 0, 127}));
    connect(add.y, limiter.u) annotation(Line(visible = true, origin = {-60.5, 0}, points = {{-8.5, 0}, {8.5, 0}}, color = {0, 0, 127}));
    connect(inputFilter.y, add.u1) annotation(Line(visible = true, origin = {-97.75, 23}, points = {{-11.25, 17}, {2.75, 17}, {2.75, -17}, {5.75, -17}}, color = {0, 0, 127}));
    connect(inputFilter.u, servo_angle_input) annotation(Line(visible = true, origin = {-145.5, 20}, points = {{13.5, 20}, {5.5, 20}, {5.5, -20}, {-24.5, -20}}, color = {0, 0, 127}));
    connect(const1.y, add1.u1) annotation(Line(visible = true, origin = {79.75, 23}, points = {{-8.75, 17}, {0.25, 17}, {0.25, -17}, {8.25, -17}}, color = {0, 0, 127}));
    connect(sqrt1.y, add1.u2) annotation(Line(visible = true, origin = {79.75, -23}, points = {{-8.75, -17}, {0.25, -17}, {0.25, 17}, {8.25, 17}}, color = {0, 0, 127}));
    connect(arduino.boardConnector, rightSensorAnalogInput.pinConnector) annotation(Line(visible = true, origin = {-10, -24}, points = {{10, 24}, {10, 4}, {-10, 4}, {-10, -16}, {0, -16}}));
    connect(servo.pinConnector, arduino.boardConnector) annotation(Line(visible = true, origin = {9.565, 24}, points = {{-1.74, 16}, {10.435, 16}, {10.435, -4}, {-9.565, -4}, {-9.565, -24}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {0, 0, 255}, extent = {{-63.13, -63.973}, {63.13, 63.973}}), Text(visible = true, origin = {-3.644, -5}, extent = {{-53.644, -25}, {53.644, 25}}, textString = "Hardware")}), Diagram(coordinateSystem(extent = {{-191.637, -105}, {220, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end hardware;

  model BallBalance
    BallAndBeam.Components.Hardware hardware(arduino.Port = "COM4", servo.Pin = 9) annotation(Placement(visible = true, transformation(origin = {-55, 10}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
    Modelica.Blocks.Continuous.Der der1 annotation(Placement(visible = true, transformation(origin = {-140, 58.061}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Gain p(k = 0.352277) annotation(Placement(visible = true, transformation(origin = {-100, 98.13}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Gain d(k = 0.295788) annotation(Placement(visible = true, transformation(origin = {-57.498, 58.072}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Add add annotation(Placement(visible = true, transformation(origin = {-20, 78.13}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Continuous.Filter filter1(f_cut = 10) annotation(Placement(visible = true, transformation(origin = {-102.498, 58.13}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Feedback feedback annotation(Placement(visible = true, transformation(origin = {-120, -1.87}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse pulse(offset = -0.05, amplitude = 0.07, startTime = 5, width = 50, period = 10, nperiod = -1) annotation(Placement(visible = true, transformation(origin = {-160, -1.87}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BallAndBeam.Components.Hardware hardware1(arduino.Port = "COM4", servo.Pin = 9) annotation(Placement(visible = true, transformation(origin = {110, 6}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
    Modelica.Blocks.Continuous.Der der2 annotation(Placement(visible = true, transformation(origin = {25, 54.061}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Gain p1(k = 0.352277) annotation(Placement(visible = true, transformation(origin = {65, 94.13}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Gain d1(k = 0.295788) annotation(Placement(visible = true, transformation(origin = {107.502, 54.072}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {145, 74.13}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Continuous.Filter filter2(f_cut = 10) annotation(Placement(visible = true, transformation(origin = {62.502, 54.13}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(visible = true, transformation(origin = {45, -5.87}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse pulse1(offset = -0.05, amplitude = 0.07, startTime = 5, width = 50, period = 10, nperiod = -1) annotation(Placement(visible = true, transformation(origin = {5, -5.87}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(add1.y, hardware1.servo_angle_input) annotation(Line(visible = true, origin = {117.987, 47.083}, points = {{38.013, 27.047}, {41.013, 27.047}, {41.013, 14.035}, {-41.025, 14.035}, {-41.025, -41.083}, {-37.987, -41.083}}, color = {0, 0, 127}));
    connect(add.y, hardware.servo_angle_input) annotation(Line(visible = true, origin = {-47.012, 51.083}, points = {{38.012, 27.047}, {41.012, 27.047}, {41.012, 14.035}, {-41.025, 14.035}, {-41.025, -41.083}, {-37.988, -41.083}}, color = {0, 0, 127}));
    connect(hardware1.rightSensorValueInMeter, feedback1.u2) annotation(Line(visible = true, origin = {103.215, -12.374}, points = {{36.785, 18.374}, {39.822, 18.374}, {39.822, -17.626}, {-58.215, -17.626}, {-58.215, -1.496}}, color = {0, 0, 127}));
    connect(filter2.y, d1.u) annotation(Line(visible = true, origin = {88.502, 54.101}, points = {{-15, 0.029}, {4, 0.029}, {4, -0.029}, {7, -0.029}}, color = {0, 0, 127}));
    connect(der2.y, filter2.u) annotation(Line(visible = true, origin = {45.377, 54.096}, points = {{-9.377, -0.035}, {2.126, -0.034}, {2.126, 0.035}, {5.125, 0.034}}, color = {0, 0, 127}));
    connect(d1.y, add1.u2) annotation(Line(visible = true, origin = {127.876, 61.101}, points = {{-9.374, -7.029}, {2.124, -7.029}, {2.124, 7.029}, {5.124, 7.029}}, color = {0, 0, 127}));
    connect(p1.y, add1.u1) annotation(Line(visible = true, origin = {117.25, 87.13}, points = {{-41.25, 7}, {12.75, 7}, {12.75, -7}, {15.75, -7}}, color = {0, 0, 127}));
    connect(pulse1.y, feedback1.u1) annotation(Line(visible = true, origin = {26.5, -5.87}, points = {{-10.5, 0}, {10.5, 0}}, color = {0, 0, 127}));
    connect(feedback1.y, der2.u) annotation(Line(visible = true, origin = {34.5, 27.44}, points = {{19.5, -33.31}, {30.5, -33.31}, {30.5, 6.69}, {-29.5, 6.69}, {-29.5, 26.621}, {-21.5, 26.621}}, color = {0, 0, 127}));
    connect(der2.u, p1.u) annotation(Line(visible = true, origin = {19, 74.096}, points = {{-6, -20.035}, {-14, -20.034}, {-14, 20.034}, {34, 20.034}}, color = {0, 0, 127}));
    connect(hardware.rightSensorValueInMeter, feedback.u2) annotation(Line(visible = true, origin = {-61.785, -8.374}, points = {{36.785, 18.374}, {39.822, 18.374}, {39.822, -17.626}, {-58.215, -17.626}, {-58.215, -1.496}}, color = {0, 0, 127}));
    connect(filter1.y, d.u) annotation(Line(visible = true, origin = {-76.498, 58.101}, points = {{-15, 0.029}, {4, 0.029}, {4, -0.029}, {7, -0.029}}, color = {0, 0, 127}));
    connect(der1.y, filter1.u) annotation(Line(visible = true, origin = {-119.623, 58.096}, points = {{-9.377, -0.035}, {2.126, -0.034}, {2.126, 0.035}, {5.125, 0.034}}, color = {0, 0, 127}));
    connect(d.y, add.u2) annotation(Line(visible = true, origin = {-37.124, 65.101}, points = {{-9.374, -7.029}, {2.124, -7.029}, {2.124, 7.029}, {5.124, 7.029}}, color = {0, 0, 127}));
    connect(p.y, add.u1) annotation(Line(visible = true, origin = {-47.75, 91.13}, points = {{-41.25, 7}, {12.75, 7}, {12.75, -7}, {15.75, -7}}, color = {0, 0, 127}));
    connect(pulse.y, feedback.u1) annotation(Line(visible = true, origin = {-138.5, -1.87}, points = {{-10.5, 0}, {10.5, 0}}, color = {0, 0, 127}));
    connect(feedback.y, der1.u) annotation(Line(visible = true, origin = {-130.5, 31.44}, points = {{19.5, -33.31}, {30.5, -33.31}, {30.5, 6.69}, {-29.5, 6.69}, {-29.5, 26.621}, {-21.5, 26.621}}, color = {0, 0, 127}));
    connect(der1.u, p.u) annotation(Line(visible = true, origin = {-146, 78.096}, points = {{-6, -20.035}, {-14, -20.034}, {-14, 20.034}, {34, 20.034}}, color = {0, 0, 127}));
    annotation(experiment(__Wolfram_SynchronizeWithRealTime = false), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end BallBalance;
  annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end LabyrinthSolver;
