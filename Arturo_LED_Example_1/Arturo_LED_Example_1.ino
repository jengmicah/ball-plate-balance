char incomingMessage;

int ledPin = 13;

void setup() {
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
  Serial.println("Hello, Runtime Projects here");
  Serial.println("This is lesson 3");
}

void loop() {
  if (Serial.available() > 0) {
    incomingMessage = Serial.read();
    if (incomingMessage == 'H') {
      digitalWrite(ledPin, HIGH);
    } 
    else if (incomingMessage == 'L') {
      digitalWrite(ledPin, LOW);
    }
  }
}
