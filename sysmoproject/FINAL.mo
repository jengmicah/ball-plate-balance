model FINAL
  model BallPlateModel
    Modelica.Blocks.Interfaces.RealInput X annotation(Placement(visible = true, transformation(origin = {-122.765, 67.308}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-97.643, 23.81}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput Y annotation(Placement(visible = true, transformation(origin = {-121.953, -45}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-89.643, 15.81}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Hardware hardware annotation(Placement(visible = true, transformation(origin = {122, 25}, extent = {{-32, -32}, {32, 32}}, rotation = 0)));
    Modelica.Blocks.Continuous.Der der1 annotation(Placement(visible = true, transformation(origin = {-67.5, 44.709}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Gain p(k = 0.352277) annotation(Placement(visible = true, transformation(origin = {-24.616, 85}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Gain d(k = 0.295788) annotation(Placement(visible = true, transformation(origin = {15.002, 44.72}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Add add annotation(Placement(visible = true, transformation(origin = {47.5, 74.928}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Continuous.Filter filter1(f_cut = 10) annotation(Placement(visible = true, transformation(origin = {-29.998, 44.778}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Continuous.Der der2 annotation(Placement(visible = true, transformation(origin = {-65, -60.291}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Gain p1(k = 0.352277) annotation(Placement(visible = true, transformation(origin = {-22.116, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Gain d1(k = 0.295788) annotation(Placement(visible = true, transformation(origin = {17.502, -60.28}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {50, -30.072}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
    Modelica.Blocks.Continuous.Filter filter2(f_cut = 10) annotation(Placement(visible = true, transformation(origin = {-27.498, -60.222}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
  equation
    connect(add1.y, hardware.u1) annotation(Line(visible = true, origin = {81.913, -15.011}, points = {{-20.913, -15.061}, {5.087, -15.061}, {5.087, 15.061}, {10.738, 15.061}}, color = {0, 0, 127}));
    connect(Y, der2.u) annotation(Line(visible = true, origin = {-92.238, -52.645}, points = {{-29.715, 7.645}, {7.238, 7.645}, {7.238, -7.646}, {15.238, -7.646}}, color = {0, 0, 127}));
    connect(der2.u, p1.u) annotation(Line(visible = true, origin = {-71, -40.256}, points = {{-6, -20.035}, {-14, -20.034}, {-14, 20.034}, {36.884, 20.256}}, color = {0, 0, 127}));
    connect(p1.y, add1.u1) annotation(Line(visible = true, origin = {24.221, -22.036}, points = {{-35.337, 2.036}, {10.779, 2.036}, {10.779, -2.036}, {13.779, -2.036}}, color = {0, 0, 127}));
    connect(d1.y, add1.u2) annotation(Line(visible = true, origin = {34.126, -48.176}, points = {{-5.624, -12.104}, {0.874, -12.104}, {0.874, 12.104}, {3.874, 12.104}}, color = {0, 0, 127}));
    connect(der2.y, filter2.u) annotation(Line(visible = true, origin = {-44.623, -60.256}, points = {{-9.377, -0.035}, {2.126, -0.034}, {2.126, 0.035}, {5.125, 0.034}}, color = {0, 0, 127}));
    connect(filter2.y, d1.u) annotation(Line(visible = true, origin = {-1.498, -60.251}, points = {{-15, 0.029}, {4, 0.029}, {4, -0.029}, {7, -0.029}}, color = {0, 0, 127}));
    connect(add.y, hardware.u) annotation(Line(visible = true, origin = {81.26, 44.446}, points = {{-22.76, 30.482}, {5.74, 30.482}, {5.74, -30.482}, {11.28, -30.482}}, color = {0, 0, 127}));
    connect(X, der1.u) annotation(Line(visible = true, origin = {-94.618, 56.009}, points = {{-28.147, 11.3}, {6.514, 11.3}, {6.514, -11.3}, {15.118, -11.3}}, color = {0, 0, 127}));
    connect(der1.u, p.u) annotation(Line(visible = true, origin = {-73.5, 64.744}, points = {{-6, -20.035}, {-14, -20.034}, {-14, 20.034}, {36.884, 20.256}}, color = {0, 0, 127}));
    connect(p.y, add.u1) annotation(Line(visible = true, origin = {21.721, 82.964}, points = {{-35.337, 2.036}, {10.779, 2.036}, {10.779, -2.036}, {13.779, -2.036}}, color = {0, 0, 127}));
    connect(d.y, add.u2) annotation(Line(visible = true, origin = {31.626, 56.824}, points = {{-5.624, -12.104}, {0.874, -12.104}, {0.874, 12.104}, {3.874, 12.104}}, color = {0, 0, 127}));
    connect(der1.y, filter1.u) annotation(Line(visible = true, origin = {-47.123, 44.744}, points = {{-9.377, -0.035}, {2.126, -0.034}, {2.126, 0.035}, {5.125, 0.034}}, color = {0, 0, 127}));
    connect(filter1.y, d.u) annotation(Line(visible = true, origin = {-3.998, 44.749}, points = {{-15, 0.029}, {4, 0.029}, {4, -0.029}, {7, -0.029}}, color = {0, 0, 127}));
    annotation(experiment(StopTime = 100.0, Interval = 0.01, __Wolfram_SynchronizeWithRealTime = true), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end BallPlateModel;

  model Hardware
    Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-86.44, -41.096}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-92.062, -34.487}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput u1 annotation(Placement(visible = true, transformation(origin = {-83.56, 61.095}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-91.717, -77.971}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    ModelPlug.Pins.Servo servo(Pin = 10) annotation(Placement(visible = true, transformation(origin = {74.714, -40.631}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ModelPlug.Boards.CustomFirmata arduino(Port = "COM5", UpdatePeriod = 0.001, BaudRate = 57600) annotation(Placement(visible = true, transformation(origin = {96.44, 14.369}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ModelPlug.Pins.Servo servo1(Pin = 9) annotation(Placement(visible = true, transformation(origin = {79.714, 61.095}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TEST.ConvertRange convertRange annotation(Placement(visible = true, transformation(origin = {24.714, -38.416}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TEST.ConvertRange convertRange1 annotation(Placement(visible = true, transformation(origin = {12.407, 61.03}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ConvertRange convertRange annotation(Placement(visible = true, transformation(origin = {13.373, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ConvertRange convertRange1 annotation(Placement(visible = true, transformation(origin = {12.942, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(convertRange1.u, u) annotation(Line(visible = true, origin = {-51.87, -40.136}, points = {{56.811, 0.96}, {-11.12, 0.96}, {-11.12, -0.96}, {-34.57, -0.96}}, color = {0, 0, 127}));
    connect(servo.u, convertRange1.y) annotation(Line(visible = true, origin = {34.777, -40.934}, points = {{29.937, 0.303}, {-8.835, 0.303}, {-8.835, -0.303}, {-12.266, -0.303}}, color = {0, 0, 127}));
    connect(convertRange.y, servo1.u) annotation(Line(visible = true, origin = {56.515, 59.929}, points = {{-33.573, -1.166}, {10.187, -1.166}, {10.187, 1.166}, {13.199, 1.166}}, color = {0, 0, 127}));
    connect(u1, convertRange.u) annotation(Line(visible = true, origin = {-19.36, 60.96}, points = {{-64.2, 0.135}, {19.733, 0.135}, {19.733, -0.135}, {24.733, -0.135}}, color = {0, 0, 127}));
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
