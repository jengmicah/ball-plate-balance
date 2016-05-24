package LabyrinthSolver
  model Labyrinth
    LabyrinthSolver.Platform test4_1 annotation(Placement(visible = true, transformation(origin = {0, 1.624}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end Labyrinth;

  model ball1
    ballforce ballforce1 annotation(Placement(visible = true, transformation(origin = {-45, 65}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Translational.Components.MassWithStopAndFriction constraints(smax = 0.1375, smin = -0.1375, L = 0, m = 0, s.start = 0, s.fixed = true, F_prop = 0, F_Coulomb = 0, F_Stribeck = 0) annotation(Placement(visible = true, transformation(origin = {-6.772, 92.5}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange = true, animation = false, n = {1, 0, 0}, boxWidth = 0.01, boxHeight = 0.01) annotation(Placement(visible = true, transformation(origin = {-6.772, 52.5}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
    Modelica.Mechanics.MultiBody.Parts.Body ballBody(m = 0, sphereDiameter = 0.04, sphereColor = {255, 255, 255}) annotation(Placement(visible = true, transformation(origin = {-46.772, 52.5}, extent = {{-10, -10}, {10, 10}}, rotation = -180)));
    Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor annotation(Placement(visible = true, transformation(origin = {33.228, 92.5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput x annotation(Placement(visible = true, transformation(origin = {73.228, 92.5}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {93.098, 74.848}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput theta annotation(Placement(visible = true, transformation(origin = {-146.772, 92.5}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 44.519}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    BallAndBeam.Components.GravitationalPull rollingBall annotation(Placement(visible = true, transformation(origin = {-46.772, 92.5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(Placement(visible = true, transformation(origin = {-146.772, 13.5}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-30, 96}, extent = {{-16, -16}, {16, 16}}, rotation = -90)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {0.0, 0.025, 0.015}, animation = false) annotation(Placement(visible = true, transformation(origin = {-46.772, 12.5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput vx annotation(Placement(visible = true, transformation(origin = {73.228, 12.5}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {93.098, -52.103}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor annotation(Placement(visible = true, transformation(origin = {33.228, 12.5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Translational.Components.MassWithStopAndFriction constraints1(smax = 0.1375, smin = -0.1375, L = 0, m = 0, s.start = 0, s.fixed = true, F_prop = 0, F_Coulomb = 0, F_Stribeck = 0) annotation(Placement(visible = true, transformation(origin = {-6.949, -12.5}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(useAxisFlange = true, animation = false, n = {1, 0, 0}, boxWidth = 0.01, boxHeight = 0.01) annotation(Placement(visible = true, transformation(origin = {-6.949, -52.5}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
    Modelica.Mechanics.MultiBody.Parts.Body ballBody1(m = 0, sphereDiameter = 0.04, sphereColor = {255, 255, 255}) annotation(Placement(visible = true, transformation(origin = {-46.949, -52.5}, extent = {{-10, -10}, {10, 10}}, rotation = -180)));
    Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor1 annotation(Placement(visible = true, transformation(origin = {33.051, -12.5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {73.051, -12.5}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {93.505, 46.486}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput theta1 annotation(Placement(visible = true, transformation(origin = {-147.598, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-82.337, -72.19}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    BallAndBeam.Components.GravitationalPull rollingBall1 annotation(Placement(visible = true, transformation(origin = {-46.949, -12.5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1 annotation(Placement(visible = true, transformation(origin = {-146.949, -91.5}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {34, 96}, extent = {{-16, -16}, {16, 16}}, rotation = -90)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {0.0, 0.025, 0.015}, animation = false) annotation(Placement(visible = true, transformation(origin = {-46.949, -92.5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput vy annotation(Placement(visible = true, transformation(origin = {73.051, -92.5}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {94.196, -78.016}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor1 annotation(Placement(visible = true, transformation(origin = {33.051, -92.5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(frame_a1, fixedTranslation1.frame_a) annotation(Line(visible = true, origin = {-80.949, -92}, points = {{-66, 0.5}, {21, 0.5}, {21, -0.5}, {24, -0.5}}));
    connect(fixedTranslation1.frame_b, prismatic1.frame_a) annotation(Line(visible = true, origin = {-5.443, -72.5}, points = {{-31.506, -20}, {11.506, -20}, {11.506, 20}, {8.494, 20}}));
    connect(prismatic1.frame_b, ballBody1.frame_a) annotation(Line(visible = true, origin = {-26.949, -52.5}, points = {{10, 0}, {-10, 0}}));
    connect(rollingBall1.flange_b1, constraints1.flange_a) annotation(Line(visible = true, origin = {-26.949, -12.5}, points = {{-10, 0}, {10, 0}}, color = {0, 127, 0}));
    connect(constraints1.flange_b, positionSensor1.flange) annotation(Line(visible = true, origin = {13.051, -12.5}, points = {{-10, 0}, {10, 0}}, color = {0, 127, 0}));
    connect(y, positionSensor1.s) annotation(Line(visible = true, origin = {58.551, -12.5}, points = {{14.5, 0}, {-14.5, 0}}, color = {0, 0, 127}));
    connect(constraints1.flange_b, speedSensor1.flange) annotation(Line(visible = true, origin = {13.051, -52.5}, points = {{-10, 40}, {0, 40}, {0, -40}, {10, -40}}, color = {0, 127, 0}));
    connect(speedSensor1.v, vy) annotation(Line(visible = true, origin = {58.551, -92.5}, points = {{-14.5, 0}, {14.5, 0}}, color = {0, 0, 127}));
    connect(constraints1.flange_a, prismatic1.axis) annotation(Line(visible = true, origin = {-21.449, -29.5}, points = {{4.5, 17}, {-5.5, 17}, {-5.5, -17}, {6.5, -17}}, color = {0, 127, 0}));
    connect(theta1, rollingBall1.u) annotation(Line(visible = true, origin = {-81.265, -16.25}, points = {{-66.333, -3.75}, {21.008, -3.75}, {21.008, 3.75}, {24.316, 3.75}}, color = {0, 0, 127}));
    connect(frame_a, fixedTranslation.frame_a) annotation(Line(visible = true, origin = {-80.772, 13}, points = {{-66, 0.5}, {21, 0.5}, {21, -0.5}, {24, -0.5}}));
    connect(fixedTranslation.frame_b, prismatic.frame_a) annotation(Line(visible = true, origin = {-5.266, 32.5}, points = {{-31.506, -20}, {11.506, -20}, {11.506, 20}, {8.494, 20}}));
    connect(prismatic.frame_b, ballBody.frame_a) annotation(Line(visible = true, origin = {-26.772, 52.5}, points = {{10, 0}, {-10, 0}}));
    connect(rollingBall.flange_b1, constraints.flange_a) annotation(Line(visible = true, origin = {-26.772, 92.5}, points = {{-10, 0}, {10, 0}}, color = {0, 127, 0}));
    connect(constraints.flange_b, positionSensor.flange) annotation(Line(visible = true, origin = {13.228, 92.5}, points = {{-10, 0}, {10, 0}}, color = {0, 127, 0}));
    connect(x, positionSensor.s) annotation(Line(visible = true, origin = {58.728, 92.5}, points = {{14.5, 0}, {-14.5, 0}}, color = {0, 0, 127}));
    connect(constraints.flange_b, speedSensor.flange) annotation(Line(visible = true, origin = {13.228, 52.5}, points = {{-10, 40}, {0, 40}, {0, -40}, {10, -40}}, color = {0, 127, 0}));
    connect(speedSensor.v, vx) annotation(Line(visible = true, origin = {58.728, 12.5}, points = {{-14.5, 0}, {14.5, 0}}, color = {0, 0, 127}));
    connect(constraints.flange_a, prismatic.axis) annotation(Line(visible = true, origin = {-21.272, 75.5}, points = {{4.5, 17}, {-5.5, 17}, {-5.5, -17}, {6.5, -17}}, color = {0, 127, 0}));
    connect(theta, rollingBall.u) annotation(Line(visible = true, origin = {-101.772, 92.5}, points = {{-45, 0}, {45, 0}}, color = {0, 0, 127}));
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
    ball1 ball1_1 annotation(Placement(visible = true, transformation(origin = {-13.476, 88.189}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput theta2 annotation(Placement(visible = true, transformation(origin = {145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {97.643, 38.095}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput theta1 annotation(Placement(visible = true, transformation(origin = {145, 75}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {97.643, 71.429}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(sine1.y, theta2) annotation(Line(visible = true, origin = {103.638, 35}, points = {{-97.638, -5}, {28.138, -5}, {28.138, 5}, {41.362, 5}}, color = {0, 0, 127}));
    connect(sine.y, theta1) annotation(Line(visible = true, origin = {78.638, 67.5}, points = {{-172.637, -7.5}, {53.138, -7.5}, {53.138, 7.5}, {66.362, 7.5}}, color = {0, 0, 127}));
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
  annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end LabyrinthSolver;
