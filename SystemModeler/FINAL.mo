model FINAL
  model BallPlateModel
    Modelica.Blocks.Interfaces.RealInput X annotation(Placement(visible = true, transformation(origin = {-122.765, 67.308}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-97.643, 23.81}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput Y annotation(Placement(visible = true, transformation(origin = {-121.953, -45}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-89.643, 15.81}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Hardware hardware annotation(Placement(visible = true, transformation(origin = {122, 25}, extent = {{-32, -32}, {32, 32}}, rotation = 0)));
  equation
    connect(Y, hardware.u1) annotation(Line(visible = true, origin = {36.174, -22.475}, points = {{-158.127, -22.525}, {50.826, -22.525}, {50.826, 22.525}, {56.476, 22.525}}, color = {0, 0, 127}));
    connect(X, hardware.u) annotation(Line(visible = true, origin = {35.944, 40.636}, points = {{-158.709, 26.672}, {51.056, 26.672}, {51.056, -26.672}, {56.596, -26.672}}, color = {0, 0, 127}));
    annotation(experiment(StopTime = 100.0, Interval = 0.01, __Wolfram_SynchronizeWithRealTime = true), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end BallPlateModel;

  model Hardware
    Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-86.44, -41.096}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-92.062, -34.487}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput u1 annotation(Placement(visible = true, transformation(origin = {-83.56, 61.095}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-91.717, -77.971}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    ModelPlug.Pins.Servo servo(Pin = 10) annotation(Placement(visible = true, transformation(origin = {74.714, -40.631}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ModelPlug.Boards.CustomFirmata arduino(Port = "COM5", UpdatePeriod = 0.001, BaudRate = 57600) annotation(Placement(visible = true, transformation(origin = {96.44, 14.369}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ModelPlug.Pins.Servo servo1(Pin = 9) annotation(Placement(visible = true, transformation(origin = {79.714, 61.095}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ConvertRange convertRange annotation(Placement(visible = true, transformation(origin = {13.373, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ConvertRange convertRange1 annotation(Placement(visible = true, transformation(origin = {1.904, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ConvertRange convertRange annotation(Placement(visible = true, transformation(origin = {11.774, 65}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ConvertRange convertRange1 annotation(Placement(visible = true, transformation(origin = {11.774, 65}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(u, convertRange1.u) annotation(Line(visible = true, origin = {-28.682, -40.136}, points = {{-57.758, -0.96}, {17.586, -0.96}, {17.586, 0.96}, {22.586, 0.96}}, color = {0, 0, 127}));
    connect(convertRange.u, u1) annotation(Line(visible = true, origin = {-50.001, 63.46}, points = {{53.776, 2.365}, {-10.109, 2.365}, {-10.109, -2.365}, {-33.559, -2.365}}, color = {0, 0, 127}));
    connect(convertRange.y, servo1.u) annotation(Line(visible = true, origin = {56.115, 62.429}, points = {{-34.772, 1.334}, {10.586, 1.334}, {10.586, -1.334}, {13.599, -1.334}}, color = {0, 0, 127}));
    connect(convertRange1.y, servo.u) annotation(Line(visible = true, origin = {49.898, -40.934}, points = {{-38.424, -0.303}, {11.804, -0.303}, {11.804, 0.303}, {14.816, 0.303}}, color = {0, 0, 127}));
    connect(servo1.pinConnector, arduino.boardConnector) annotation(Line(visible = true, origin = {94.198, 45.519}, points = {{-4.484, 15.576}, {2.242, 15.575}, {2.242, -31.15}}));
    connect(servo.pinConnector, arduino.boardConnector) annotation(Line(visible = true, origin = {92.531, -22.298}, points = {{-7.817, -18.333}, {3.909, -18.333}, {3.909, 36.667}}));
    annotation(experiment(__Wolfram_SynchronizeWithRealTime = false), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {0, 0, 255}, extent = {{-63.13, -63.973}, {63.13, 63.973}}), Text(visible = true, origin = {-3.644, 3.095}, extent = {{-53.644, -25}, {53.644, 25}}, textString = "Hardware")}), Diagram(coordinateSystem(extent = {{-191.637, -105}, {220, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end Hardware;

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
  annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end FINAL;
