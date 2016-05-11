
void setup() {
pinMode(A5, OUTPUT);
int numTones = 10;
int tones[] = {261, 277, 294, 311, 330, 349, 370, 392, 415, 440}; //list of tones
for(int i = 0;i<numTones;i++){
  tone(A5, tones[i]); //make tone come from speaker
  delay(500);
}
noTone(A5); //stop tone
}

void loop() {
  // put your main code here, to run repeatedly:

}
