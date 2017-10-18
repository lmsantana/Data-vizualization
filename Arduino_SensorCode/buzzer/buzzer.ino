
/*
 * Use a 100KOhm resitor in series with the FSR
 * One pin of the resistor goes to GND and other to A0
 * One pin of the FSR goes to A0 and the other to 5V
 */

#include <SPI.h>
#include <SD.h>

//defined pins for interface
#define BUZZER 9
#define POWERLED 13
#define DANGERLED 11

//Pins for the analog input of the sensors
#define whiteSensor A0   
#define yellowSensor A2
#define greenSensor A3
#define redSensor A5

const int chipSelect = 4; //May actually use pin 10 according to the code

void setup() {
  Serial.begin(9600);
  pinMode(BUZZER, OUTPUT);
  pinMode(POWERLED, OUTPUT);
  pinMode(DANGERLED, OUTPUT);
  digitalWrite(POWERLED, HIGH);
  digitalWrite(DANGERLED, LOW);

  if (!SD.begin(chipSelect)){
    Serial.println("SD card failed!");
    return;
  }
  Serial.println("Card initialized...");

  File dataFile = SD.open("header.csv", FILE_WRITE);
  if (dataFile) {
    dataFile.println("A0, A2, A3, A5");
    dataFile.println("White, Yellow, Green, Red");
    dataFile.close();
  }
  else {
    Serial.println("Could not open data file");
    return;
  }
}

void loop() {  
  String dataString = "";  //string that buffer the sensor value
    
  // read the value from the sensor:
  int whiteValue = analogRead(whiteSensor);
  int yellowValue = analogRead(yellowSensor);
  int greenValue = analogRead(greenSensor);
  int redValue = analogRead(redSensor);

  dataString = String(whiteValue) + ", " + String(yellowValue) + ", " + String(greenValue) + ", " + String(redValue);
  
  //Write to the SD card
  File dataFile = SD.open("datalog.csv", FILE_WRITE);
  if (dataFile){
    dataFile.println(dataString);
    dataFile.close();
    Serial.println("White Yellow Green Red");
    Serial.println(dataString);
  }
  else {
    Serial.println("Coudl not acces the file");
  }

  delay(500);

  //Case for when the user is in danger
  //*****Change this for a timer interrupt later
  if (whiteValue > 600 | yellowValue > 600 | greenValue > 600 | redValue > 600){
    delay (1000);
     if (whiteValue > 600 | yellowValue > 600 | greenValue > 600 | redValue > 600){
      tone(BUZZER, 400);
      digitalWrite(DANGERLED, HIGH);
      delay(200);
      digitalWrite(DANGERLED, LOW);
      delay(200 + 500);
    }
  }
}
