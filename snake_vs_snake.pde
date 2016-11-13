int P1posY = 40;
int P1posX = 40;
int P2posX = 760;//width/2;
int P2posY = 760; //height;
String P1playerC = "purple";
String P2playerC = "blue";
//String starC="yellow";

int arrayVal = 100;

int arr1 = 0;//counter for how many stored values for player 1
int arr2 = 0;//counter for how many stored values for player 2
boolean boo1 = false;//checks if player 1 or player 2 has moved
boolean boo2 = false;

int[] p1X;
int[] p1Y;
int[] p2X;
int[] p2Y;

Move m1;
Move m2;
PImage photo;
int setTextColor = 0;//determines if the key has been pressed
boolean isLeft, isRight, isUp, isDown, isW, isS, isA, isD;

ArrayList<Star> starArray;
int[] coordStarsX;
int[] coordStarsY;
int numStars = 4;

int pointCounterP1 = 0;
int pointCounterP2 = 0;

void setup() {
  size(800, 800);
  background(0);
  noStroke();
  m1= new Move(P1playerC, P1posX, P1posY);
  m2=new Move(P2playerC, P2posX, P2posY);

  p1X=new int[arrayVal];
  p1Y=new int[arrayVal];
  p2X=new int[arrayVal];
  p2Y=new int[arrayVal];

  for (int l=0; l<arrayVal; l++) {
    p1X[l]=P1posX;
    p1Y[l]=P1posY;
    p2X[l]=P2posX;
    p2Y[l]=P2posY;
  }
  printArray(p1X);
  printArray(p1Y);
  printArray(p2X);
  printArray(p2Y);

  coordStarsX = new int[numStars];
  coordStarsY = new int[numStars];

  starArray= new ArrayList<Star>();
  for (int i=0; i<numStars; i++) {
    for (int y=0; y<numStars; y++) {
      int x = (i*200)+100;
      int y2 = (y*200)+100;
      println(x, y2);
      Star s= new Star(x, y2, 10, 20, 5, "yellow");
      starArray.add(s);
      //printArray(starArray);
      coordStarsX[i] = x;
      coordStarsY[i] = y2;
    }
  }
  printArray(starArray);
}

void draw() {
  if (setTextColor == 0) {
    fill(255);
    textSize(32);
    textAlign(CENTER);
    text("PRESS ANY KEY TO START\nCollect stars and avoid your opponent \nRemember to avoid their stars!\nTAP TO PLAY", width/2, height/2 + 250);
    //translate(width - 100, height/2); //for 800
    translate(width/2 + 300, height/2 + 100); //for 1200
    rotate(PI);
    textAlign(CENTER);
    text("PRESS ANY KEY TO START\nCollect stars and avoid your opponent \nRemember to avoid their stars!\nTAP TO PLAY", 300, 300 - 50);
  } else {
    fill(0);
  }

  if (keyPressed == true) {
    setTextColor = 1;
    //m1.keyPressed();    
    //m2.keyPressed();
    m1.keyPressed();
    m2.keyPressed();
    delay(75);
    checkWinner();
    
  }
}
