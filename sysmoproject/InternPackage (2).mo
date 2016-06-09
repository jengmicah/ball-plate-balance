package InternPackage
  model NewBallandBeam_1D
    inner Modelica.Mechanics.MultiBody.World world annotation(Placement(visible = true, transformation(origin = {-116.806, 85}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox(length = 3, width = 3, height = 0.01, widthDirection = {0, 0, 1}, r_shape = {-1.5, 0, 0}, r = {0, 0, 0}) annotation(Placement(visible = true, transformation(origin = {-7.221, -25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange = true, n = {0, 0, 1}) annotation(Placement(visible = true, transformation(origin = {-55, -25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Sources.Position position(useSupport = true) annotation(Placement(visible = true, transformation(origin = {-85, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation(Placement(visible = true, transformation(origin = {-105, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.Body body(r_CM = {0, 0, 0}, m = 1, sphereDiameter = 0.2, r_0.start = {0, 0, 0}, I_11 = 2 / 5 * body.m * BallRadius ^ 2, I_22 = 2 / 5 * body.m * BallRadius ^ 2, I_33 = 2 / 5 * body.m * BallRadius ^ 2) annotation(Placement(visible = true, transformation(origin = {75, -32.839}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {0, bodyBox.height / 2, 1}, animation = false) annotation(Placement(visible = true, transformation(origin = {-5, 7.548}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
    Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(n = {1, 0, 0}, animation = false, useAxisFlange = true) annotation(Placement(visible = true, transformation(origin = {55, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Visualizers.FixedArrow fixedArrow(length = 0.6, color = {128, 0, 0}, n = {0, 1, 0}) annotation(Placement(visible = true, transformation(origin = {75, -55}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(useAxisFlange = true, n = {0, 0, -1}) annotation(Placement(visible = true, transformation(origin = {118.398, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {0, BallRadius, 0}, animation = false) annotation(Placement(visible = true, transformation(origin = {85, 8.492}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    parameter Real BallRadius = 0.1;
    Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealRollingWheel(radius = BallRadius) annotation(Placement(visible = true, transformation(origin = {95, 65}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Components.PlateInput plateInput annotation(Placement(visible = true, transformation(origin = {-125, 26.759}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(revolute.frame_b, bodyBox.frame_a) annotation(Line(visible = true, origin = {-31.111, -25}, points = {{-13.889, 0}, {13.89, 0}}));
    connect(plateInput.y, position.phi_ref) annotation(Line(visible = true, origin = {-105.5, 18.38}, points = {{-9.5, 8.38}, {0.5, 8.38}, {0.5, -8.38}, {8.5, -8.38}}, color = {0, 0, 127}));
    connect(fixedTranslation.frame_b, prismatic1.frame_a) annotation(Line(visible = true, origin = {23.795, 19.774}, points = {{-28.795, -2.226}, {-28.795, 0.887}, {18.192, 0.887}, {18.192, 0.226}, {21.205, 0.226}}));
    connect(prismatic1.axis, idealRollingWheel.flangeT) annotation(Line(visible = true, origin = {72, 45.5}, points = {{-9, -19.5}, {-2, -19.5}, {-2, 19.5}, {13, 19.5}}, color = {0, 127, 0}));
    connect(idealRollingWheel.flangeR, revolute1.axis) annotation(Line(visible = true, origin = {113.932, 50}, points = {{-8.932, 15}, {4.466, 15}, {4.466, -30}}));
    connect(fixedTranslation1.frame_b, revolute1.frame_a) annotation(Line(visible = true, origin = {103.542, 9.246}, points = {{-8.542, -0.754}, {1.843, -0.754}, {1.843, 0.754}, {4.856, 0.754}}));
    connect(revolute1.frame_b, body.frame_a) annotation(Line(visible = true, origin = {96.036, -12.613}, points = {{32.361, 22.613}, {35.374, 22.613}, {35.374, -2.387}, {-36.036, -2.387}, {-36.036, -20.226}, {-31.036, -20.226}}));
    connect(prismatic1.frame_b, fixedTranslation1.frame_a) annotation(Line(visible = true, origin = {71, 14.246}, points = {{-6, 5.754}, {1, 5.754}, {1, -5.754}, {4, -5.754}}));
    connect(body.frame_a, fixedArrow.frame_a) annotation(Line(visible = true, origin = {58.41, -43.919}, points = {{6.59, 11.081}, {-6.59, 11.081}, {-6.59, -11.081}, {6.59, -11.081}}));
    connect(bodyBox.frame_b, fixedTranslation.frame_a) annotation(Line(visible = true, origin = {0.957, -12.671}, points = {{1.822, -12.329}, {5.047, -12.329}, {5.047, 7.219}, {-5.957, 7.219}, {-5.957, 10.219}}));
    connect(fixed.frame_b, revolute.frame_a) annotation(Line(visible = true, origin = {-74.006, -27.5}, points = {{-20.994, -2.5}, {5.994, -2.5}, {5.994, 2.5}, {9.006, 2.5}}));
    connect(position.flange, revolute.axis) annotation(Line(visible = true, origin = {-61.667, 1.667}, points = {{-13.333, 8.333}, {6.667, 8.333}, {6.667, -16.667}}));
    connect(position.support, revolute.support) annotation(Line(visible = true, origin = {-73, -9.637}, points = {{-12, 9.637}, {-12, -2.137}, {12, -2.137}, {12, -5.363}}, color = {192, 192, 192}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {0, 255, 0}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-90, -90}, {90, 90}}), Text(visible = true, origin = {2.263, 15.993}, extent = {{-79.658, -27.5}, {79.658, 27.5}}, textString = "Beam", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -32.071}, extent = {{-83.727, -32.071}, {83.727, 32.071}}, textString = "1D", textStyle = {TextStyle.Bold})}), experiment(StopTime = 10, __Wolfram_SynchronizeWithRealTime = false), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end NewBallandBeam_1D;

  model NewBallandPlate_2D
    inner Modelica.Mechanics.MultiBody.World world annotation(Placement(visible = true, transformation(origin = {-116.806, 85}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.BodyBox Plate(length = 3, width = 3, height = 0.01, widthDirection = {0, 0, 1}, r_shape = {-1.5, 0, 0}, r = {0, 0, 0}) annotation(Placement(visible = true, transformation(origin = {-7.221, -25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute Plate_Z_Rotate(useAxisFlange = true, n = {0, 0, 1}) annotation(Placement(visible = true, transformation(origin = {-55, -25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Sources.Position Z_Rotation_cmd(useSupport = true, phi(fixed = false)) annotation(Placement(visible = true, transformation(origin = {-85, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation(Placement(visible = true, transformation(origin = {-90, -25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.Body Ball(r_CM = {0, 0, 0}, m = 1, sphereDiameter = 0.2, r_0.start = {0, 0, 0}, I_11 = 2 / 5 * Ball.m * BallRadius ^ 2, I_22 = 2 / 5 * Ball.m * BallRadius ^ 2, I_33 = 2 / 5 * Ball.m * BallRadius ^ 2) annotation(Placement(visible = true, transformation(origin = {127.244, -32.839}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Prismatic Move_in_X(n = {1, 0, 0}, animation = false, useAxisFlange = true) annotation(Placement(visible = true, transformation(origin = {55, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Visualizers.FixedArrow BallMarker(length = 0.6, color = {128, 0, 0}, n = {0, 1, 0}) annotation(Placement(visible = true, transformation(origin = {115, -75}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute Roll_in_X(useAxisFlange = true, n = {0, 0, -1}) annotation(Placement(visible = true, transformation(origin = {118.398, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation Ball_CM(r = {0, BallRadius, 0}, animation = false) annotation(Placement(visible = true, transformation(origin = {85, 8.492}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    parameter Real BallRadius = 0.1;
    Modelica.Mechanics.Rotational.Components.IdealRollingWheel X_Dir_Rolling_Constraint(radius = BallRadius) annotation(Placement(visible = true, transformation(origin = {98.567, 65}, extent = {{13.567, -13.567}, {-13.567, 13.567}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute Plate_X_Rotate(useAxisFlange = true, n = {1, 0, 0}) annotation(Placement(visible = true, transformation(origin = {-31.639, -52.354}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Sources.Position X_Rotation_cmd(useSupport = true, phi(fixed = false)) annotation(Placement(visible = true, transformation(origin = {-88.398, -65}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute Roll_in_Z(useAxisFlange = true, n = {1, 0, 0}) annotation(Placement(visible = true, transformation(origin = {90, -25}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Prismatic Move_in_Z(n = {0, 0, 1}, animation = false, useAxisFlange = true) annotation(Placement(visible = true, transformation(origin = {21.775, 5}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.IdealRollingWheel Z_Dir_Rolling_Constraint(radius = BallRadius) annotation(Placement(visible = true, transformation(origin = {55, -54.078}, extent = {{14.078, -14.078}, {-14.078, 14.078}}, rotation = 0)));
    Components.PlateInput plateInput annotation(Placement(visible = true, transformation(origin = {-130, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame annotation(Placement(visible = true, transformation(origin = {140, -56.916}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(fixedFrame.frame_a, Roll_in_Z.frame_b) annotation(Line(visible = true, origin = {109.006, -40.958}, points = {{20.994, -15.958}, {-5.994, -15.958}, {-5.994, 15.958}, {-9.006, 15.958}}));
    connect(Plate_Z_Rotate.support, Z_Rotation_cmd.support) annotation(Line(visible = true, origin = {-73, -6.363}, points = {{12, -8.637}, {12, 1.137}, {-12, 1.137}, {-12, 6.363}}));
    connect(plateInput.y, Z_Rotation_cmd.phi_ref) annotation(Line(visible = true, origin = {-106.75, 25}, points = {{-13.25, 15}, {1.75, 15}, {1.75, -15}, {9.75, -15}}, color = {0, 0, 127}));
    connect(X_Rotation_cmd.phi_ref, plateInput.y1) annotation(Line(visible = true, points = {{13.195, -50}, {-3.394, -50}, {-3.394, 50}, {-6.407, 50}}, color = {0, 0, 127}, origin = {-113.593, -15}));
    connect(Z_Dir_Rolling_Constraint.flangeT, Move_in_Z.axis) annotation(Line(visible = true, origin = {35.174, -27.539}, points = {{5.748, -26.539}, {-0.174, -26.539}, {-0.174, 26.539}, {-5.399, 26.539}}, color = {0, 127, 0}));
    connect(Roll_in_Z.axis, Z_Dir_Rolling_Constraint.flangeR) annotation(Line(visible = true, origin = {83.026, -47.718}, points = {{6.974, 12.718}, {6.974, -6.359}, {-13.948, -6.359}}));
    connect(Plate.frame_b, Move_in_Z.frame_a) annotation(Line(visible = true, origin = {8.019, -10}, points = {{-5.24, -15}, {0.743, -15}, {0.743, 15}, {3.755, 15}}));
    connect(Move_in_Z.frame_b, Move_in_X.frame_a) annotation(Line(visible = true, origin = {40.187, 12.5}, points = {{-8.413, -7.5}, {1.8, -7.5}, {1.8, 7.5}, {4.813, 7.5}}));
    connect(Roll_in_Z.frame_b, Ball.frame_a) annotation(Line(visible = true, origin = {106.811, -28.919}, points = {{-6.811, 3.919}, {-1.811, 3.919}, {-1.811, -3.919}, {10.433, -3.919}}));
    connect(Roll_in_X.frame_b, Roll_in_Z.frame_a) annotation(Line(visible = true, origin = {100.286, -7.265}, points = {{28.112, 17.265}, {33.085, 17.265}, {33.085, 0.469}, {-36.998, 0.469}, {-36.998, -17.735}, {-20.286, -17.735}}));
    connect(Plate_X_Rotate.support, X_Rotation_cmd.support) annotation(Line(visible = true, origin = {-63.018, -74.053}, points = {{25.379, 11.699}, {25.38, -7.499}, {-25.38, -7.499}, {-25.38, -0.947}}));
    connect(Plate_X_Rotate.frame_b, Plate.frame_a) annotation(Line(visible = true, origin = {-19.501, -38.903}, points = {{-2.138, -13.451}, {0.874, -13.451}, {0.874, -0.451}, {-0.945, -0.451}, {-0.945, 13.903}, {2.28, 13.903}}));
    connect(Plate_Z_Rotate.frame_b, Plate_X_Rotate.frame_a) annotation(Line(visible = true, origin = {-43.319, -38.451}, points = {{-1.681, 13.451}, {1.332, 13.451}, {1.332, 0.451}, {-1.332, 0.451}, {-1.332, -13.903}, {1.681, -13.903}}));
    connect(X_Rotation_cmd.flange, Plate_X_Rotate.axis) annotation(Line(visible = true, origin = {-42.509, -61.554}, points = {{-35.889, -3.446}, {12.509, -3.446}, {12.509, 3.446}, {10.87, -0.8}}));
    connect(Move_in_X.axis, X_Dir_Rolling_Constraint.flangeT) annotation(Line(visible = true, origin = {72, 45.5}, points = {{-9, -19.5}, {-2, -19.5}, {-2, 19.5}, {13, 19.5}}, color = {0, 127, 0}));
    connect(X_Dir_Rolling_Constraint.flangeR, Roll_in_X.axis) annotation(Line(visible = true, origin = {116.31, 50}, points = {{-4.176, 15}, {2.088, 15}, {2.088, -30}}));
    connect(Ball_CM.frame_b, Roll_in_X.frame_a) annotation(Line(visible = true, origin = {103.542, 9.246}, points = {{-8.542, -0.754}, {1.843, -0.754}, {1.843, 0.754}, {4.856, 0.754}}));
    connect(Move_in_X.frame_b, Ball_CM.frame_a) annotation(Line(visible = true, origin = {71, 14.246}, points = {{-6, 5.754}, {1, 5.754}, {1, -5.754}, {4, -5.754}}));
    connect(Ball.frame_a, BallMarker.frame_a) annotation(Line(visible = true, origin = {58.41, -43.919}, points = {{58.834, 11.08}, {46.59, 11.08}, {46.59, -11.081}, {46.59, -31.081}}));
    connect(fixed.frame_b, Plate_Z_Rotate.frame_a) annotation(Line(visible = true, origin = {-72.5, -25}, points = {{-7.5, 0}, {7.5, 0}}));
    connect(Z_Rotation_cmd.flange, Plate_Z_Rotate.axis) annotation(Line(visible = true, origin = {-61.667, 1.667}, points = {{-13.333, 8.333}, {6.667, 8.333}, {6.667, -16.667}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {0, 255, 0}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-90, -90}, {90, 90}}), Text(visible = true, origin = {2.263, 15.993}, extent = {{-79.658, -27.5}, {79.658, 27.5}}, textString = "Plate", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -32.071}, extent = {{-83.727, -32.071}, {83.727, 32.071}}, textString = "2D", textStyle = {TextStyle.Bold})}), experiment(StopTime = 10, __Wolfram_SynchronizeWithRealTime = false), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end NewBallandPlate_2D;

  model NewBallandBeam_1D_Graphic
    parameter Real BallRadius = 0.02;
    BallAndBeamNew.Components.Base base(fixedRotation.n = {-1, 0, 0}) annotation(Placement(visible = true, transformation(origin = {-42.511, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -1080)));
    inner Modelica.Mechanics.MultiBody.World world(animateWorld = false, animateGravity = false) annotation(Placement(visible = true, transformation(origin = {-102.511, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BallAndBeamNew.Components.Beam beam annotation(Placement(visible = true, transformation(origin = {-42.511, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -720)));
    BallAndBeamNew.Components.Revolute revolute annotation(Placement(visible = true, transformation(origin = {-2.511, 0}, extent = {{-10.483, -10.483}, {10.483, 10.483}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation revToBeam(r = {-0.0165, 0.055, -0.1625}, animation = false) annotation(Placement(visible = true, transformation(origin = {-2.511, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -630)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation baseToRev(r = {0.0165, -0.055, 0.1625}, animation = false) annotation(Placement(visible = true, transformation(origin = {-2.511, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
    Modelica.Mechanics.Rotational.Sources.Position position(f_crit = 1) annotation(Placement(visible = true, transformation(origin = {-44.206, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Filter filter(f_cut = 50) annotation(Placement(visible = true, transformation(origin = {-84.206, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Components.PlateInput plateInput(pulse1.amplitude = -Modelica.Constants.pi / 64, pulse.amplitude = Modelica.Constants.pi / 64) annotation(Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Components.ACKBall aCKBall annotation(Placement(visible = true, transformation(origin = {50, 17.645}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(revolute.frame_b1, aCKBall.frame_a) annotation(Line(visible = true, origin = {18.745, 14.996}, points = {{-21.255, -4.513}, {-21.255, 3.268}, {21.255, 3.268}, {21.255, 2.649}}));
    connect(plateInput.y, filter.u) annotation(Line(visible = true, origin = {-103.655, 5}, points = {{-16.345, 5}, {4.449, 5}, {4.449, -5}, {7.449, -5}}, color = {0, 0, 127}));
    connect(revolute.frame_b1, revToBeam.frame_a) annotation(Line(visible = true, origin = {-2.511, 20.242}, points = {{0, -9.759}, {0, 9.758}}));
    connect(revToBeam.frame_b, beam.frame_a) annotation(Line(visible = true, origin = {-16.511, 50.043}, points = {{14, -0.043}, {14, 9.957}, {-6, 9.957}, {-6, -10.043}, {-16, -9.829}}));
    connect(position.flange, revolute.flange_a1) annotation(Line(visible = true, origin = {-23.6, 0}, points = {{-10.606, 0}, {10.606, 0}}));
    connect(filter.y, position.phi_ref) annotation(Line(visible = true, origin = {-64.706, 0}, points = {{-8.5, 0}, {8.5, 0}}, color = {0, 0, 127}));
    connect(baseToRev.frame_a, base.frame_b) annotation(Line(visible = true, origin = {-16.511, -50}, points = {{14, 0}, {14, -10}, {-6, -10}, {-6, 10}, {-16, 10}}));
    connect(baseToRev.frame_b, revolute.frame_a1) annotation(Line(visible = true, origin = {-2.511, -20.242}, points = {{0, -9.758}, {0, 9.759}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {0, 255, 0}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-90, -90}, {90, 90}}), Text(visible = true, origin = {2.263, 15.993}, extent = {{-79.658, -27.5}, {79.658, 27.5}}, textString = "Beam", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -32.071}, extent = {{-83.727, -32.071}, {83.727, 32.071}}, textString = "1D", textStyle = {TextStyle.Bold})}), experiment(StopTime = 10, __Wolfram_SynchronizeWithRealTime = false), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end NewBallandBeam_1D_Graphic;

  model ACKBeam
    BallAndBeamNew.Components.Base base(fixedRotation.n = {-1, 0, 0}) annotation(Placement(visible = true, transformation(origin = {-42.511, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -1080)));
    inner Modelica.Mechanics.MultiBody.World world(animateWorld = false, animateGravity = false) annotation(Placement(visible = true, transformation(origin = {-102.511, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BallAndBeamNew.Components.Beam beam annotation(Placement(visible = true, transformation(origin = {-42.511, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -720)));
    BallAndBeamNew.Components.Revolute revolute annotation(Placement(visible = true, transformation(origin = {-2.511, 0}, extent = {{-10.483, -10.483}, {10.483, 10.483}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation revToBeam(r = {-0.0165, 0.055, -0.1625}, animation = false) annotation(Placement(visible = true, transformation(origin = {-2.511, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -630)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation baseToRev(r = {0.0165, -0.055, 0.1625}, animation = false) annotation(Placement(visible = true, transformation(origin = {-2.511, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
    Modelica.Mechanics.Rotational.Sources.Position position(f_crit = 1) annotation(Placement(visible = true, transformation(origin = {-44.206, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Filter filter(f_cut = 50) annotation(Placement(visible = true, transformation(origin = {-84.206, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Components.ACKBall aCKBall annotation(Placement(visible = true, transformation(origin = {50, 18.07}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-97.643, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput x annotation(Placement(visible = true, transformation(origin = {147.515, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput v annotation(Placement(visible = true, transformation(origin = {147.631, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(aCKBall.v, v) annotation(Line(visible = true, origin = {119.111, 6.535}, points = {{-59.111, 6.535}, {15.295, 6.535}, {15.295, -6.535}, {28.52, -6.535}}, color = {0, 0, 127}));
    connect(aCKBall.x, x) annotation(Line(visible = true, origin = {119.024, 21.535}, points = {{-59.024, 1.535}, {15.266, 1.535}, {15.266, -1.535}, {28.491, -1.535}}, color = {0, 0, 127}));
    connect(u, filter.u) annotation(Line(visible = true, origin = {-120.603, 0}, points = {{-24.397, 0}, {24.397, -0}}, color = {0, 0, 127}));
    connect(revolute.frame_b1, aCKBall.frame_a) annotation(Line(visible = true, origin = {18.745, 14.996}, points = {{-21.256, -4.513}, {-21.255, 3.268}, {21.255, 3.268}, {21.255, 3.074}}));
    connect(revolute.frame_b1, revToBeam.frame_a) annotation(Line(visible = true, origin = {-2.511, 20.242}, points = {{0, -9.759}, {0, 9.758}}));
    connect(revToBeam.frame_b, beam.frame_a) annotation(Line(visible = true, origin = {-16.511, 50.043}, points = {{14, -0.043}, {14, 9.957}, {-6, 9.957}, {-6, -10.043}, {-16, -9.829}}));
    connect(position.flange, revolute.flange_a1) annotation(Line(visible = true, origin = {-23.6, 0}, points = {{-10.606, 0}, {10.606, 0}}));
    connect(filter.y, position.phi_ref) annotation(Line(visible = true, origin = {-64.706, 0}, points = {{-8.5, 0}, {8.5, 0}}, color = {0, 0, 127}));
    connect(baseToRev.frame_a, base.frame_b) annotation(Line(visible = true, origin = {-16.511, -50}, points = {{14, 0}, {14, -10}, {-6, -10}, {-6, 10}, {-16, 10}}));
    connect(baseToRev.frame_b, revolute.frame_a1) annotation(Line(visible = true, origin = {-2.511, -20.242}, points = {{0, -9.758}, {0, 9.759}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {0, 255, 0}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-90, -90}, {90, 90}}), Text(visible = true, origin = {2.263, 15.993}, extent = {{-79.658, -27.5}, {79.658, 27.5}}, textString = "Beam", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -32.071}, extent = {{-83.727, -32.071}, {83.727, 32.071}}, textString = "1D", textStyle = {TextStyle.Bold})}), experiment(StopTime = 10, __Wolfram_SynchronizeWithRealTime = false), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end ACKBeam;

  model ACKBeamModel
    ACKBeam aCKBeam(aCKBall.gain.k = -1, aCKBall.gain1.k = -1) annotation(Placement(visible = true, transformation(origin = {55, 33.804}, extent = {{-21.196, -21.196}, {21.196, 21.196}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse pulse(offset = -0.05, amplitude = 0.07, startTime = 5, width = 50, period = 10, nperiod = -1) annotation(Placement(visible = true, transformation(origin = {-80, 35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback annotation(Placement(visible = true, transformation(origin = {-40, 35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.PID PID(k = 0.509581, Ti = 2.12121, Td = 0.942856) annotation(Placement(visible = true, transformation(origin = {-1.699, 35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(PID.y, aCKBeam.u) annotation(Line(visible = true, origin = {26.303, 34.402}, points = {{-17.002, 0.598}, {4.501, 0.598}, {4.501, -0.598}, {8, -0.598}}, color = {0, 0, 127}));
    connect(feedback.y, PID.u) annotation(Line(visible = true, origin = {-22.349, 35}, points = {{-8.651, 0}, {8.651, 0}}, color = {0, 0, 127}));
    connect(aCKBeam.x, feedback.u2) annotation(Line(visible = true, origin = {38.486, 23.161}, points = {{37.71, 21.241}, {59.631, 21.241}, {59.631, -23.161}, {-78.486, -23.161}, {-78.486, 3.839}}, color = {0, 0, 127}));
    connect(pulse.y, feedback.u1) annotation(Line(visible = true, origin = {-58.5, 35}, points = {{-10.5, 0}, {10.5, 0}}, color = {0, 0, 127}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {0, 255, 0}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-90, -90}, {90, 90}}), Text(visible = true, origin = {2.263, 15.993}, extent = {{-79.658, -27.5}, {79.658, 27.5}}, textString = "Beam", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -32.071}, extent = {{-83.727, -32.071}, {83.727, 32.071}}, textString = "1D", textStyle = {TextStyle.Bold})}), experiment(StopTime = 150, Interval = 0.1, __Wolfram_SynchronizeWithRealTime = false), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end ACKBeamModel;

  package Components
    model ACKBall
      Modelica.Mechanics.MultiBody.Parts.Body body(r_CM = {0, 0, 0}, m = 0.01, sphereDiameter = 0.04, r_0.start = {0, 0, 0}, I_11 = 2 / 5 * body.m * BallRadius ^ 2, I_22 = 2 / 5 * body.m * BallRadius ^ 2, I_33 = 2 / 5 * body.m * BallRadius ^ 2, sphereColor = {0, 0, 200}) annotation(Placement(visible = true, transformation(origin = {15.381, -42.839}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(n = {1, 0, 0}, animation = false, useAxisFlange = true) annotation(Placement(visible = true, transformation(origin = {-4.619, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Visualizers.FixedArrow fixedArrow(length = BallRadius * 2, color = {128, 0, 0}, n = {0, 1, 0}, diameter = BallRadius / 15) annotation(Placement(visible = true, transformation(origin = {15.381, -65}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(useAxisFlange = true, n = {0, 0, -1}, animation = false) annotation(Placement(visible = true, transformation(origin = {58.779, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {0, BallRadius, 0}, animation = false) annotation(Placement(visible = true, transformation(origin = {25.381, -1.508}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
      Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealRollingWheel(radius = BallRadius) annotation(Placement(visible = true, transformation(origin = {35.381, 55}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation = false, angle = 90, n = {1, 0, 0}, angles = {-90, 0, -180}, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence) annotation(Placement(visible = true, transformation(origin = {-97.847, -0}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(r = {0, 0, 0.025}, animation = false) annotation(Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = -360)));
      Modelica.Mechanics.Translational.Components.MassWithStopAndFriction constraints(smax = 0.1375, smin = -0.1375, L = 0, m = 0, s.start = 0, s.fixed = true, F_prop = 0, F_Coulomb = 0, F_Stribeck = 0) annotation(Placement(visible = true, transformation(origin = {-29.693, 43.301}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(Placement(visible = true, transformation(origin = {-134, -0}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
      Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor annotation(Placement(visible = true, transformation(origin = {100, 41.699}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput x annotation(Placement(visible = true, transformation(origin = {145, 41.699}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput v annotation(Placement(visible = true, transformation(origin = {145, -38.301}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor annotation(Placement(visible = true, transformation(origin = {100, -38.301}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      parameter Real BallRadius = 0.02;
      Modelica.Blocks.Math.Gain gain(k = -1) annotation(Placement(visible = true, transformation(origin = {125, 41.328}, extent = {{-6.328, -6.328}, {6.328, 6.328}}, rotation = 0)));
      Modelica.Blocks.Math.Gain gain1(k = -1) annotation(Placement(visible = true, transformation(origin = {123.672, -38.672}, extent = {{-6.328, -6.328}, {6.328, 6.328}}, rotation = 0)));
    equation
      connect(gain1.y, v) annotation(Line(visible = true, origin = {135.796, -38.487}, points = {{-5.163, -0.186}, {-2.021, -0.186}, {-2.021, 0.186}, {9.204, 0.186}}, color = {0, 0, 127}));
      connect(speedSensor.v, gain1.u) annotation(Line(visible = true, origin = {114.309, -38.487}, points = {{-3.309, 0.186}, {0.77, 0.186}, {0.77, -0.186}, {1.77, -0.186}}, color = {0, 0, 127}));
      connect(gain.y, x) annotation(Line(visible = true, origin = {136.128, 41.513}, points = {{-4.167, -0.186}, {-2.353, -0.186}, {-2.353, 0.186}, {8.872, 0.186}}, color = {0, 0, 127}));
      connect(positionSensor.s, gain.u) annotation(Line(visible = true, origin = {114.305, 41.513}, points = {{-3.305, 0.186}, {0.102, 0.186}, {0.102, -0.186}, {3.102, -0.186}}, color = {0, 0, 127}));
      connect(speedSensor.flange, positionSensor.flange) annotation(Line(visible = true, origin = {88.388, 1.699}, points = {{1.612, -40}, {-1.613, -40}, {-1.613, 40}, {1.612, 40}}, color = {0, 127, 0}));
      connect(positionSensor.flange, constraints.flange_a) annotation(Line(visible = true, origin = {19.031, 55.791}, points = {{70.969, -14.092}, {54.291, -14.092}, {54.291, 26.582}, {-66.554, 26.582}, {-66.554, -12.49}, {-58.724, -12.49}}, color = {0, 127, 0}));
      connect(fixedRotation.frame_b, fixedTranslation2.frame_a) annotation(Line(visible = true, origin = {-72.673, -0}, points = {{-15.173, -0}, {15.173, 0}}));
      connect(frame_a, fixedRotation.frame_a) annotation(Line(visible = true, origin = {-120.923, -0}, points = {{-13.077, 0}, {13.077, 0}}));
      connect(prismatic1.axis, constraints.flange_a) annotation(Line(visible = true, origin = {-19.76, 28.043}, points = {{23.141, -12.043}, {28.366, -12.043}, {28.366, -3.214}, {-29.97, -3.214}, {-29.97, 15.258}, {-19.933, 15.258}}, color = {0, 127, 0}));
      connect(fixedTranslation2.frame_b, prismatic1.frame_a) annotation(Line(visible = true, origin = {-23.096, 5}, points = {{-19.404, -5}, {5.464, -5}, {5.464, 5}, {8.476, 5}}));
      connect(body.frame_a, fixedArrow.frame_a) annotation(Line(visible = true, origin = {-1.209, -53.919}, points = {{6.59, 11.08}, {-6.59, 11.081}, {-6.59, -11.081}, {6.59, -11.081}}));
      connect(prismatic1.frame_b, fixedTranslation1.frame_a) annotation(Line(visible = true, origin = {11.381, 4.246}, points = {{-6, 5.754}, {1, 5.754}, {1, -5.754}, {4, -5.754}}));
      connect(revolute1.frame_b, body.frame_a) annotation(Line(visible = true, origin = {36.417, -22.613}, points = {{32.362, 22.613}, {35.374, 22.613}, {35.374, -2.387}, {-36.036, -2.387}, {-36.036, -20.226}, {-31.036, -20.226}}));
      connect(fixedTranslation1.frame_b, revolute1.frame_a) annotation(Line(visible = true, origin = {43.923, -0.754}, points = {{-8.542, -0.754}, {1.843, -0.754}, {1.843, 0.754}, {4.856, 0.754}}));
      connect(idealRollingWheel.flangeR, revolute1.axis) annotation(Line(visible = true, origin = {54.313, 40}, points = {{-8.932, 15}, {4.466, 15}, {4.466, -30}}));
      connect(prismatic1.axis, idealRollingWheel.flangeT) annotation(Line(visible = true, origin = {12.381, 35.5}, points = {{-9, -19.5}, {-2, -19.5}, {-2, 19.5}, {13, 19.5}}, color = {0, 127, 0}));
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, origin = {0, 0.367}, fillColor = {170, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-100, -100.367}, {100, 100.367}}), Ellipse(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 2, extent = {{-100, -100}, {100, 100}}), Text(visible = true, origin = {-3.621, 2.122}, extent = {{-100, -32.122}, {100, 32.122}}, textString = "%name")}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
    end ACKBall;

    model PlateInput
      Modelica.Blocks.Sources.Pulse pulse(period = 5.8, width = 14.1, amplitude = Modelica.Constants.pi / 32, nperiod = -1) annotation(Placement(visible = true, transformation(origin = {-29.729, 28.289}, extent = {{-6.729, -6.729}, {6.729, 6.729}}, rotation = 0)));
      Modelica.Blocks.Continuous.LowpassButterworth lowpassButterworth(f = 5) annotation(Placement(visible = true, transformation(origin = {37.592, 45.893}, extent = {{-5.893, -5.893}, {5.893, 5.893}}, rotation = 0)));
      Modelica.Blocks.Sources.Pulse pulse1(period = 5.8, width = 23, amplitude = -Modelica.Constants.pi / 32, startTime = 1.5) annotation(Placement(visible = true, transformation(origin = {-30.5, 0.789}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
      Modelica.Blocks.Math.Add add annotation(Placement(visible = true, transformation(origin = {-17.162, 49.127}, extent = {{-5.838, -5.838}, {5.838, 5.838}}, rotation = -270)));
      Modelica.Blocks.Math.Gain gain(k = 0.7) annotation(Placement(visible = true, transformation(origin = {70, -35}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {113.311, 25}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y1 annotation(Placement(visible = true, transformation(origin = {127.753, -35}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(lowpassButterworth.y, y) annotation(Line(visible = true, origin = {89.389, 35.447}, points = {{-45.315, 10.447}, {10.697, 10.447}, {10.697, -10.447}, {23.922, -10.447}}, color = {0, 0, 127}));
      connect(gain.y, y1) annotation(Line(visible = true, origin = {103.001, -35}, points = {{-24.751, 0}, {24.751, 0}}, color = {0, 0, 127}));
      connect(y, gain.u) annotation(Line(visible = true, origin = {80.724, -4.2}, points = {{32.587, 29.2}, {32.587, 16.2}, {-22.724, 16.2}, {-22.724, -30.8}, {-19.724, -30.8}}, color = {0, 0, 127}));
      connect(pulse.y, add.u1) annotation(Line(visible = true, origin = {-20.462, 35.388}, points = {{-1.865, -7.099}, {1.135, -7.099}, {1.135, 3.733}, {-0.203, 3.733}, {-0.203, 6.733}}, color = {0, 0, 127}));
      connect(pulse1.y, add.u2) annotation(Line(visible = true, origin = {-16.523, 14.566}, points = {{-5.727, -13.777}, {2.863, -13.777}, {2.864, 27.555}}, color = {0, 0, 127}));
      connect(add.y, lowpassButterworth.u) annotation(Line(visible = true, origin = {-10.901, 54.078}, points = {{-6.261, 1.471}, {-6.262, 7.632}, {2.901, 7.632}, {2.901, -8.368}, {41.421, -8.185}}, color = {0, 0, 127}));
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {0, 0, 255}, extent = {{-100, -100}, {100, 100}}, radius = 25), Text(visible = true, extent = {{-100, -100}, {100, 100}}, textString = "%name")}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5}), graphics = {Text(visible = true, origin = {-3.98, 82.5}, extent = {{-63.98, -12.5}, {63.98, 12.5}}, textString = "Create a 2D input to give to the plate")}));
    end PlateInput;
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, origin = {-2.037, -1.165}, fillColor = {255, 255, 255}, extent = {{-90.294, -91.165}, {90.294, 91.165}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end Components;

  model NewBallandPlate_2D_controlled
    inner Modelica.Mechanics.MultiBody.World world annotation(Placement(visible = true, transformation(origin = {-116.806, 85}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.BodyBox Plate(length = 3, width = 3, height = 0.01, widthDirection = {0, 0, 1}, r_shape = {-1.5, 0, 0}, r = {0, 0, 0}) annotation(Placement(visible = true, transformation(origin = {-7.221, -25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute Plate_Z_Rotate(useAxisFlange = true, n = {0, 0, 1}) annotation(Placement(visible = true, transformation(origin = {-55, -25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Sources.Position Z_Rotation_cmd(useSupport = true, phi(fixed = false)) annotation(Placement(visible = true, transformation(origin = {-85, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation(Placement(visible = true, transformation(origin = {-90, -25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.Body Ball(r_CM = {0, 0, 0}, m = 1, sphereDiameter = 0.2, r_0.start = {0, 0, 0}, I_11 = 2 / 5 * Ball.m * BallRadius ^ 2, I_22 = 2 / 5 * Ball.m * BallRadius ^ 2, I_33 = 2 / 5 * Ball.m * BallRadius ^ 2, sphereColor = {155, 0, 0}) annotation(Placement(visible = true, transformation(origin = {127.244, -32.839}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Prismatic Move_in_X(n = {1, 0, 0}, animation = false, useAxisFlange = true) annotation(Placement(visible = true, transformation(origin = {55, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute Roll_in_X(useAxisFlange = true, n = {0, 0, -1}) annotation(Placement(visible = true, transformation(origin = {118.398, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation Ball_CM(r = {0, BallRadius, 0}, animation = false) annotation(Placement(visible = true, transformation(origin = {85, 8.492}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    parameter Real BallRadius = 0.1;
    Modelica.Mechanics.Rotational.Components.IdealRollingWheel X_Dir_Rolling_Constraint(radius = BallRadius) annotation(Placement(visible = true, transformation(origin = {98.567, 65}, extent = {{13.567, -13.567}, {-13.567, 13.567}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute Plate_X_Rotate(useAxisFlange = true, n = {1, 0, 0}) annotation(Placement(visible = true, transformation(origin = {-31.639, -52.354}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Sources.Position X_Rotation_cmd(useSupport = true, phi(fixed = false)) annotation(Placement(visible = true, transformation(origin = {-76.618, -65}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute Roll_in_Z(useAxisFlange = true, n = {1, 0, 0}) annotation(Placement(visible = true, transformation(origin = {90, -25}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Prismatic Move_in_Z(n = {0, 0, 1}, animation = false, useAxisFlange = true) annotation(Placement(visible = true, transformation(origin = {21.775, 5}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.IdealRollingWheel Z_Dir_Rolling_Constraint(radius = BallRadius) annotation(Placement(visible = true, transformation(origin = {55, -54.078}, extent = {{14.078, -14.078}, {-14.078, 14.078}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame annotation(Placement(visible = true, transformation(origin = {120, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LowpassButterworth lowpassButterworth(f = 5) annotation(Placement(visible = true, transformation(origin = {-119.107, 25}, extent = {{-5.893, -5.893}, {5.893, 5.893}}, rotation = 0)));
    Modelica.Blocks.Continuous.LowpassButterworth lowpassButterworth1(f = 5) annotation(Placement(visible = true, transformation(origin = {-114.107, -59.107}, extent = {{-5.893, -5.893}, {5.893, 5.893}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput Zin annotation(Placement(visible = true, transformation(origin = {-150, 25}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-97.643, 23.81}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput Xin annotation(Placement(visible = true, transformation(origin = {-151.629, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-95.319, -57.143}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Sensors.AbsolutePosition absolutePosition annotation(Placement(visible = true, transformation(origin = {127.964, -15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput r[3] annotation(Placement(visible = true, transformation(origin = {156.888, 2.529}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102.107, -14.286}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain(k = -1) annotation(Placement(visible = true, transformation(origin = {-100.184, 34.816}, extent = {{-5.184, -5.184}, {5.184, 5.184}}, rotation = 0)));
    ModelPlug.Boards.Arduino arduino annotation(Placement(visible = true, transformation(origin = {-25, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ModelPlug.Pins.Servo servo annotation(Placement(visible = true, transformation(origin = {15, -65}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ModelPlug.Pins.Servo servo1(Pin = 9) annotation(Placement(visible = true, transformation(origin = {-25, 45}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(gain.y, servo1.u) annotation(Line(visible = true, origin = {-51.377, 39.908}, points = {{-43.105, -5.092}, {13.364, -5.092}, {13.364, 5.092}, {16.377, 5.092}}, color = {0, 0, 127}));
    connect(lowpassButterworth1.y, servo.u) annotation(Line(visible = true, origin = {-54.365, -71.932}, points = {{-53.26, 12.825}, {-50.26, 12.825}, {-50.26, -19.756}, {47.207, -19.756}, {47.207, 6.932}, {59.365, 6.932}}, color = {0, 0, 127}));
    connect(servo.pinConnector, arduino.boardConnector) annotation(Line(visible = true, origin = {6.205, -28.2}, points = {{18.795, -36.8}, {21.807, -36.8}, {21.807, 20.2}, {-31.205, 20.2}, {-31.205, 33.2}}));
    connect(servo1.pinConnector, arduino.boardConnector) annotation(Line(visible = true, origin = {-17.795, 26.2}, points = {{2.795, 18.8}, {5.808, 18.8}, {5.808, -8.2}, {-7.205, -8.2}, {-7.205, -21.2}}));
    connect(gain.y, Z_Rotation_cmd.phi_ref) annotation(Line(visible = true, origin = {-95.741, 23.777}, points = {{1.259, 11.039}, {4.259, 11.039}, {4.259, 2.738}, {-4.259, 2.738}, {-4.259, -13.777}, {-1.259, -13.777}}, color = {0, 0, 127}));
    connect(lowpassButterworth.y, gain.u) annotation(Line(visible = true, origin = {-109.46, 29.908}, points = {{-3.165, -4.908}, {0.055, -4.908}, {0.055, 4.908}, {3.055, 4.908}}, color = {0, 0, 127}));
    connect(lowpassButterworth1.y, X_Rotation_cmd.phi_ref) annotation(Line(visible = true, origin = {-94.87, -62.053}, points = {{-12.755, 2.947}, {3.252, 2.947}, {3.252, -2.947}, {6.252, -2.947}}, color = {0, 0, 127}));
    connect(absolutePosition.frame_a, Move_in_X.frame_b) annotation(Line(visible = true, origin = {79.854, 2.5}, points = {{38.111, -17.5}, {-11.629, -17.5}, {-11.629, 17.5}, {-14.854, 17.5}}));
    connect(absolutePosition.r, r) annotation(Line(visible = true, origin = {145.794, -6.235}, points = {{-6.83, -8.765}, {-2.132, -8.765}, {-2.132, 8.765}, {11.093, 8.765}}, color = {0, 0, 127}));
    connect(lowpassButterworth1.u, Xin) annotation(Line(visible = true, origin = {-134.759, -59.405}, points = {{13.58, 0.298}, {-6.79, 0.298}, {-16.87, -0.595}}, color = {0, 0, 127}));
    connect(lowpassButterworth.u, Zin) annotation(Line(visible = true, origin = {-138.089, 25}, points = {{11.911, 0}, {-11.911, 0}}, color = {0, 0, 127}));
    connect(fixedFrame.frame_a, Roll_in_Z.frame_b) annotation(Line(visible = true, origin = {104.006, -42.5}, points = {{5.994, -17.5}, {-0.994, -17.5}, {-0.994, 17.5}, {-4.006, 17.5}}));
    connect(Plate_Z_Rotate.support, Z_Rotation_cmd.support) annotation(Line(visible = true, origin = {-73, -6.363}, points = {{12, -8.637}, {12, 1.137}, {-12, 1.137}, {-12, 6.363}}));
    connect(Z_Dir_Rolling_Constraint.flangeT, Move_in_Z.axis) annotation(Line(visible = true, origin = {35.174, -27.539}, points = {{5.748, -26.539}, {-0.174, -26.539}, {-0.174, 26.539}, {-5.399, 26.539}}, color = {0, 127, 0}));
    connect(Roll_in_Z.axis, Z_Dir_Rolling_Constraint.flangeR) annotation(Line(visible = true, origin = {83.026, -47.718}, points = {{6.974, 12.718}, {6.974, -6.359}, {-13.948, -6.359}}));
    connect(Plate.frame_b, Move_in_Z.frame_a) annotation(Line(visible = true, origin = {8.019, -10}, points = {{-5.24, -15}, {0.743, -15}, {0.743, 15}, {3.755, 15}}));
    connect(Move_in_Z.frame_b, Move_in_X.frame_a) annotation(Line(visible = true, origin = {40.187, 12.5}, points = {{-8.413, -7.5}, {1.8, -7.5}, {1.8, 7.5}, {4.813, 7.5}}));
    connect(Roll_in_Z.frame_b, Ball.frame_a) annotation(Line(visible = true, origin = {106.811, -28.919}, points = {{-6.811, 3.919}, {-1.811, 3.919}, {-1.811, -3.919}, {10.433, -3.919}}));
    connect(Roll_in_X.frame_b, Roll_in_Z.frame_a) annotation(Line(visible = true, origin = {100.286, -7.265}, points = {{28.112, 17.265}, {33.085, 17.265}, {33.085, 0.469}, {-36.998, 0.469}, {-36.998, -17.735}, {-20.286, -17.735}}));
    connect(Plate_X_Rotate.support, X_Rotation_cmd.support) annotation(Line(visible = true, origin = {-57.129, -74.451}, points = {{19.49, 12.097}, {19.49, -5.774}, {-19.49, -5.774}, {-19.49, -0.549}}));
    connect(Plate_X_Rotate.frame_b, Plate.frame_a) annotation(Line(visible = true, origin = {-19.501, -38.903}, points = {{-2.138, -13.451}, {0.874, -13.451}, {0.874, -0.451}, {-0.945, -0.451}, {-0.945, 13.903}, {2.28, 13.903}}));
    connect(Plate_Z_Rotate.frame_b, Plate_X_Rotate.frame_a) annotation(Line(visible = true, origin = {-43.319, -38.451}, points = {{-1.681, 13.451}, {1.332, 13.451}, {1.332, 0.451}, {-1.332, 0.451}, {-1.332, -13.903}, {1.681, -13.903}}));
    connect(X_Rotation_cmd.flange, Plate_X_Rotate.axis) annotation(Line(visible = true, origin = {-42.509, -61.554}, points = {{-24.109, -3.446}, {12.509, -3.446}, {12.509, 3.446}, {10.87, -0.8}}));
    connect(Move_in_X.axis, X_Dir_Rolling_Constraint.flangeT) annotation(Line(visible = true, origin = {72, 45.5}, points = {{-9, -19.5}, {-2, -19.5}, {-2, 19.5}, {13, 19.5}}, color = {0, 127, 0}));
    connect(X_Dir_Rolling_Constraint.flangeR, Roll_in_X.axis) annotation(Line(visible = true, origin = {116.31, 50}, points = {{-4.176, 15}, {2.088, 15}, {2.088, -30}}));
    connect(Ball_CM.frame_b, Roll_in_X.frame_a) annotation(Line(visible = true, origin = {103.542, 9.246}, points = {{-8.542, -0.754}, {1.843, -0.754}, {1.843, 0.754}, {4.856, 0.754}}));
    connect(Move_in_X.frame_b, Ball_CM.frame_a) annotation(Line(visible = true, origin = {71, 14.246}, points = {{-6, 5.754}, {1, 5.754}, {1, -5.754}, {4, -5.754}}));
    connect(fixed.frame_b, Plate_Z_Rotate.frame_a) annotation(Line(visible = true, origin = {-72.5, -25}, points = {{-7.5, 0}, {7.5, 0}}));
    connect(Z_Rotation_cmd.flange, Plate_Z_Rotate.axis) annotation(Line(visible = true, origin = {-61.667, 1.667}, points = {{-13.333, 8.333}, {6.667, 8.333}, {6.667, -16.667}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {0, 255, 0}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-90, -90}, {90, 90}}), Text(visible = true, origin = {2.263, 15.993}, extent = {{-79.658, -27.5}, {79.658, 27.5}}, textString = "Plate", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -32.071}, extent = {{-83.727, -32.071}, {83.727, 32.071}}, textString = "2D", textStyle = {TextStyle.Bold})}), experiment(StopTime = 10, __Wolfram_SynchronizeWithRealTime = false), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end NewBallandPlate_2D_controlled;

  model Controlled_Plate_Model
    Modelica.Blocks.Sources.Pulse Zpulse_Move_in_X(offset = -0.5, amplitude = 1, startTime = 5, width = 50, period = 20, nperiod = -1) annotation(Placement(visible = true, transformation(origin = {-102.5, 32.5}, extent = {{-12.5, -12.5}, {12.5, 12.5}}, rotation = 0)));
    NewBallandPlate_2D_controlled Ball_Model annotation(Placement(visible = true, transformation(origin = {32.012, 15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID Z_PID(controllerType = Modelica.Blocks.Types.SimpleController.PD, Td = 0.8, k = 0.5, yMax = 0.2) annotation(Placement(visible = true, transformation(origin = {-53.306, 37.191}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse Xpulse_Move_in_Z(offset = -0.25, amplitude = 0.5, startTime = 5, width = 50, period = 20, nperiod = -1) annotation(Placement(visible = true, transformation(origin = {-100.847, -19.153}, extent = {{-14.153, -14.153}, {14.153, 14.153}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID X_PID(controllerType = Modelica.Blocks.Types.SimpleController.PD, Td = 0.8, k = 0.5, yMax = 0.2) annotation(Placement(visible = true, transformation(origin = {-50, -12.809}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(X_PID.u_m, Ball_Model.r[3]) annotation(Line(visible = true, origin = {12.445, -10.657}, points = {{-62.445, -14.152}, {-62.445, -17.152}, {47.555, -17.152}, {47.555, 24.228}, {29.778, 24.228}}, color = {0, 0, 127}));
    connect(X_PID.y, Ball_Model.Xin) annotation(Line(visible = true, origin = {-0.843, -1.762}, points = {{-38.157, -11.047}, {7.417, -11.047}, {7.417, 11.047}, {23.323, 11.047}}, color = {0, 0, 127}));
    connect(Xpulse_Move_in_Z.y, X_PID.u_s) annotation(Line(visible = true, origin = {-69.32, -15.981}, points = {{-15.959, -3.172}, {4.32, -3.172}, {4.32, 3.172}, {7.32, 3.172}}, color = {0, 0, 127}));
    connect(Z_PID.u_m, Ball_Model.r[1]) annotation(Line(visible = true, origin = {10.436, 36.143}, points = {{-63.742, 13.048}, {-63.742, 16.048}, {47.849, 16.048}, {47.849, -22.572}, {31.786, -22.572}}, color = {0, 0, 127}));
    connect(Z_PID.y, Ball_Model.Zin) annotation(Line(visible = true, origin = {-2.515, 27.286}, points = {{-39.791, 9.905}, {7.515, 9.905}, {7.515, -9.905}, {24.762, -9.905}}, color = {0, 0, 127}));
    connect(Zpulse_Move_in_X.y, Z_PID.u_s) annotation(Line(visible = true, origin = {-72.667, 34.846}, points = {{-16.083, -2.346}, {4.361, -2.346}, {4.361, 2.346}, {7.361, 2.346}}, color = {0, 0, 127}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, origin = {0, -1.638}, fillColor = {0, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-95.461, -93.823}, {95.461, 93.823}})}), experiment(StopTime = 30, __Wolfram_SynchronizeWithRealTime = false), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end Controlled_Plate_Model;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {0, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-90, -90}, {90, 90}}), Text(visible = true, origin = {2.716, 34.549}, extent = {{-79.658, -27.5}, {79.658, 27.5}}, textString = "Interns", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -50}, extent = {{-83.727, -32.071}, {83.727, 32.071}}, textString = "2016", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end InternPackage;
