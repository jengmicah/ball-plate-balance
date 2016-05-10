#define solarPin A0
#define servoR 9
#define servoL 10

float sensorValue, voltage, f;

void setup() {
  // put your setup code here, to run once:
  pinMode(solarPin, INPUT);
  pinMode(servoR, OUTPUT);
  pinMode(servoL, OUTPUT);

  digitalWrite(servoR, HIGH);
  digitalWrite(servoL, HIGH);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(servoR, HIGH);
  delayMicroseconds(300);
  digitalWrite(servoR, LOW);
  delayMicroseconds(300);
  
  sensorValue = analogRead(A0); //receive solar input (0-1023)
  
//  voltage = sensorValue * (5./1023.); //convert to desired voltage
//  f = 51. * voltage; //convert to scale for analogWrite (0-255)
//  Serial.println(sensorValue/10);
//  if(voltage >= 2.5) digitalWrite(servoL, HIGH);
//  else digitalWrite(servoL, LOW);
  
  delay(sensorValue/100);
}
