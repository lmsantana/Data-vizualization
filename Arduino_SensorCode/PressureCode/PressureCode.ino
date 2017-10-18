
/*
 * Use a 100KOhm resitor in series with the FSR
 * One pin of the resistor goes to GND and other to A0
 * One pin of the FSR goes to A0 and the other to 5V
 */

#include <SPI.h>
#include <SD.h>

//Pins for the analog input of the sensors
int whiteSensor = A0;   
int yellowSensor = A2;
int greenSensor = A3;
int redSensor = A5;

//Variables for the sensor value
int whiteValue = 0;   
int yellowValue = 0;
int greenValue = 0;
int redValue = 0;
float volt = 0;

const int chipSelect = 4; //May actually use pin 10 according to the code

void setup() {
  Serial.begin(9600);

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

  String dataString= "";  //string that buffer the sensor value
    
  // read the value from the sensor:
  whiteValue = analogRead(whiteSensor);
  yellowValue = analogRead(yellowSensor);
  greenValue = analogRead(greenSensor);
  redValue = analogRead(redSensor);

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
}
