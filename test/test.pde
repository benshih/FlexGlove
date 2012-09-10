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
  on/off
*/

int switchPin = 0;              // switch is connected to pin 0
int val1;                        // variable for reading the pin status
int val2;
int buttonState;                // variable to hold the last button state
int deviceState = 0;

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
  pinMode(switchPin, INPUT);
  pinMode(switchPin, OUTPUT);
  Serial.begin(9600);
  buttonState = digitalRead(switchPin);
}


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
  
  if (1 == deviceState)
  {
    /*
    This loop flashes through every letter in the braille alphabet with a 1000 delay between each letter.
    */
      Serial.println(i);
      
      if(0 == braille[i][0])
        digitalWrite(LEDPin8, LOW);
      else 
        digitalWrite(LEDPin8, HIGH);
      
      if(0 == braille[i][1])
        digitalWrite(LEDPin9, LOW);
      else 
        digitalWrite(LEDPin9, HIGH);
      
      if(0 == braille[i][2])
        digitalWrite(LEDPin10, LOW);
      else 
        digitalWrite(LEDPin10, HIGH);
      
      if(0 == braille[i][3])
        digitalWrite(LEDPin11, LOW);
      else 
        digitalWrite(LEDPin11, HIGH);
      
      if(0 == braille[i][4])
        digitalWrite(LEDPin12, LOW);
      else 
        digitalWrite(LEDPin12, HIGH);
      
      if(0 == braille[i][5])
        digitalWrite(LEDPin13, LOW);
      else 
        digitalWrite(LEDPin13, HIGH);
      i++;
      if (26 == i)
      {
        i = 0;
      }
      
      delay(200);
      

  }
  
}
