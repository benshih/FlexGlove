/*
  Carnegie Mellon University
  Build18 2011
  ASL to Braille
  Start: 1/10/2011
  End: 
*/

/*
  Assign digital I/Os to each pin.
*/
int LEDPin8 = 8;
int LEDPin9 = 9;
int LEDPin10 = 10;
int LEDPin11 = 11;
int LEDPin12 = 12;
int LEDPin13 = 13;

/*
  "Dictionary" for representing the ASL letters as thresholds.
  
  Pins correspond to array as follows:
  {lower V 1, higher V 1, lower V 2, higher V 2, lower V 3, higher V 3, lower V 4, higher V 4, lower V 5, higher V 5, lower V 6, higher V 6, lower V 7, higher V 7}
  
  Note: Since we only have 6 analog inputs, something special has to be worked out for 7th
*/

int asl[26][14] = {
  {,},
  {,},
  {,},
  {,},
  {,},
  {,},
  {,},
  {,},
  {,},
  {,},
  {,},
  {,},
  {,},
  {,},
  {,},
  {,},
  {,},
  {,},
  {,},
  {,},
  {,},
  {,},
  {,},
  {,},
  {,},
  {,}
};

/*
  "Dictionary" for representing the braille letters as LEDs.
  
  Pins correspond to array as follows:
  {8, 9, 10, 11, 12, 13}
  
  8 | 11
  ------
  9 | 12
  ------
 10 | 13
*/
int braille[26][6] = {
  {1,0,0,0,0,0},
  {1,1,0,0,0,0},
  {1,0,0,1,0,0},
  {1,0,0,1,1,0},
  {1,0,0,0,1,0},
  {1,1,0,1,0,0},
  {1,1,0,1,1,0},
  {1,1,0,0,1,0},
  {0,1,0,1,0,0},
  {0,1,0,1,1,0},
  {1,0,1,0,0,0},
  {1,1,1,0,0,0},
  {1,0,1,1,0,0},
  {1,0,1,1,1,0},
  {1,0,1,0,1,0},
  {1,1,1,1,0,0},
  {1,1,1,1,1,0},
  {1,1,1,0,1,0},
  {0,1,1,1,0,0},
  {0,1,1,1,1,0},
  {1,0,1,0,0,1},
  {1,1,1,0,0,1},
  {0,1,0,1,1,1},
  {1,0,1,1,0,1},
  {1,0,1,1,1,1},
  {1,0,1,0,1,1}
};

int i = 0;

void setup()
{
  pinMode(LEDPin8, OUTPUT);
  pinMode(LEDPin9, OUTPUT);
  pinMode(LEDPin10, OUTPUT);  
  pinMode(LEDPin11, OUTPUT);
  pinMode(LEDPin12, OUTPUT);
  pinMode(LEDPin13, OUTPUT);
  Serial.begin(9600);
}

/* variables for on/off with debouncing */
int switchPin = 0;              // switch is connected to pin 0
int val1;                        // variable for reading the pin status
int val2;
int buttonState;                // variable to hold the last button state
int deviceState = 0;            // measure whether or not the device is on

/* variables for when device is on */
int changed1;
int changed2;


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
      if (LEDState == 0)
      {
        Serial.println("on");
        deviceState = 1;
      }
      else 
      {
        Serial.println("off");
        deviceState = 0;
        digitalWrite(LEDPin8, LOW);
        digitalWrite(LEDPin9, LOW);
        digitalWrite(LEDPin10, LOW);
        digitalWrite(LEDPin11, LOW);
        digitalWrite(LEDPin12, LOW);
        digitalWrite(LEDPin13, LOW);
      }
    }
    buttonState = val1;
  }
 
  /*
    In order to prevent excessive digital writing, we will use a custom "debouncing"
    to reduce the number of times we write.
  */
 
  if(1 == deviceState)
  {
     /* note: currently written without reducing digitalwrites */
    if(


    delay(300);    
  }
}

