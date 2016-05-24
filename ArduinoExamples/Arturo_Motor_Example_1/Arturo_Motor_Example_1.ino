int Distance = 1;

void setup() {
  // put your setup code here, to run once:
  pinMode(12, OUTPUT);
  pinMode(13, OUTPUT);
  digitalWrite(12, LOW);
  digitalWrite(13, LOW);
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(12, HIGH);
  delayMicroseconds(300);
  digitalWrite(12, LOW);
  delayMicroseconds(300);
  Distance = Distance + 1;

  if(Distance == 3200) {
    if(digitalRead(13) == LOW) {
      digitalWrite(13, HIGH);
    } else {
      digitalWrite(13, LOW);
    }

    Distance = 0;
    delay(500);
  }
  
}
