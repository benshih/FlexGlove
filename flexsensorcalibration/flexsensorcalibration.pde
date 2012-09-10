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
    Serial.println("analog 5");
    Serial.println(analogRead(5));
    Serial.println("analog 4");
    Serial.println(analogRead(4));
    Serial.println("analog 3");
    Serial.println(analogRead(3));
    Serial.println("analog 2");
    Serial.println(analogRead(2));
    Serial.println("analog 1");
    Serial.println(analogRead(1));
    Serial.println("analog 0");
    Serial.println(analogRead(0));
    delay(1500);
  }
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
