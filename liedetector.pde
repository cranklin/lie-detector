int redPin = 9;
int greenPin = 10;
int bluePin = 11;

int buzzerPin = 7;

int potPin = 1;
int sensorPin = 0;

long red = 0xFF0000;
long green = 0x00FF00;
long blue = 0x000080;

int band = 15;
// adjust for sensitivity

void setup()
{
  pinMode(potPin, INPUT);
  pinMode(sensorPin, INPUT);
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);
  pinMode(buzzerPin, OUTPUT);
}
void loop()
{
    int gsr = analogRead(sensorPin);
    int pot = analogRead(potPin);
    if (gsr > pot + band)
    {
        setColor(red);
        beep();
    }
    else if (gsr < pot - band)
    {
        setColor(blue);
    }
    else
    {
        setColor(green);
    }
}

void setColor(long rgb)
{
    int red = rgb >> 16;
    int green = (rgb >> 8) & 0xFF;
    int blue = rgb & 0xFF;
    analogWrite(redPin, red);
    analogWrite(greenPin, green);
    analogWrite(bluePin, blue);
}

void beep()
{
    for (int i=0; i<1000; i++)
    {
        digitalWrite(buzzerPin, HIGH);
        delayMicroseconds(100);
        digitalWrite(buzzerPin, LOW);
        delayMicroseconds(100);
    }
}
