package FINAL
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

  model Controlled_Plate_Model
    Modelica.Blocks.Discrete.Sampler sampler(samplePeriod = 1 / 30) annotation(Placement(visible = true, transformation(origin = {25, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Discrete.Sampler sampler1(samplePeriod = 1 / 30) annotation(Placement(visible = true, transformation(origin = {30, -35}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(tableOnFile = true, tableName = "NormalDist", fileName = Modelica.Utilities.Files.loadResource("normaldist_long.txt")) annotation(Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add(k2 = +0, k1 = +1) annotation(Placement(visible = true, transformation(origin = {-27.95, 73.107}, extent = {{-10, -10}, {10, 10}}, rotation = -450)));
    Modelica.Blocks.Math.Add add1(k1 = +0) annotation(Placement(visible = true, transformation(origin = {-16.577, -52.524}, extent = {{-10, -10}, {10, 10}}, rotation = -990)));
    Modelica.Blocks.Math.Gain gain(k = 0.1) annotation(Placement(visible = true, transformation(origin = {-90, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput x annotation(Placement(visible = true, transformation(origin = {91.104, 70}, extent = {{-16.104, -16.104}, {16.104, 16.104}}, rotation = 0), iconTransformation(origin = {-29.037, -46.095}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput y annotation(Placement(visible = true, transformation(origin = {93.896, -35}, extent = {{-16.104, -16.104}, {16.104, 16.104}}, rotation = 0), iconTransformation(origin = {-37.037, -38.095}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    NewBallandPlate_2D_controlled newBallandPlate_2D_controlled annotation(Placement(visible = true, transformation(origin = {27.796, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID Z_PID1(controllerType = Modelica.Blocks.Types.SimpleController.PID, Td = 0.4, k = 0.05, yMax = 0.15, Ti = 1) annotation(Placement(visible = true, transformation(origin = {-44.906, 28.791}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID X_PID(controllerType = Modelica.Blocks.Types.SimpleController.PID, Td = 0.4, k = 0.05, yMax = 0.15, Ti = 1) annotation(Placement(visible = true, transformation(origin = {-45, -8.283}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp ramp(offset = 0, duration = 5, height = 0) annotation(Placement(visible = true, transformation(origin = {-115, 32.026}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp ramp1(startTime = 7.5, offset = -2, duration = 5, height = 0) annotation(Placement(visible = true, transformation(origin = {-115, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(X_PID.u_s, ramp1.y) annotation(Line(visible = true, origin = {-90.75, -9.142}, points = {{33.75, 0.859}, {-10.25, 0.859}, {-10.25, -0.858}, {-13.25, -0.858}}, color = {0, 0, 127}));
    connect(ramp.y, Z_PID1.u_s) annotation(Line(visible = true, origin = {-70.18, 30.409}, points = {{-33.821, 1.618}, {10.274, 1.618}, {10.274, -1.618}, {13.274, -1.618}}, color = {0, 0, 127}));
    connect(X_PID.y, newBallandPlate_2D_controlled.Xin) annotation(Line(visible = true, origin = {3.464, -1.999}, points = {{-37.464, -6.284}, {11.332, -6.284}, {11.332, 6.284}, {14.8, 6.284}}, color = {0, 0, 127}));
    connect(Z_PID1.y, newBallandPlate_2D_controlled.Zin) annotation(Line(visible = true, origin = {3.429, 20.586}, points = {{-37.335, 8.205}, {11.367, 8.205}, {11.367, -8.205}, {14.602, -8.205}}, color = {0, 0, 127}));
    connect(X_PID.u_m, add1.y) annotation(Line(visible = true, origin = {-30.788, -34.714}, points = {{-14.212, 14.431}, {-14.212, -3.81}, {14.212, -3.81}, {14.212, -6.81}}, color = {0, 0, 127}));
    connect(Z_PID1.u_m, add.y) annotation(Line(visible = true, origin = {-36.428, 55.278}, points = {{-8.478, -14.487}, {-8.478, 3.829}, {8.478, 3.829}, {8.478, 6.829}}, color = {0, 0, 127}));
    connect(y, sampler1.u) annotation(Line(visible = true, origin = {67.948, -35}, points = {{25.948, 0}, {-25.948, 0}}, color = {0, 0, 127}));
    connect(sampler.u, x) annotation(Line(visible = true, origin = {64.052, 70}, points = {{-27.052, 0}, {27.052, 0}}, color = {0, 0, 127}));
    connect(add1.u1, gain.y) annotation(Line(visible = true, origin = {-50.788, -29.893}, points = {{28.211, -34.631}, {28.212, -37.631}, {-28.212, -37.631}, {-28.212, 109.893}}, color = {0, 0, 127}));
    connect(gain.y, add.u2) annotation(Line(visible = true, origin = {-49.38, 87.021}, points = {{-29.62, -7.021}, {-0.62, -7.021}, {-0.62, 7.979}, {15.43, 7.979}, {15.43, -1.914}}, color = {0, 0, 127}));
    connect(combiTimeTable.y[1], gain.u) annotation(Line(visible = true, origin = {-105.5, 80}, points = {{-3.5, 0}, {3.5, 0}}, color = {0, 0, 127}));
    connect(sampler1.y, add1.u2) annotation(Line(visible = true, origin = {1.569, -55.788}, points = {{17.431, 20.788}, {3.431, 20.788}, {3.431, -16.42}, {-12.146, -16.42}, {-12.146, -8.736}}, color = {0, 0, 127}));
    connect(add.u1, sampler.y) annotation(Line(visible = true, origin = {-4.621, 83.021}, points = {{-17.329, 2.086}, {-17.329, 11.979}, {8.019, 11.979}, {8.019, -13.021}, {18.621, -13.021}}, color = {0, 0, 127}));
    annotation(experiment(StopTime = 1000, Interval = 0.01, __Wolfram_SynchronizeWithRealTime = true), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, origin = {0, -1.638}, fillColor = {0, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-95.461, -93.823}, {95.461, 93.823}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end Controlled_Plate_Model;

  model NewBallandPlate_2D_controlled
    parameter Real BallRadius = 0.1;
    Modelica.Blocks.Interfaces.RealInput Zin annotation(Placement(visible = true, transformation(origin = {-72.383, 44.632}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-97.643, 23.81}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput Xin annotation(Placement(visible = true, transformation(origin = {-74.012, -40.368}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-95.319, -57.143}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain(k = -1) annotation(Placement(visible = true, transformation(origin = {-22.567, 64.816}, extent = {{-5.184, -5.184}, {5.184, 5.184}}, rotation = 0)));
    ModelPlug.Boards.Arduino arduino(Port = "COM5") annotation(Placement(visible = true, transformation(origin = {59.611, 24.632}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ModelPlug.Pins.Servo servo1(Pin = 10) annotation(Placement(visible = true, transformation(origin = {54.521, -65.368}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ModelPlug.Pins.Servo servo(Pin = 9) annotation(Placement(visible = true, transformation(origin = {61.001, 59.632}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain1(k = -1) annotation(Placement(visible = true, transformation(origin = {-22.567, -70.552}, extent = {{-5.184, -5.184}, {5.184, 5.184}}, rotation = 0)));
    ConvertRange convertRange1 annotation(Placement(visible = true, transformation(origin = {12.617, -70.368}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ConvertRange convertRange annotation(Placement(visible = true, transformation(origin = {12.617, 59.632}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(servo.u, convertRange.y) annotation(Line(visible = true, origin = {31.105, 59.013}, points = {{19.896, 0.619}, {-5.488, 0.619}, {-5.488, -0.619}, {-8.919, -0.619}}, color = {0, 0, 127}));
    connect(gain.y, convertRange.u) annotation(Line(visible = true, origin = {-3.254, 62.636}, points = {{-13.611, 2.18}, {2.87, 2.18}, {2.87, -2.18}, {7.87, -2.18}}, color = {0, 0, 127}));
    connect(convertRange1.u, gain1.y) annotation(Line(visible = true, origin = {-9.877, -69.88}, points = {{14.494, 0.336}, {-7.506, 0.336}, {-6.988, -0.672}}, color = {0, 0, 127}));
    connect(convertRange1.y, servo1.u) annotation(Line(visible = true, origin = {37.431, -68.487}, points = {{-15.245, -3.119}, {4.077, -3.119}, {4.077, 3.119}, {7.09, 3.119}}, color = {0, 0, 127}));
    connect(Xin, gain1.u) annotation(Line(visible = true, origin = {-41.594, -55.46}, points = {{-32.418, 15.092}, {9.806, 15.092}, {9.806, -15.092}, {12.806, -15.092}}, color = {0, 0, 127}));
    connect(Zin, gain.u) annotation(Line(visible = true, origin = {-41.187, 54.724}, points = {{-31.196, -10.092}, {9.399, -10.092}, {9.399, 10.092}, {12.399, 10.092}}, color = {0, 0, 127}));
    connect(servo1.pinConnector, arduino.boardConnector) annotation(Line(visible = true, origin = {63.762, -16.568}, points = {{0.759, -48.8}, {3.771, -48.8}, {3.771, 28.2}, {-4.151, 28.2}, {-4.151, 41.2}}));
    connect(servo.pinConnector, arduino.boardConnector) annotation(Line(visible = true, origin = {67.649, 43.832}, points = {{3.351, 15.8}, {6.363, 15.8}, {6.363, -6.2}, {-8.039, -6.2}, {-8.039, -19.2}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {0, 255, 0}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-90, -90}, {90, 90}}), Text(visible = true, origin = {2.263, 15.993}, extent = {{-79.658, -27.5}, {79.658, 27.5}}, textString = "Plate", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -32.071}, extent = {{-83.727, -32.071}, {83.727, 32.071}}, textString = "2D", textStyle = {TextStyle.Bold})}), experiment(StopTime = 10, __Wolfram_SynchronizeWithRealTime = false), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end NewBallandPlate_2D_controlled;

  model ConvertRange
    Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-147.5, 37.5}, extent = {{-37.5, -37.5}, {37.5, 37.5}}, rotation = 0), iconTransformation(origin = {-80, 8.246}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Math.Add add annotation(Placement(visible = true, transformation(origin = {-82.826, 12.03}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = 0.15) annotation(Placement(visible = true, transformation(origin = {-125, 3.147}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const2(k = 0.7) annotation(Placement(visible = true, transformation(origin = {-130, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {-30.876, -8.376}, extent = {{-11.624, -11.624}, {11.624, 11.624}}, rotation = 0)));
    Modelica.Blocks.Math.Division division annotation(Placement(visible = true, transformation(origin = {41.669, -31.669}, extent = {{-21.669, -21.669}, {21.669, 21.669}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const1(k = 0.3) annotation(Placement(visible = true, transformation(origin = {-35, -55}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    connect(const.y, add.u2) annotation(Line(visible = true, origin = {-105.619, 3.088}, points = {{-8.381, 0.058}, {1.793, 0.058}, {1.793, -0.058}, {4.793, -0.058}}, color = {0, 0, 127}));
    connect(add.u1, u) annotation(Line(visible = true, origin = {-115.16, 29.265}, points = {{14.334, -8.235}, {9.003, -8.235}, {9.003, 8.235}, {-32.34, 8.235}}, color = {0, 0, 127}));
    annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end ConvertRange;
  annotation(experiment(__Wolfram_SynchronizeWithRealTime = false), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {0, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-90, -90}, {90, 90}}), Text(visible = true, origin = {2.716, 34.549}, extent = {{-79.658, -27.5}, {79.658, 27.5}}, textString = "Interns", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -50}, extent = {{-83.727, -32.071}, {83.727, 32.071}}, textString = "2016", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end FINAL;
