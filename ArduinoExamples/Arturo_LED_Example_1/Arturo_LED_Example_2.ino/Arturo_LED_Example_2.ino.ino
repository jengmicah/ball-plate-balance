
const int LED1 = 9;
const int LED2 = 10;
unsigned int onTime = 250;
unsigned int offTime = 250;
int numRedBlinks, numWhiteBlinks;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);

  Serial.println("How many red blinks?"); //prompt user for input
  while (Serial.available() == 0) {} //wait for input
  numRedBlinks = Serial.parseInt(); //assign numBlinks to number
  Serial.println("How many white blinks?");
  while (Serial.available() == 0) {}
  numWhiteBlinks = Serial.parseInt();
}

void loop() {
  // put your main code here, to run repeatedly:
  for (int i = 1; i <= numRedBlinks; i++) {
    Serial.println(i);
    analogWrite(LED1, 51);
    delay(onTime);
    analogWrite(LED1, 0);
    delay(offTime);
  }

  for (int i = 1; i <= numWhiteBlinks; i++) {
    Serial.println();
    digitalWrite(LED2, HIGH);
    delay(onTime);
    digitalWrite(LED2, LOW);
    delay(offTime);
  }
}
