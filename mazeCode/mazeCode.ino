#include <Servo.h>

/* Define servo's max and min by matching max/min physical rotation with servo.write() value */
#define SERVO1_MAX 160
#define SERVO1_MIN 10
#define SERVO2_MAX 180
#define SERVO2_MIN 60

#define CALIBRATE 0
#define DEBUG 1

int     xCoord,  yCoord;
Servo servoOne, servoTwo;
String readString = "";

void setup() {
  Serial.begin(9600);
  Serial.println("Initializing..");
  servoOne.attach(9);       //X
  servoTwo.attach(10);      //Y
  
  Serial.print("Calibrate? "); Serial.println(CALIBRATE);
}

void calibrateServo()
{
  int pos;
  /* change this routine to calibrate the other servo */
    for (pos = SERVO1_MIN; pos <= SERVO1_MAX; pos += 1) 
  { 
    Serial.print("calPos= "); Serial.println(pos);
    servoOne.write(pos);             
    delay(20);                    
  }
  for (pos = SERVO2_MIN; pos <= SERVO2_MAX; pos += 1) 
  { 
    Serial.print("calPos= "); Serial.println(pos);
    servoTwo.write(pos);             
    delay(20);                    
  }
}


void controlServos(){   
  // X and Y coordinates are sent over serial
  int posOne = xCoord;
      posOne = constrain(posOne, 0, 100);
  int posTwo = yCoord;  
      posTwo = constrain(posTwo, 0, 100);

  // limit max/min servo movement to correspond with calibration values
  posOne = map(posOne, 0, 100, SERVO1_MIN, SERVO1_MAX);   
  posTwo = map(posTwo, 0, 100, SERVO2_MIN, SERVO2_MAX);
  
  servoOne.write(posOne);
  servoTwo.write(posTwo);

  #if DEBUG
    Serial.print("servoOne: "); Serial.print(posOne); Serial.print(" | ");
    Serial.print("servoTwo: "); Serial.println(posTwo);
  #endif
}


void loop() 
{
#if CALIBRATE
  calibrateServo();  
#else
  if (Serial.available() > 0)  
  {
      char c = Serial.read();                           // in format: xxx,yyy
      if (readString.length() < 8)   readString += c;   // append character to string     
      else                           readString = "";   // reset if received more than 8 characters
      
  } // End if(Serial.available() >0 )
  
  if (readString != "" && readString.length() >= 7)     // if something was received. parse string
  {
    if (readString.indexOf(",") > 0)                    // make sure there is a comma in the string
    {
      String trimmedX = readString.substring(0,3);      // 3 characters 
      String trimmedY = readString.substring(4,7);      // 3 characters

      xCoord = trimmedX.toInt();
      yCoord = trimmedY.toInt(); 
      #if DEBUG
        Serial.print("String Received: "); Serial.println(readString);
        Serial.print("X="); Serial.print(xCoord); Serial.print(" Y="); Serial.println(yCoord);
      #endif
      controlServos();
    } 
    readString = "";    // empty string
  }

#endif
}// End loop()
