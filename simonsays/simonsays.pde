/*
  Carnegie Mellon University
  Build18 2011
  Simon Says Game
  Start: 1/13/2011
  End: 
*/

/*
  Assign analog/digital I/Os to each pin.
*/
int LEDPin1 = 1;
int LEDPin2 = 2;
int LEDPin3 = 3;
int LEDPin4 = 4;
int LEDPin5 = 5;
int LEDPin6 = 6;

int LEDPin8 = 8;
int LEDPin9 = 9;
int LEDPin10 = 10;
int LEDPin11 = 11;
int LEDPin12 = 12;
int LEDPin13 = 13;


void setup()
{
  pinMode(LEDPin8, OUTPUT);
  pinMode(LEDPin9, OUTPUT);
  pinMode(LEDPin10, OUTPUT);  
  pinMode(LEDPin11, OUTPUT);
  pinMode(LEDPin12, OUTPUT);
  pinMode(LEDPin13, OUTPUT);
  pinMode(LEDPin1, INPUT);
  pinMode(LEDPin2, INPUT);
  pinMode(LEDPin3, INPUT);
  pinMode(LEDPin4, INPUT);
  pinMode(LEDPin5, INPUT);
  pinMode(LEDPin6, INPUT);
  
  randomSeed(digitalRead(7));
  
  Serial.begin(9600);
}

/* variables for on/off with debouncing */
int switchPin = 0;              // switch is connected to pin 0
int val1;                        // variable for reading the pin status
int val2;
int buttonState;                // variable to hold the last button state
int deviceState = 0;            // measure whether or not the device is on
int level;
int i;
int j;
int count;

void loop()
{
  /*
    on/off with debouncing
  */
  val1 = digitalRead(switchPin);
  delay(10);
  val2 = digitalRead(switchPin);
  
  if (val1 == val2) 
  {
    if (val1 != buttonState && val1 == LOW)
    {
      if (deviceState == 0)
      {
        Serial.println("on");
        deviceState = 1;
        level = 1;
        i = 0;
      }
      else 
      {
        Serial.println("off");
        deviceState = 0;
        off();
      }
    }
    buttonState = val1;
  }
 
 
  if(1 == deviceState) /* what do do when device is on */
  {
      /* test sequence
      loss();
      loss();
      off();
      deviceState = 0;
      */
      
      /*
      Generate a random sequence.
      1 = 1 finger
      2 = 2 fingers
      3 = 3 fingers
      4 = 4 fingers
      5 = 5 fingers
      */
      int seq[level];
      for(i = 0; i < level; i++)
      {
        seq[i] = random(5)+1;
      }
      
      j = 0;
      for(j = 0; j < level; j++)
      {
       lights(seq[j], 500); 
      }
      off();
      delay(3000);
      lights(0, 250);
      delay(250);
      lights(0, 250);
      delay(250);
      lights(0, 250);
      
      j = 0;
      count = 0;       
      
      while (j <= level)
      {
        delay(750); // wait for user input - this should be calibrated so that it's natural and the user doesn't have to wait too long
        int f1 = analogRead(1);
        int f2 = analogRead(2);
        int f3 = analogRead(3);
        int f4 = analogRead(4);
        int f5 = analogRead(5);
        if(counter(f1, f2, f3, f4, f5) == seq[j])
          j++;
        else
          loss();
          delay(5000);
          break;
      }
      
      
      
  }
}
int counter(int f1, int f2, int f3, int f4, int f5)
{
        int count = 0;
        if(f1 < 512)
          count++;
        if(f2 < 512)
          count++;
        if(f3 < 512)
          count++;
        if(f4 < 512)
          count++;
        if(f5 < 512)
          count++;
        return count;
}

void lights(int k, int time)
{
        if(k == 0)
          digitalWrite(LEDPin13, HIGH);
        if(k >= 1)
          digitalWrite(LEDPin8, HIGH);
        if(k >= 2)
          digitalWrite(LEDPin9, HIGH);
        if(k >= 3)
          digitalWrite(LEDPin10, HIGH);
        if(k >= 4)
          digitalWrite(LEDPin11, HIGH);
        if(k >= 5)
          digitalWrite(LEDPin12, HIGH);
        delay(time);
        off();  
}


void loss()
{
  digitalWrite(LEDPin8, HIGH);
  delay(150);
  digitalWrite(LEDPin8, LOW);
  digitalWrite(LEDPin9, HIGH);
  delay(150);
  digitalWrite(LEDPin9, LOW);
  digitalWrite(LEDPin10, HIGH);
  delay(150);
  digitalWrite(LEDPin10, LOW);
  digitalWrite(LEDPin13, HIGH);
  delay(150);
  digitalWrite(LEDPin13, LOW);
  digitalWrite(LEDPin12, HIGH);
  delay(150);
  digitalWrite(LEDPin12, LOW);
  digitalWrite(LEDPin11, HIGH);
  delay(150);
  digitalWrite(LEDPin11, LOW);
  digitalWrite(LEDPin8, HIGH);
  delay(150);
  digitalWrite(LEDPin8, LOW);
  digitalWrite(LEDPin9, HIGH);
  delay(150);
  digitalWrite(LEDPin9, LOW);
  digitalWrite(LEDPin10, HIGH);
  delay(150);
  digitalWrite(LEDPin10, LOW);
  digitalWrite(LEDPin13, HIGH);
  delay(150);
  digitalWrite(LEDPin13, LOW);
  digitalWrite(LEDPin12, HIGH);
  delay(150);
  digitalWrite(LEDPin12, LOW);
  digitalWrite(LEDPin11, HIGH);
  delay(150);
  
  digitalWrite(LEDPin8, HIGH);
  digitalWrite(LEDPin9, HIGH);
  digitalWrite(LEDPin10, HIGH);
  digitalWrite(LEDPin13, HIGH);
  digitalWrite(LEDPin12, HIGH);
  digitalWrite(LEDPin11, HIGH);
  delay(100);
  off();
  
  digitalWrite(LEDPin8, HIGH);
  digitalWrite(LEDPin9, HIGH);
  digitalWrite(LEDPin10, HIGH);
  digitalWrite(LEDPin13, HIGH);
  digitalWrite(LEDPin12, HIGH);
  digitalWrite(LEDPin11, HIGH);
  delay(100);
  off();
  
  digitalWrite(LEDPin8, HIGH);
  digitalWrite(LEDPin9, HIGH);
  digitalWrite(LEDPin10, HIGH);
  digitalWrite(LEDPin13, HIGH);
  digitalWrite(LEDPin12, HIGH);
  digitalWrite(LEDPin11, HIGH);
  delay(150);
  off();
}

void off()
{
  digitalWrite(LEDPin8, LOW);
  digitalWrite(LEDPin9, LOW);
  digitalWrite(LEDPin10, LOW);
  digitalWrite(LEDPin11, LOW);
  digitalWrite(LEDPin12, LOW);
  digitalWrite(LEDPin13, LOW);
}
