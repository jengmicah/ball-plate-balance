package DCMotorInteractive
  model ExampleModel "Example showing dynamic control through WSMLink"
    extends Modelica.Icons.Example;
    Modelica.Blocks.Interfaces.RealOutput outputSpeed "The speed of the motor" annotation(Placement(visible = true, transformation(origin = {85, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput userInput "Input from the user, provided via Mathematica" annotation(Placement(visible = true, transformation(origin = {-70, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  protected
    DCMotorInteractive.Components.DCMotor DCMotor "Physical system under control from the added signals" annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  protected
    Modelica.Blocks.Math.Add add "Combine the base level and the user signal" annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  protected
    Modelica.Blocks.Sources.Constant baseLevel(k = 1) "A base level for the speed of the motor" annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(add.u2, userInput) annotation(Line(visible = true, origin = {-37.225, -13}, points = {{25.225, 7}, {-2.775, 7}, {-2.775, -7}, {-32.775, -7}}, color = {0, 0, 127}));
    connect(DCMotor.w, outputSpeed) annotation(Line(visible = true, origin = {69.88800000000001, -3.5}, points = {{-18.888, -3.5}, {1.888, -3.5}, {1.888, 3.5}, {15.112, 3.5}}, color = {0, 0, 127}));
    connect(baseLevel.y, add.u1) annotation(Line(visible = true, origin = {-47.75, 13}, points = {{-1.25, 7}, {7.75, 7}, {7.75, -7}, {35.75, -7}}, color = {0, 0, 127}));
    connect(add.y, DCMotor.V) annotation(Line(visible = true, origin = {19.5, 0}, points = {{-8.5, 0}, {8.5, 0}}, color = {0, 0, 127}));
    annotation(experiment(StopTime = 60, Interval = 0.01, __Wolfram_SynchronizeWithRealTime = true), preferredView = "info", Documentation(info = "<html><!--WSMINSERTIONTAGSTART ExampleModel -->
   <head>
   <style type=\"text/css\">
   
  body {
   padding: 0px;
   margin: 0px;
  }
  
  a {
   color: #cf1d24;
  }
  
  a.target {
   padding-top: 40px;
   margin-top: -40px;
  }
  
  p {
   font-family: arial;
   font-size: 13;
   margin: 9px 40px 5px 40px;
   padding-bottom: 0px;
   color: #555555;
   max-width: 800px;
  }
  
  h1 {
   font-size: 30;
   color: #cf1d24;
   font-weight: bold;
   margin-left: 20px;
   margin-top: 32px;
   margin-bottom: 15px;
   margin-right: 20px;
   padding-top: 0px;
  }
  
  h2 {
   font-size: 20;
   color: #cf1d24;
   font-weight: bold;
   margin-left: 20px;
   margin-right: 20px;
   margin-top: 5px;
   margin-bottom: 9px;
  }
  
  h3 {
   background: url('./DocumentationFiles/dingbat3.png') no-repeat 0 0;
   font-size: 14px;
   font-family: helvetica;
   color: #4B4B4B;
   font-weight: bold;
   padding-left: 18px;
   margin-left: 20px;
   margin-right: 20px;
   margin-top: 12px;
   margin-bottom: 8px;
  }
  
  ul {
   font-family: arial;
   font-size: 13;
   margin: 9px 40px 5px 40px;
   padding-bottom: 0px;
   color: #555555;
   max-width: 800px;
   list-style-type: square;
  }
  
  li {
   margin-left: 0px;
   margin-top: 4px;
   margin-bottom: 2px;
   padding-left: 0px;
  }
  
  div.header {
   background: url('./DocumentationFiles/WSMLogo.png') no-repeat 0 0;
   height: 96px;
   margin-top: 35px;
   background-color: #871613;
  }
  
  .headerspan {
   font-family: arial;
   text-decoration: none;
   font-size: 12px;
   font-weight: bold;
   display: inline-block;
   height: 35px;
   color: gray;
   padding: 0px;
   margin: 0px;
   margin-left: 20px;
  }
  
  .headera {
   font-family: arial;
   text-decoration: none;
   font-size: 12px;
   font-weight: bold;
   padding: 0px;
   color: inherit;
   vertical-align: middle;
   margin: 0px;
  }
  
  .headerlinkdiv {
   background: black;
   padding: 0px;
   height: 35px;
   margin: 0px;
   position: fixed; top: 0px; left: 0px; width: 100%;
  }
  
  .contenttable {
   -webkit-box-shadow: 3px 3px 3px #DDDDDD;
   border-top: 3px solid #cf1d24;
   background: #f9f9f9;
   max-width: 500px;
   margin: 15px 15px 0px 20px;
   padding: 6px 10px 3px 10px;
  }
  
  .contenttableheader {
   color: #a4a4a4;
   font-size: 14px;
   font-family: arial;
  }
  
  .contenttabletable {
   border: 0px solid #FFFFFF;
   padding: 0px;
   padding-left: 20px;
  }
  
  .contenttable tr td {
   padding: 3px;
   min-width: 200px;
  }
  
  .contenttable tr td a {
   color: #555555;
   text-decoration: none;
   font-size: 13px;
   font-family: arial;
  }
  
  .hacek {
   color: #cf1d24;
   font-size: 25px;
   font-weight: plain;
   vertical-align: -40%;
  }
  
  .mathematicapointerwrapper {
   border: 0px solid #DDDDDD;
   margin: 15px 15px 15px 40px;
   padding: 0px;
   max-width: 500px;
  }
  
  .mathematicapointertop {
   border: 1px solid #DDDDDD;
   background-color: #F2F2F2;
   padding: 0px;
   max-width: 500px;
   height: 4px;
  }
  
  .mathematicapointerdiv {
   background: url('./DocumentationFiles/mathematicabook.png') no-repeat 5 5;
   border: 1px solid #DDDDDD;
   background-color: #FFFFFF;
   margin: 0px;
   padding: 15px 9px 9px 89px;
   max-width: 500px;
   min-height: 67px;
  }
  
  p.mathematicapointer {
   padding: 0px;
   margin: 0px;
   font-size: 12px;
  }
  
  .infoboxwrapper {
   border: 0px solid #DDDDDD;
   -webkit-box-shadow: 3px 3px 3px #DDDDDD;
   margin: 15px 15px 15px 40px;
   padding: 0px;
   max-width: 500px;
  }
  
  .infoboxtop {
   background: url('./DocumentationFiles/infotick.png') no-repeat 12 2;
   border: 1px solid #DDDDDD;
   background-color: #F2F2F2;
   padding: 0px;
   max-width: 500px;
   height: 37px;
  }
  
  div.infobox {
   border: 1px solid #DDDDDD;
   background-color: #FFFFFF;
   margin: 0px;
   padding: 15px;
   max-width: 500px;
  }
  
  p.infobox {
   padding: 0px;
   margin: 0px;
   font-size: 12px;
  }
  
  h2.legal {
   font-family: arial;
   font-size: 14;
   color: #cf1d24;
   margin: 15px 15px 15px 20px;
   font-weight: bold;
  }
  
  h3.legal {
   background: url('./DocumentationFiles/dingbat3.png') no-repeat 0 0;
   font-family: arial;
   font-size: 12;
   color: #808080;
   margin-left: 38px;
   padding-left: 12px;
   font-weight: bold;
  }
  
  ul.legal {
   font-size: 10px;
   font-family: arial;
   color: #555555;
   margin-left: 28px;
  }
  
  ul.legal li {
   margin-left: 0px;
   margin-top: 4px;
   margin-bottom: 2px;
   padding-left: 0px;
  }
  
  p.legallarge {
   font-size: 12px;
   margin-left: 38px;
  }
  
  p.legalsmall {
   font-size: 11px;
   margin-left: 38px;
   padding-left: 12px;
  }
  
  .legalend {
   height: 10px;
  }
  
  .variablename {
   font-family: Courier New, Courier;
  }
  
  .dialogelement {
   font-weight: bold;
  }
  
  .menuitem {
   font-weight: bold;
  }
  
  .mr {
   font-family: Courier New, Courier;
  }
  
  
   </style>
   </head>
   <body>
   
  <div class=\"headerlinkdiv\">
  
   <span class=\"headerspan\" style=\"background: url(DocumentationFiles/examples.png) no-repeat 0 0;
   padding-left: 24px;
   \"
   onmouseover=\"
   	this.style.color = 'white';
   	this.style.background = 'url(DocumentationFiles/examples_active.png) no-repeat 0 0';
   \"
   onmouseout=\"
   	this.style.color = 'gray';
   	this.style.background = 'url(DocumentationFiles/examples.png) no-repeat 0 0';
   \"><a href=\"http://www.wolfram.com/system-modeler/industry-examples/\" class=\"headera\">More Examples</a></span>
  
   <span class=\"headerspan\" style=\"background: url(DocumentationFiles/video.png) no-repeat 0 0;
   padding-left: 29px;
   \"
   onmouseover=\"
   	this.style.color = 'white';
   	this.style.background = 'url(DocumentationFiles/video_active.png) no-repeat 0 0';
   \"
   onmouseout=\"
   	this.style.color = 'gray';
   	this.style.background = 'url(DocumentationFiles/video.png) no-repeat 0 0';
   \"><a href=\"http://www.wolfram.com/system-modeler/resources/get-started/\" class=\"headera\">Introductory Videos</a></span>
  
   <span class=\"headerspan\" style=\"background: url(DocumentationFiles/docs.png) no-repeat 0 0;
   padding-left: 20px;
   \"
   onmouseover=\"
   	this.style.color = 'white';
   	this.style.background = 'url(DocumentationFiles/docs_active.png) no-repeat 0 0';
   \"
   onmouseout=\"
   	this.style.color = 'gray';
   	this.style.background = 'url(DocumentationFiles/docs.png) no-repeat 0 0';
   \"><a href=\"http://reference.wolfram.com/system-modeler\" class=\"headera\">Documentation</a></span>
  
   <span class=\"headerspan\" style=\"background: url(DocumentationFiles/contact.png) no-repeat 0 0;
   padding-left: 24px;
   \"
   onmouseover=\"
   	this.style.color = 'white';
   	this.style.background = 'url(DocumentationFiles/contact_active.png) no-repeat 0 0';
   \"
   onmouseout=\"
   	this.style.color = 'gray';
   	this.style.background = 'url(DocumentationFiles/contact.png) no-repeat 0 0';
   \"><a href=\"http://www.wolfram.com/system-modeler/contact-us/\" class=\"headera\">Contact Us</a></span>
  </div><div class=\"header\">&nbsp;</div><h1>Interative Simulation Control in Real Time: DC Motor</h1><div class=\"contenttable\">
   <span class=\"contenttableheader\">CONTENTS:</span><br/>
   <table class=\"contenttabletable\"><tr><td><a href=\"#\" onClick=\"document.getElementById('headerTag_Introduction').scrollIntoView(); return false;\"><span class=\"hacek\">&#711;</span> Introduction</a></td><td><a href=\"#\" onClick=\"document.getElementById('headerTag_DCMotorInteraction').scrollIntoView(); return false;\"><span class=\"hacek\">&#711;</span> DC Motor Interaction</a></td></tr></table></div><a id=\"headerTag_Introduction\" class=\"target\">&nbsp;</a>
    <h2>Introduction</h2>
    <p class=\"\">
This model demonstrates how <i><span style=\"font-style:italic;\">Mathematica</span></i> can be used to let the user interact with a model in real time simulations. 
</p><p class=\"\">
In order to get the full experience of this example, you need the following:
</p><ul><li>Wolfram <span style=\"font-style:italic;\">Mathematica</span>; a free trial download is available at <a href=\"http://www.wolfram.com/mathematica\">www.wolfram.com/mathematica</a></li><li>The <a href=\"DCMotor.nb\">DCMotor.nb</a> notebook that came in the same bundle as this model</li></ul><div class=\"mathematicapointerwrapper\">
   <div class=\"mathematicapointertop\">&nbsp;</div>
   <div class=\"mathematicapointerdiv\"><p class=\"mathematicapointer\">
These pages show an overview of the example. For the full example, open the accompanying notebook <a href=\"DCMotor.nb\">DCMotor.nb</a> in <span style=\"font-style:italic;\">Mathematica</span>.
</p></div>
   </div><a id=\"headerTag_DCMotorInteraction\" class=\"target\">&nbsp;</a>
    <h2>DC Motor Interaction</h2>
    <p class=\"\">
Using <i><span style=\"font-style:italic;\">Mathematica</span></i> combined with real time simulations from models in <i><span style=\"font-style:italic;\">SystemModeler</span></i>, the input to the model can be altered by the user in an ongoing simulation.
</p><p class=\"\">
<img src=\"DocumentationFiles/animation.png\" alt=\"\"/>
</p><p class=\"\">
Go to the <i><span style=\"font-style:italic;\">Mathematica</span></i> notebook to try it out!
</p><h2 class=\"legal\"> <a href=\"#\" onclick=\"
   if(document.getElementById('7').style.display == 'none'){
   document.getElementById('7').style.display = 'block';
   document.getElementById('show7').style.display = 'none';
   document.getElementById('hide7').style.display = 'inline';
   } else {
   document.getElementById('7').style.display = 'none';
   document.getElementById('show7').style.display = 'inline';
   document.getElementById('hide7').style.display = 'none';
   };
   return false;\" style=\"text-decoration: inherit; color: inherit\"><img src=\"DocumentationFiles/showhide2.png\" alt=\"Show\" id=\"show7\" style=\"display: inline; vertical-align: text-bottom;\" /><img src=\"DocumentationFiles/showhide.png\" alt=\"Hide\" id=\"hide7\" style=\"display: none; vertical-align: text-bottom;\" />Terms and Conditions of Use</a> </h2>
    <span id=\"7\" style=\"display: none;\"><p class=\"legallarge\">
This domain example is an informational resource made freely available by Wolfram Research.
</p><h3 class=\"legal\">Use of This Example</h3>
    <span id=\"8\" style=\"display: block;\"><ul class=\"legal\"><li>You may not use this example for any purpose that is unlawful or dangerous.</li><li>You assume total responsibility and risk for your use of this example.</li><li>You may not present this example with any alteration to its trade dress, trademarks, or design.</li></ul></span><h3 class=\"legal\">License</h3>
    <span id=\"9\" style=\"display: block;\"><p class=\"legalsmall\">
All content in this bundle is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License. By accessing the content or using it in any way, you accept and agree to be bound by the terms of this license. If you do not agree to these Terms of Use, you may not use this content. Wolfram Research reserves the right to change, modify, add to, or remove portions of these Terms of Use at any time without notice. Please refer back to <a href=\"http://www.wolfram.com\">www.wolfram.com</a> for the latest Terms of Use.
</p><p class=\"legalsmall\">
A summary of the licensing terms can be found at:<br>
        <a href=\"http://creativecommons.org/licenses/by-nc-sa/3.0\">http://creativecommons.org/licenses/by-nc-sa/3.0</a>
</p><p class=\"legalsmall\">
The full legal code can be found at:<br>
        <a href=\"http://creativecommons.org/licenses/by-nc-sa/3.0/legalcode\">http://creativecommons.org/licenses/by-nc-sa/3.0/legalcode</a>
</p></span></span><div class=\"legalend\">&nbsp;</div>
   </body>
   <!--WSMINSERTIONTAGEND ExampleModel --></html>", revisions = ""), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100, 100}}), Ellipse(visible = true, lineColor = {75, 138, 73}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100, 100}}), Polygon(visible = true, lineColor = {0, 0, 255}, fillColor = {75, 138, 73}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-36, 60}, {64, 0}, {-36, -60}, {-36, 60}})}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end ExampleModel;

  package Components "Package containing components"
    extends Modelica.Icons.Package;

    model DCMotor "A simple model of a DC motor"
      parameter Real R = 13;
      parameter Real L = 1;
      parameter Real J = 1;
      parameter Real EMFk = 1.6;
      parameter Real Q;
      Modelica.Electrical.Analog.Basic.Resistor resistor(R = R) annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor inductor(L = L) annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.EMF EMF1(k = EMFk) annotation(Placement(visible = true, transformation(origin = {-0, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(visible = true, transformation(origin = {-40.381, -57.5}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation(Placement(visible = true, transformation(origin = {-80, -0}, extent = {{-10, 10}, {10, -10}}, rotation = 1350)));
      Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput w annotation(Placement(visible = true, transformation(origin = {110, -0}, extent = {{-10, -10}, {10, 10}}, rotation = -360), iconTransformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput V(start = 10) annotation(Placement(visible = true, transformation(origin = {-120.001, -0.001}, extent = {{-10.001, -10.001}, {10.001, 10.001}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia(J = J) annotation(Placement(visible = true, transformation(origin = {41.853, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a1 annotation(Placement(visible = true, transformation(origin = {80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(inductor.n, EMF1.p) annotation(Line(visible = true, origin = {-3.333, 30}, points = {{-6.667, 10}, {3.333, 10}, {3.333, -20}}, color = {0, 0, 255}));
      connect(resistor.n, inductor.p) annotation(Line(visible = true, origin = {-40, 40}, points = {{-10, 0}, {10, 0}}, color = {0, 0, 255}));
      connect(resistor.p, signalVoltage.p) annotation(Line(visible = true, origin = {-76.667, 30}, points = {{6.667, 10}, {-3.333, 10}, {-3.333, -20}}, color = {0, 0, 255}));
      connect(ground.p, signalVoltage.n) annotation(Line(visible = true, origin = {-55.381, -39.375}, points = {{15, -10.625}, {15, -0.625}, {-24.619, -0.625}, {-24.619, 29.375}}, color = {0, 0, 255}));
      connect(EMF1.n, ground.p) annotation(Line(visible = true, origin = {-9.811, -42.875}, points = {{9.811, 32.875}, {9.81, 2.875}, {-30.57, 2.875}, {-30.57, -7.125}}, color = {0, 0, 255}));
      connect(V, signalVoltage.v) annotation(Line(visible = true, origin = {-103.5, -0}, points = {{-16.5, -0}, {16.5, 0}}, color = {0, 0, 127}));
      connect(EMF1.flange, inertia.flange_a) annotation(Line(visible = true, origin = {20.927, 0}, points = {{-10.927, 0}, {10.927, 0}}));
      connect(inertia.flange_b, speedSensor.flange) annotation(Line(visible = true, origin = {60.927, 0}, points = {{-9.074, 0}, {9.073, 0}}));
      connect(speedSensor.w, w) annotation(Line(visible = true, origin = {100.5, 0}, points = {{-9.5, 0}, {9.5, -0}}, color = {0, 0, 127}));
      connect(speedSensor.flange, flange_a1) annotation(Line(visible = true, origin = {76.497, 10}, points = {{-6.497, -10}, {-16.497, -10}, {-16.497, 30}, {3.503, 30}}));
      annotation(experiment(StartTime = 0.0, StopTime = 25), __Wolfram(useDocumentationTemplate = false), Documentation(info = "<html><!--WSMINSERTIONTAGSTART Engine -->
   <head>
   <style type=\"text/css\">
   
  body {
   padding: 0px;
   margin: 0px;
  }
  
  a {
   color: #cf1d24;
  }
  
  a.target {
   padding-top: 40px;
   margin-top: -40px;
  }
  
  p {
   font-family: arial;
   font-size: 13;
   margin: 9px 40px 5px 40px;
   padding-bottom: 0px;
   color: #555555;
   max-width: 800px;
  }
  
  h1 {
   font-size: 30;
   color: #cf1d24;
   font-weight: bold;
   margin-left: 20px;
   margin-top: 32px;
   margin-bottom: 15px;
   margin-right: 20px;
   padding-top: 0px;
  }
  
  h2 {
   font-size: 20;
   color: #cf1d24;
   font-weight: bold;
   margin-left: 20px;
   margin-right: 20px;
   margin-top: 5px;
   margin-bottom: 9px;
  }
  
  h3 {
   background: url('./DocumentationFiles/dingbat3.png') no-repeat 0 0;
   font-size: 14px;
   font-family: helvetica;
   color: #4B4B4B;
   font-weight: bold;
   padding-left: 18px;
   margin-left: 20px;
   margin-right: 20px;
   margin-top: 12px;
   margin-bottom: 8px;
  }
  
  ul {
   font-family: arial;
   font-size: 13;
   margin: 9px 40px 5px 40px;
   padding-bottom: 0px;
   color: #555555;
   max-width: 800px;
   list-style-type: square;
  }
  
  li {
   margin-left: 0px;
   margin-top: 4px;
   margin-bottom: 2px;
   padding-left: 0px;
  }
  
  div.header {
   background: url('./DocumentationFiles/WSMLogo.png') no-repeat 0 0;
   height: 96px;
   margin-top: 35px;
   background-color: #871613;
  }
  
  .headerspan {
   font-family: arial;
   text-decoration: none;
   font-size: 12px;
   font-weight: bold;
   display: inline-block;
   height: 35px;
   color: gray;
   padding: 0px;
   margin: 0px;
   margin-left: 20px;
  }
  
  .headera {
   font-family: arial;
   text-decoration: none;
   font-size: 12px;
   font-weight: bold;
   padding: 0px;
   color: inherit;
   vertical-align: middle;
   margin: 0px;
  }
  
  .headerlinkdiv {
   background: black;
   padding: 0px;
   height: 35px;
   margin: 0px;
   position: fixed; top: 0px; left: 0px; width: 100%;
  }
  
  .contenttable {
   -webkit-box-shadow: 3px 3px 3px #DDDDDD;
   border-top: 3px solid #cf1d24;
   background: #f9f9f9;
   max-width: 500px;
   margin: 15px 15px 0px 20px;
   padding: 6px 10px 3px 10px;
  }
  
  .contenttableheader {
   color: #a4a4a4;
   font-size: 14px;
   font-family: arial;
  }
  
  .contenttabletable {
   border: 0px solid #FFFFFF;
   padding: 0px;
   padding-left: 20px;
  }
  
  .contenttable tr td {
   padding: 3px;
   min-width: 200px;
  }
  
  .contenttable tr td a {
   color: #555555;
   text-decoration: none;
   font-size: 13px;
   font-family: arial;
  }
  
  .hacek {
   color: #cf1d24;
   font-size: 25px;
   font-weight: plain;
   vertical-align: -40%;
  }
  
  .mathematicapointerwrapper {
   border: 0px solid #DDDDDD;
   margin: 15px 15px 15px 40px;
   padding: 0px;
   max-width: 500px;
  }
  
  .mathematicapointertop {
   border: 1px solid #DDDDDD;
   background-color: #F2F2F2;
   padding: 0px;
   max-width: 500px;
   height: 4px;
  }
  
  .mathematicapointerdiv {
   background: url('./DocumentationFiles/mathematicabook.png') no-repeat 5 5;
   border: 1px solid #DDDDDD;
   background-color: #FFFFFF;
   margin: 0px;
   padding: 15px 9px 9px 89px;
   max-width: 500px;
   min-height: 67px;
  }
  
  p.mathematicapointer {
   padding: 0px;
   margin: 0px;
   font-size: 12px;
  }
  
  .infoboxwrapper {
   border: 0px solid #DDDDDD;
   -webkit-box-shadow: 3px 3px 3px #DDDDDD;
   margin: 15px 15px 15px 40px;
   padding: 0px;
   max-width: 500px;
  }
  
  .infoboxtop {
   background: url('./DocumentationFiles/infotick.png') no-repeat 12 2;
   border: 1px solid #DDDDDD;
   background-color: #F2F2F2;
   padding: 0px;
   max-width: 500px;
   height: 37px;
  }
  
  div.infobox {
   border: 1px solid #DDDDDD;
   background-color: #FFFFFF;
   margin: 0px;
   padding: 15px;
   max-width: 500px;
  }
  
  p.infobox {
   padding: 0px;
   margin: 0px;
   font-size: 12px;
  }
  
  h2.legal {
   font-family: arial;
   font-size: 14;
   color: #cf1d24;
   margin: 15px 15px 15px 20px;
   font-weight: bold;
  }
  
  h3.legal {
   background: url('./DocumentationFiles/dingbat3.png') no-repeat 0 0;
   font-family: arial;
   font-size: 12;
   color: #808080;
   margin-left: 38px;
   padding-left: 12px;
   font-weight: bold;
  }
  
  ul.legal {
   font-size: 10px;
   font-family: arial;
   color: #555555;
   margin-left: 28px;
  }
  
  ul.legal li {
   margin-left: 0px;
   margin-top: 4px;
   margin-bottom: 2px;
   padding-left: 0px;
  }
  
  p.legallarge {
   font-size: 12px;
   margin-left: 38px;
  }
  
  p.legalsmall {
   font-size: 11px;
   margin-left: 38px;
   padding-left: 12px;
  }
  
  .legalend {
   height: 10px;
  }
  
  .variablename {
   font-family: Courier New, Courier;
  }
  
  .dialogelement {
   font-weight: bold;
  }
  
  .menuitem {
   font-weight: bold;
  }
  
  .mr {
   font-family: Courier New, Courier;
  }
  
  
   </style>
   </head>
   <body>
   
  <div class=\"headerlinkdiv\">
  
   <span class=\"headerspan\" style=\"background: url(DocumentationFiles/examples.png) no-repeat 0 0;
   padding-left: 24px;
   \"
   onmouseover=\"
   	this.style.color = 'white';
   	this.style.background = 'url(DocumentationFiles/examples_active.png) no-repeat 0 0';
   \"
   onmouseout=\"
   	this.style.color = 'gray';
   	this.style.background = 'url(DocumentationFiles/examples.png) no-repeat 0 0';
   \"><a href=\"http://www.wolfram.com/system-modeler/industry-examples/\" class=\"headera\">More Examples</a></span>
  
   <span class=\"headerspan\" style=\"background: url(DocumentationFiles/video.png) no-repeat 0 0;
   padding-left: 29px;
   \"
   onmouseover=\"
   	this.style.color = 'white';
   	this.style.background = 'url(DocumentationFiles/video_active.png) no-repeat 0 0';
   \"
   onmouseout=\"
   	this.style.color = 'gray';
   	this.style.background = 'url(DocumentationFiles/video.png) no-repeat 0 0';
   \"><a href=\"http://www.wolfram.com/system-modeler/resources/get-started/\" class=\"headera\">Introductory Videos</a></span>
  
   <span class=\"headerspan\" style=\"background: url(DocumentationFiles/docs.png) no-repeat 0 0;
   padding-left: 20px;
   \"
   onmouseover=\"
   	this.style.color = 'white';
   	this.style.background = 'url(DocumentationFiles/docs_active.png) no-repeat 0 0';
   \"
   onmouseout=\"
   	this.style.color = 'gray';
   	this.style.background = 'url(DocumentationFiles/docs.png) no-repeat 0 0';
   \"><a href=\"http://reference.wolfram.com/system-modeler\" class=\"headera\">Documentation</a></span>
  
   <span class=\"headerspan\" style=\"background: url(DocumentationFiles/contact.png) no-repeat 0 0;
   padding-left: 24px;
   \"
   onmouseover=\"
   	this.style.color = 'white';
   	this.style.background = 'url(DocumentationFiles/contact_active.png) no-repeat 0 0';
   \"
   onmouseout=\"
   	this.style.color = 'gray';
   	this.style.background = 'url(DocumentationFiles/contact.png) no-repeat 0 0';
   \"><a href=\"http://www.wolfram.com/system-modeler/contact-us/\" class=\"headera\">Contact Us</a></span>
  </div><div class=\"header\">&nbsp;</div><h1>DC Motor</h1><a id=\"headerTag_Introduction\" class=\"target\">&nbsp;</a>
    <h2>Introduction</h2>
    <p class=\"\">
This component is an example from the Introductory Examples <a href=\"Modelica://IntroductoryExamples.MultiDomain.DCMotor\">MultiDomain.DCMotor</a>.
</p><h2 class=\"legal\"> <a href=\"#\" onclick=\"
   if(document.getElementById('10').style.display == 'none'){
   document.getElementById('10').style.display = 'block';
   document.getElementById('show10').style.display = 'none';
   document.getElementById('hide10').style.display = 'inline';
   } else {
   document.getElementById('10').style.display = 'none';
   document.getElementById('show10').style.display = 'inline';
   document.getElementById('hide10').style.display = 'none';
   };
   return false;\" style=\"text-decoration: inherit; color: inherit\"><img src=\"DocumentationFiles/showhide2.png\" alt=\"Show\" id=\"show10\" style=\"display: inline; vertical-align: text-bottom;\" /><img src=\"DocumentationFiles/showhide.png\" alt=\"Hide\" id=\"hide10\" style=\"display: none; vertical-align: text-bottom;\" />Terms and Conditions of Use</a> </h2>
    <span id=\"10\" style=\"display: none;\"><p class=\"legallarge\">
This domain example is an informational resource made freely available by Wolfram Research.
</p><h3 class=\"legal\">Use of This Example</h3>
    <span id=\"11\" style=\"display: block;\"><ul class=\"legal\"><li>You may not use this example for any purpose that is unlawful or dangerous.</li><li>You assume total responsibility and risk for your use of this example.</li><li>You may not present this example with any alteration to its trade dress, trademarks, or design.</li></ul></span><h3 class=\"legal\">License</h3>
    <span id=\"12\" style=\"display: block;\"><p class=\"legalsmall\">
All content in this bundle is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License. By accessing the content or using it in any way, you accept and agree to be bound by the terms of this license. If you do not agree to these Terms of Use, you may not use this content. Wolfram Research reserves the right to change, modify, add to, or remove portions of these Terms of Use at any time without notice. Please refer back to <a href=\"http://www.wolfram.com\">www.wolfram.com</a> for the latest Terms of Use.
</p><p class=\"legalsmall\">
A summary of the licensing terms can be found at:<br>
        <a href=\"http://creativecommons.org/licenses/by-nc-sa/3.0\">http://creativecommons.org/licenses/by-nc-sa/3.0</a>
</p><p class=\"legalsmall\">
The full legal code can be found at:<br>
        <a href=\"http://creativecommons.org/licenses/by-nc-sa/3.0/legalcode\">http://creativecommons.org/licenses/by-nc-sa/3.0/legalcode</a>
</p></span></span><div class=\"legalend\">&nbsp;</div>
   </body>
   <!--WSMINSERTIONTAGEND Engine --></html>", revisions = ""), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-0, 260}, extent = {{-100, -150}, {100, -110}}, textString = "%name", fontName = "Arial"), Rectangle(visible = true, lineColor = {112, 31, 0}, fillColor = {255, 85, 0}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 0, extent = {{-50, -75}, {75, 75}}), Polygon(visible = true, lineColor = {112, 31, 0}, fillColor = {183, 47, 0}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 0, points = {{-50, 75}, {-75, 50}, {-75, -50}, {-50, -75}}), Rectangle(visible = true, lineColor = {64, 64, 64}, fillColor = {192, 192, 192}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 0, extent = {{75, -25}, {100, 25}}), Polygon(visible = true, lineColor = {51, 51, 51}, fillColor = {51, 51, 51}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, lineThickness = 0, points = {{-100, -100}, {-100, -87.23}, {-50, -87.23}, {0, 25}, {25, 25}, {75, -86.93000000000001}, {100, -86.93000000000001}, {100, -100}}), Ellipse(visible = true, fillColor = {192, 192, 192}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, lineThickness = 0, extent = {{0, -12.5}, {25, 12.5}})}));
    end DCMotor;
    annotation(preferredView = "info", Documentation(info = "<html><!--WSMINSERTIONTAGSTART Components -->
   <head>
   <style type=\"text/css\">
   
  body {
   padding: 0px;
   margin: 0px;
  }
  
  a {
   color: #cf1d24;
  }
  
  a.target {
   padding-top: 40px;
   margin-top: -40px;
  }
  
  p {
   font-family: arial;
   font-size: 13;
   margin: 9px 40px 5px 40px;
   padding-bottom: 0px;
   color: #555555;
   max-width: 800px;
  }
  
  h1 {
   font-size: 30;
   color: #cf1d24;
   font-weight: bold;
   margin-left: 20px;
   margin-top: 32px;
   margin-bottom: 15px;
   margin-right: 20px;
   padding-top: 0px;
  }
  
  h2 {
   font-size: 20;
   color: #cf1d24;
   font-weight: bold;
   margin-left: 20px;
   margin-right: 20px;
   margin-top: 5px;
   margin-bottom: 9px;
  }
  
  h3 {
   background: url('./DocumentationFiles/dingbat3.png') no-repeat 0 0;
   font-size: 14px;
   font-family: helvetica;
   color: #4B4B4B;
   font-weight: bold;
   padding-left: 18px;
   margin-left: 20px;
   margin-right: 20px;
   margin-top: 12px;
   margin-bottom: 8px;
  }
  
  ul {
   font-family: arial;
   font-size: 13;
   margin: 9px 40px 5px 40px;
   padding-bottom: 0px;
   color: #555555;
   max-width: 800px;
   list-style-type: square;
  }
  
  li {
   margin-left: 0px;
   margin-top: 4px;
   margin-bottom: 2px;
   padding-left: 0px;
  }
  
  div.header {
   background: url('./DocumentationFiles/WSMLogo.png') no-repeat 0 0;
   height: 96px;
   margin-top: 35px;
   background-color: #871613;
  }
  
  .headerspan {
   font-family: arial;
   text-decoration: none;
   font-size: 12px;
   font-weight: bold;
   display: inline-block;
   height: 35px;
   color: gray;
   padding: 0px;
   margin: 0px;
   margin-left: 20px;
  }
  
  .headera {
   font-family: arial;
   text-decoration: none;
   font-size: 12px;
   font-weight: bold;
   padding: 0px;
   color: inherit;
   vertical-align: middle;
   margin: 0px;
  }
  
  .headerlinkdiv {
   background: black;
   padding: 0px;
   height: 35px;
   margin: 0px;
   position: fixed; top: 0px; left: 0px; width: 100%;
  }
  
  .contenttable {
   -webkit-box-shadow: 3px 3px 3px #DDDDDD;
   border-top: 3px solid #cf1d24;
   background: #f9f9f9;
   max-width: 500px;
   margin: 15px 15px 0px 20px;
   padding: 6px 10px 3px 10px;
  }
  
  .contenttableheader {
   color: #a4a4a4;
   font-size: 14px;
   font-family: arial;
  }
  
  .contenttabletable {
   border: 0px solid #FFFFFF;
   padding: 0px;
   padding-left: 20px;
  }
  
  .contenttable tr td {
   padding: 3px;
   min-width: 200px;
  }
  
  .contenttable tr td a {
   color: #555555;
   text-decoration: none;
   font-size: 13px;
   font-family: arial;
  }
  
  .hacek {
   color: #cf1d24;
   font-size: 25px;
   font-weight: plain;
   vertical-align: -40%;
  }
  
  .mathematicapointerwrapper {
   border: 0px solid #DDDDDD;
   margin: 15px 15px 15px 40px;
   padding: 0px;
   max-width: 500px;
  }
  
  .mathematicapointertop {
   border: 1px solid #DDDDDD;
   background-color: #F2F2F2;
   padding: 0px;
   max-width: 500px;
   height: 4px;
  }
  
  .mathematicapointerdiv {
   background: url('./DocumentationFiles/mathematicabook.png') no-repeat 5 5;
   border: 1px solid #DDDDDD;
   background-color: #FFFFFF;
   margin: 0px;
   padding: 15px 9px 9px 89px;
   max-width: 500px;
   min-height: 67px;
  }
  
  p.mathematicapointer {
   padding: 0px;
   margin: 0px;
   font-size: 12px;
  }
  
  .infoboxwrapper {
   border: 0px solid #DDDDDD;
   -webkit-box-shadow: 3px 3px 3px #DDDDDD;
   margin: 15px 15px 15px 40px;
   padding: 0px;
   max-width: 500px;
  }
  
  .infoboxtop {
   background: url('./DocumentationFiles/infotick.png') no-repeat 12 2;
   border: 1px solid #DDDDDD;
   background-color: #F2F2F2;
   padding: 0px;
   max-width: 500px;
   height: 37px;
  }
  
  div.infobox {
   border: 1px solid #DDDDDD;
   background-color: #FFFFFF;
   margin: 0px;
   padding: 15px;
   max-width: 500px;
  }
  
  p.infobox {
   padding: 0px;
   margin: 0px;
   font-size: 12px;
  }
  
  h2.legal {
   font-family: arial;
   font-size: 14;
   color: #cf1d24;
   margin: 15px 15px 15px 20px;
   font-weight: bold;
  }
  
  h3.legal {
   background: url('./DocumentationFiles/dingbat3.png') no-repeat 0 0;
   font-family: arial;
   font-size: 12;
   color: #808080;
   margin-left: 38px;
   padding-left: 12px;
   font-weight: bold;
  }
  
  ul.legal {
   font-size: 10px;
   font-family: arial;
   color: #555555;
   margin-left: 28px;
  }
  
  ul.legal li {
   margin-left: 0px;
   margin-top: 4px;
   margin-bottom: 2px;
   padding-left: 0px;
  }
  
  p.legallarge {
   font-size: 12px;
   margin-left: 38px;
  }
  
  p.legalsmall {
   font-size: 11px;
   margin-left: 38px;
   padding-left: 12px;
  }
  
  .legalend {
   height: 10px;
  }
  
  .variablename {
   font-family: Courier New, Courier;
  }
  
  .dialogelement {
   font-weight: bold;
  }
  
  .menuitem {
   font-weight: bold;
  }
  
  .mr {
   font-family: Courier New, Courier;
  }
  
  
   </style>
   </head>
   <body>
   
  <div class=\"headerlinkdiv\">
  
   <span class=\"headerspan\" style=\"background: url(DocumentationFiles/examples.png) no-repeat 0 0;
   padding-left: 24px;
   \"
   onmouseover=\"
   	this.style.color = 'white';
   	this.style.background = 'url(DocumentationFiles/examples_active.png) no-repeat 0 0';
   \"
   onmouseout=\"
   	this.style.color = 'gray';
   	this.style.background = 'url(DocumentationFiles/examples.png) no-repeat 0 0';
   \"><a href=\"http://www.wolfram.com/system-modeler/industry-examples/\" class=\"headera\">More Examples</a></span>
  
   <span class=\"headerspan\" style=\"background: url(DocumentationFiles/video.png) no-repeat 0 0;
   padding-left: 29px;
   \"
   onmouseover=\"
   	this.style.color = 'white';
   	this.style.background = 'url(DocumentationFiles/video_active.png) no-repeat 0 0';
   \"
   onmouseout=\"
   	this.style.color = 'gray';
   	this.style.background = 'url(DocumentationFiles/video.png) no-repeat 0 0';
   \"><a href=\"http://www.wolfram.com/system-modeler/resources/get-started/\" class=\"headera\">Introductory Videos</a></span>
  
   <span class=\"headerspan\" style=\"background: url(DocumentationFiles/docs.png) no-repeat 0 0;
   padding-left: 20px;
   \"
   onmouseover=\"
   	this.style.color = 'white';
   	this.style.background = 'url(DocumentationFiles/docs_active.png) no-repeat 0 0';
   \"
   onmouseout=\"
   	this.style.color = 'gray';
   	this.style.background = 'url(DocumentationFiles/docs.png) no-repeat 0 0';
   \"><a href=\"http://reference.wolfram.com/system-modeler\" class=\"headera\">Documentation</a></span>
  
   <span class=\"headerspan\" style=\"background: url(DocumentationFiles/contact.png) no-repeat 0 0;
   padding-left: 24px;
   \"
   onmouseover=\"
   	this.style.color = 'white';
   	this.style.background = 'url(DocumentationFiles/contact_active.png) no-repeat 0 0';
   \"
   onmouseout=\"
   	this.style.color = 'gray';
   	this.style.background = 'url(DocumentationFiles/contact.png) no-repeat 0 0';
   \"><a href=\"http://www.wolfram.com/system-modeler/contact-us/\" class=\"headera\">Contact Us</a></span>
  </div><div class=\"header\">&nbsp;</div><h1>DC Motor Interactive: Components</h1><a id=\"headerTag_PackageOverview\" class=\"target\">&nbsp;</a>
    <h2>Package Overview</h2>
    <p class=\"\">
This package contains components used in the <a href=\"Modelica://DCMotorInteractive.ExampleModel\">Example Model</a>.
</p><ul></ul><h2 class=\"legal\"> <a href=\"#\" onclick=\"
   if(document.getElementById('10').style.display == 'none'){
   document.getElementById('10').style.display = 'block';
   document.getElementById('show10').style.display = 'none';
   document.getElementById('hide10').style.display = 'inline';
   } else {
   document.getElementById('10').style.display = 'none';
   document.getElementById('show10').style.display = 'inline';
   document.getElementById('hide10').style.display = 'none';
   };
   return false;\" style=\"text-decoration: inherit; color: inherit\"><img src=\"DocumentationFiles/showhide2.png\" alt=\"Show\" id=\"show10\" style=\"display: inline; vertical-align: text-bottom;\" /><img src=\"DocumentationFiles/showhide.png\" alt=\"Hide\" id=\"hide10\" style=\"display: none; vertical-align: text-bottom;\" />Terms and Conditions of Use</a> </h2>
    <span id=\"10\" style=\"display: none;\"><p class=\"legallarge\">
This domain example is an informational resource made freely available by Wolfram Research.
</p><h3 class=\"legal\">Use of This Example</h3>
    <span id=\"11\" style=\"display: block;\"><ul class=\"legal\"><li>You may not use this example for any purpose that is unlawful or dangerous.</li><li>You assume total responsibility and risk for your use of this example.</li><li>You may not present this example with any alteration to its trade dress, trademarks, or design.</li></ul></span><h3 class=\"legal\">License</h3>
    <span id=\"12\" style=\"display: block;\"><p class=\"legalsmall\">
All content in this bundle is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License. By accessing the content or using it in any way, you accept and agree to be bound by the terms of this license. If you do not agree to these Terms of Use, you may not use this content. Wolfram Research reserves the right to change, modify, add to, or remove portions of these Terms of Use at any time without notice. Please refer back to <a href=\"http://www.wolfram.com\">www.wolfram.com</a> for the latest Terms of Use.
</p><p class=\"legalsmall\">
A summary of the licensing terms can be found at:<br>
        <a href=\"http://creativecommons.org/licenses/by-nc-sa/3.0\">http://creativecommons.org/licenses/by-nc-sa/3.0</a>
</p><p class=\"legalsmall\">
The full legal code can be found at:<br>
        <a href=\"http://creativecommons.org/licenses/by-nc-sa/3.0/legalcode\">http://creativecommons.org/licenses/by-nc-sa/3.0/legalcode</a>
</p></span></span><div class=\"legalend\">&nbsp;</div>
   </body>
   <!--WSMINSERTIONTAGEND Components --></html>", revisions = ""), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end Components;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 21}, textColor = {255, 0, 0}, extent = {{-120, 73}, {120, 132}}, textString = "%name", fontName = "Arial"), Rectangle(visible = true, lineColor = {111, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 4, extent = {{-90, -90}, {90, 90}}, radius = 25), Text(visible = true, origin = {12, 20.833}, textColor = {255, 255, 255}, extent = {{-102, -70.833}, {78, 29.167}}, textString = "Ex", fontName = "Arial")}), __Wolfram(openClass = DCMotorInteractive.ExampleModel, useDocumentationTemplate = false), preferredView = "info", uses(Modelica(version = "3.2.1")), Documentation(info = "<html><!--WSMINSERTIONTAGSTART DCMotorPacakge -->
   <head>
   <style type=\"text/css\">
   
  body {
   padding: 0px;
   margin: 0px;
  }
  
  a {
   color: #cf1d24;
  }
  
  a.target {
   padding-top: 40px;
   margin-top: -40px;
  }
  
  p {
   font-family: arial;
   font-size: 13;
   margin: 9px 40px 5px 40px;
   padding-bottom: 0px;
   color: #555555;
   max-width: 800px;
  }
  
  h1 {
   font-size: 30;
   color: #cf1d24;
   font-weight: bold;
   margin-left: 20px;
   margin-top: 32px;
   margin-bottom: 15px;
   margin-right: 20px;
   padding-top: 0px;
  }
  
  h2 {
   font-size: 20;
   color: #cf1d24;
   font-weight: bold;
   margin-left: 20px;
   margin-right: 20px;
   margin-top: 5px;
   margin-bottom: 9px;
  }
  
  h3 {
   background: url('./DocumentationFiles/dingbat3.png') no-repeat 0 0;
   font-size: 14px;
   font-family: helvetica;
   color: #4B4B4B;
   font-weight: bold;
   padding-left: 18px;
   margin-left: 20px;
   margin-right: 20px;
   margin-top: 12px;
   margin-bottom: 8px;
  }
  
  ul {
   font-family: arial;
   font-size: 13;
   margin: 9px 40px 5px 40px;
   padding-bottom: 0px;
   color: #555555;
   max-width: 800px;
   list-style-type: square;
  }
  
  li {
   margin-left: 0px;
   margin-top: 4px;
   margin-bottom: 2px;
   padding-left: 0px;
  }
  
  div.header {
   background: url('./DocumentationFiles/WSMLogo.png') no-repeat 0 0;
   height: 96px;
   margin-top: 35px;
   background-color: #871613;
  }
  
  .headerspan {
   font-family: arial;
   text-decoration: none;
   font-size: 12px;
   font-weight: bold;
   display: inline-block;
   height: 35px;
   color: gray;
   padding: 0px;
   margin: 0px;
   margin-left: 20px;
  }
  
  .headera {
   font-family: arial;
   text-decoration: none;
   font-size: 12px;
   font-weight: bold;
   padding: 0px;
   color: inherit;
   vertical-align: middle;
   margin: 0px;
  }
  
  .headerlinkdiv {
   background: black;
   padding: 0px;
   height: 35px;
   margin: 0px;
   position: fixed; top: 0px; left: 0px; width: 100%;
  }
  
  .contenttable {
   -webkit-box-shadow: 3px 3px 3px #DDDDDD;
   border-top: 3px solid #cf1d24;
   background: #f9f9f9;
   max-width: 500px;
   margin: 15px 15px 0px 20px;
   padding: 6px 10px 3px 10px;
  }
  
  .contenttableheader {
   color: #a4a4a4;
   font-size: 14px;
   font-family: arial;
  }
  
  .contenttabletable {
   border: 0px solid #FFFFFF;
   padding: 0px;
   padding-left: 20px;
  }
  
  .contenttable tr td {
   padding: 3px;
   min-width: 200px;
  }
  
  .contenttable tr td a {
   color: #555555;
   text-decoration: none;
   font-size: 13px;
   font-family: arial;
  }
  
  .hacek {
   color: #cf1d24;
   font-size: 25px;
   font-weight: plain;
   vertical-align: -40%;
  }
  
  .mathematicapointerwrapper {
   border: 0px solid #DDDDDD;
   margin: 15px 15px 15px 40px;
   padding: 0px;
   max-width: 500px;
  }
  
  .mathematicapointertop {
   border: 1px solid #DDDDDD;
   background-color: #F2F2F2;
   padding: 0px;
   max-width: 500px;
   height: 4px;
  }
  
  .mathematicapointerdiv {
   background: url('./DocumentationFiles/mathematicabook.png') no-repeat 5 5;
   border: 1px solid #DDDDDD;
   background-color: #FFFFFF;
   margin: 0px;
   padding: 15px 9px 9px 89px;
   max-width: 500px;
   min-height: 67px;
  }
  
  p.mathematicapointer {
   padding: 0px;
   margin: 0px;
   font-size: 12px;
  }
  
  .infoboxwrapper {
   border: 0px solid #DDDDDD;
   -webkit-box-shadow: 3px 3px 3px #DDDDDD;
   margin: 15px 15px 15px 40px;
   padding: 0px;
   max-width: 500px;
  }
  
  .infoboxtop {
   background: url('./DocumentationFiles/infotick.png') no-repeat 12 2;
   border: 1px solid #DDDDDD;
   background-color: #F2F2F2;
   padding: 0px;
   max-width: 500px;
   height: 37px;
  }
  
  div.infobox {
   border: 1px solid #DDDDDD;
   background-color: #FFFFFF;
   margin: 0px;
   padding: 15px;
   max-width: 500px;
  }
  
  p.infobox {
   padding: 0px;
   margin: 0px;
   font-size: 12px;
  }
  
  h2.legal {
   font-family: arial;
   font-size: 14;
   color: #cf1d24;
   margin: 15px 15px 15px 20px;
   font-weight: bold;
  }
  
  h3.legal {
   background: url('./DocumentationFiles/dingbat3.png') no-repeat 0 0;
   font-family: arial;
   font-size: 12;
   color: #808080;
   margin-left: 38px;
   padding-left: 12px;
   font-weight: bold;
  }
  
  ul.legal {
   font-size: 10px;
   font-family: arial;
   color: #555555;
   margin-left: 28px;
  }
  
  ul.legal li {
   margin-left: 0px;
   margin-top: 4px;
   margin-bottom: 2px;
   padding-left: 0px;
  }
  
  p.legallarge {
   font-size: 12px;
   margin-left: 38px;
  }
  
  p.legalsmall {
   font-size: 11px;
   margin-left: 38px;
   padding-left: 12px;
  }
  
  .legalend {
   height: 10px;
  }
  
  .variablename {
   font-family: Courier New, Courier;
  }
  
  .dialogelement {
   font-weight: bold;
  }
  
  .menuitem {
   font-weight: bold;
  }
  
  .mr {
   font-family: Courier New, Courier;
  }
  
  
   </style>
   </head>
   <body>
   
  <div class=\"headerlinkdiv\">
  
   <span class=\"headerspan\" style=\"background: url(DocumentationFiles/examples.png) no-repeat 0 0;
   padding-left: 24px;
   \"
   onmouseover=\"
   	this.style.color = 'white';
   	this.style.background = 'url(DocumentationFiles/examples_active.png) no-repeat 0 0';
   \"
   onmouseout=\"
   	this.style.color = 'gray';
   	this.style.background = 'url(DocumentationFiles/examples.png) no-repeat 0 0';
   \"><a href=\"http://www.wolfram.com/system-modeler/industry-examples/\" class=\"headera\">More Examples</a></span>
  
   <span class=\"headerspan\" style=\"background: url(DocumentationFiles/video.png) no-repeat 0 0;
   padding-left: 29px;
   \"
   onmouseover=\"
   	this.style.color = 'white';
   	this.style.background = 'url(DocumentationFiles/video_active.png) no-repeat 0 0';
   \"
   onmouseout=\"
   	this.style.color = 'gray';
   	this.style.background = 'url(DocumentationFiles/video.png) no-repeat 0 0';
   \"><a href=\"http://www.wolfram.com/system-modeler/resources/get-started/\" class=\"headera\">Introductory Videos</a></span>
  
   <span class=\"headerspan\" style=\"background: url(DocumentationFiles/docs.png) no-repeat 0 0;
   padding-left: 20px;
   \"
   onmouseover=\"
   	this.style.color = 'white';
   	this.style.background = 'url(DocumentationFiles/docs_active.png) no-repeat 0 0';
   \"
   onmouseout=\"
   	this.style.color = 'gray';
   	this.style.background = 'url(DocumentationFiles/docs.png) no-repeat 0 0';
   \"><a href=\"http://reference.wolfram.com/system-modeler\" class=\"headera\">Documentation</a></span>
  
   <span class=\"headerspan\" style=\"background: url(DocumentationFiles/contact.png) no-repeat 0 0;
   padding-left: 24px;
   \"
   onmouseover=\"
   	this.style.color = 'white';
   	this.style.background = 'url(DocumentationFiles/contact_active.png) no-repeat 0 0';
   \"
   onmouseout=\"
   	this.style.color = 'gray';
   	this.style.background = 'url(DocumentationFiles/contact.png) no-repeat 0 0';
   \"><a href=\"http://www.wolfram.com/system-modeler/contact-us/\" class=\"headera\">Contact Us</a></span>
  </div><div class=\"header\">&nbsp;</div><h1>Interactive Simulation Control: DC Motor</h1><a id=\"headerTag_PackageOverview\" class=\"target\">&nbsp;</a>
    <h2>Package Overview</h2>
    <p class=\"\">
This package contains a model of a DCMotor controlled from <i><span style=\"font-style:italic;\">Mathematica</span></i>.
</p><ul><li><a href=\"Modelica://DCMotorInteractive.ExampleModel#diagram\">ExampleModel</a>: the main model. (<a href=\"Modelica://DCMotorInteractive.ExampleModel\">show documentation</a>)</li><li><a href=\"Modelica://DCMotorInteractive.Components#info\">Components</a>: a package containing custom components used in the main model.</li></ul><h2 class=\"legal\"> <a href=\"#\" onclick=\"
   if(document.getElementById('13').style.display == 'none'){
   document.getElementById('13').style.display = 'block';
   document.getElementById('show13').style.display = 'none';
   document.getElementById('hide13').style.display = 'inline';
   } else {
   document.getElementById('13').style.display = 'none';
   document.getElementById('show13').style.display = 'inline';
   document.getElementById('hide13').style.display = 'none';
   };
   return false;\" style=\"text-decoration: inherit; color: inherit\"><img src=\"DocumentationFiles/showhide2.png\" alt=\"Show\" id=\"show13\" style=\"display: inline; vertical-align: text-bottom;\" /><img src=\"DocumentationFiles/showhide.png\" alt=\"Hide\" id=\"hide13\" style=\"display: none; vertical-align: text-bottom;\" />Terms and Conditions of Use</a> </h2>
    <span id=\"13\" style=\"display: none;\"><p class=\"legallarge\">
This domain example is an informational resource made freely available by Wolfram Research.
</p><h3 class=\"legal\">Use of This Example</h3>
    <span id=\"14\" style=\"display: block;\"><ul class=\"legal\"><li>You may not use this example for any purpose that is unlawful or dangerous.</li><li>You assume total responsibility and risk for your use of this example.</li><li>You may not present this example with any alteration to its trade dress, trademarks, or design.</li></ul></span><h3 class=\"legal\">License</h3>
    <span id=\"15\" style=\"display: block;\"><p class=\"legalsmall\">
All content in this bundle is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License. By accessing the content or using it in any way, you accept and agree to be bound by the terms of this license. If you do not agree to these Terms of Use, you may not use this content. Wolfram Research reserves the right to change, modify, add to, or remove portions of these Terms of Use at any time without notice. Please refer back to <a href=\"http://www.wolfram.com\">www.wolfram.com</a> for the latest Terms of Use.
</p><p class=\"legalsmall\">
A summary of the licensing terms can be found at:<br>
        <a href=\"http://creativecommons.org/licenses/by-nc-sa/3.0\">http://creativecommons.org/licenses/by-nc-sa/3.0</a>
</p><p class=\"legalsmall\">
The full legal code can be found at:<br>
        <a href=\"http://creativecommons.org/licenses/by-nc-sa/3.0/legalcode\">http://creativecommons.org/licenses/by-nc-sa/3.0/legalcode</a>
</p></span></span><div class=\"legalend\">&nbsp;</div>
   </body>
   <!--WSMINSERTIONTAGEND DCMotorPacakge --></html>", revisions = ""), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end DCMotorInteractive;
