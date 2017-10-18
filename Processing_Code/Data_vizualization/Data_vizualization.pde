

Table table;
int[] white = new int[1000]; 
int[] yellow = new int[1000];
int[] green = new int[1000];
int[] red = new int[1000];
int i =0;

PFont f;

void setup() {
  size(1200,900);
  noStroke();
  
  f = createFont("Arial", 24, true);
  
  table = loadTable("DATALOG.CSV", "csv");

  println(table.getInt(11,3));
  println(table.getRowCount() + " total rows in table ... " ); 
  
  i = 0;
  for (TableRow row : table.rows()) {
    
    int value = row.getInt(0);
    //println(value);
    white[i] = value;
    //println(value);
    value = row.getInt(1);
    yellow[i] = value;
    println(value);
    value = row.getInt(2);
    green[i] = value;
    value = row.getInt(3);
    red[i] = value;
    i++;
    
    //println(value);
  }
  /*
  for (i = 0; i < table.getRowCount(); i++){
    int value = table.getInt(i, 0);
    white[i] = value;
    //println(value);
    value = table.getInt(i,1);
    yellow[i] = value;
    //println(value);
    value = table.getInt(i,2);
    green[i] = value;
    value = table.getInt(i,3);
    red[i] = value;
    i++;
  }*/
  i = 0;
}

color goodGreen = #00FF00;
color notsogoodGreen = #006600;
color notgoodGreen = #003300;

color lowerYellow = #FF9900;
color badRed = #FF3300;
color bloodRed = #993300;

int circleRadius = 140;

void draw() {
  background(255);
  textFont(f);
  fill(0);
  
  text("Sensors condition over time", 400, 100);
  text("White", 210, 500);
  text("Yellow", 445, 500);
  text("Green", 690, 500);
  text("Red", 940, 500);
  
  
  //Scale part
  
  stroke(1);
  fill(255);
  rect(170, 640, 790, 200);
  fill(0);
  text("Scale", 170, 630);
  
  fill(goodGreen);
  rect(210, 700, 100, 50);
  fill(notsogoodGreen);
  rect(310, 700, 100, 50);
  fill(notgoodGreen);
  rect(410, 700, 100, 50);
  
  fill(lowerYellow);
  rect(600, 700, 100, 50);
  fill(badRed);
  rect(700, 700, 100, 50);
  fill(bloodRed);
  rect(800, 700, 100, 50);
  
  fill(0);
  text("Good - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -> Bad", 210, 800);
  text("DANGER AREA!!!", 640, 680);
  
  //Filling color for the white sensor
  if (white[i] <150){
    fill(goodGreen);
  }
  else if (white[i] < 300){
    fill(notsogoodGreen);
  }
  else if (white[i] < 450){
    fill(notgoodGreen);
  }
  else if (white[i] < 600){
    fill(lowerYellow);
  }
  else if (white[i] < 750){
    fill(badRed);
  }
  else if (white[i] <1100){
    fill(bloodRed);
  }
  ellipse(240, 400, circleRadius, circleRadius);
  
  //Filling color for the yellow sensor
  if (yellow[i] <150){
    fill(goodGreen);
  }
  else if (yellow[i] < 300){
    fill(notsogoodGreen);
  }
  else if (yellow[i] < 450){
    fill(notgoodGreen);
  }
  else if (yellow[i] < 600){
    fill(lowerYellow);
  }
  else if (yellow[i] < 750){
    fill(badRed);
  }
  else if (yellow[i] <1100){
    fill(bloodRed);
  }
  ellipse(480, 400, circleRadius, circleRadius);
  
  //Filling color for the green sensor
  if (green[i] <150){
    fill(goodGreen);
  }
  else if (green[i] < 300){
    fill(notsogoodGreen);
  }
  else if (green[i] < 450){
    fill(notgoodGreen);
  }
  else if (green[i] < 600){
    fill(lowerYellow);
  }
  else if (green[i] < 750){
    fill(badRed);
  }
  else if (green[i] <1100){
    fill(bloodRed);
  }
  ellipse(720, 400, circleRadius, circleRadius);
  
  //Filling color for the red sensor
  if (red[i] <150){
    fill(goodGreen);
  }
  else if (red[i] < 300){
    fill(notsogoodGreen);
  }
  else if (red[i] < 450){
    fill(notgoodGreen);
  }
  else if (red[i] < 600){
    fill(lowerYellow);
  }
  else if (red[i] < 750){
    fill(badRed);
  }
  else if (red[i] <1100){
    fill(bloodRed);
  }
  ellipse(960, 400, circleRadius, circleRadius);
  
  
  
  
  delay(500);
  
  
  
  i++;
  if (i == table.getRowCount()){
    while(true){}
  }
}