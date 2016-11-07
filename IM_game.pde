int P1posY = 40;
int P1posX = 40;
int P2posX = 560;//width/2;
int P2posY = 560; //height;
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
    text("Press any key to start", width/2, height/2 + 250);
    translate(width - 100, height/2); //for 800
    //translate(width/2 + 300, height/2 + 100); //for 1200
    rotate(PI);
    textAlign(CENTER);
    text("Press any key to start", 300, 300 - 50);
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
    color pTrue = color(138, 43, 226);
    color bTrue = color(0, 0, 255);
    color p = get(P1posX, P1posY);
    color b = get(P2posX, P2posY);

    if (p == bTrue) {
      m1.display();
      fill(0);
      rect(0, 0, width, height);
      fill(255);
      text("GAME OVER. Blue wins", width/2, height/2);
      println("gameoverB");
      P1posY = 40;
      P1posX = 40;
      P2posX = 560; //width/2;
      P2posY = 560; //height;
      for (int l=0; l<arrayVal; l++) {
        p1X[l]=P1posX;
        p1Y[l]=P1posY;
        p2X[l]=P2posX;
        p2Y[l]=P2posY;
      }
    } else if (b == pTrue) {
      m2.display();
      fill(0);
      rect(0, 0, width, height);
      fill(255);
      text("GAME OVER. Purple wins", width/2, height/2);
      println("gameoverP");
      P1posY = 40;
      P1posX = 40;
      P2posX = 560;//width/2;
      P2posY = 560; //height;
      for (int l=0; l<arrayVal; l++) {
        p1X[l]=P1posX;
        p1Y[l]=P1posY;
        p2X[l]=P2posX;
        p2Y[l]=P2posY;
      }
    } else {

      m1.display();
      m2.display();
    } 
    for (int i=0; i < starArray.size(); i++) {
      Star s= starArray.get(i);
      if (s.starColor=="yellow") {
        fill(200, 200, 0);
      } else if (s.starColor=="purple") {
        fill(138, 43, 226);
      } else if (s.starColor=="blue") {
        fill(0, 0, 255);
      }
      s.starDisplay();
    }

    for (int i=0; i<starArray.size(); i++) {//check to see where if the snake passes the stars
      Star s=starArray.get(i);
      if ((s.xPos-5<P1posX && P1posX<s.xPos+5) && (s.yPos-5<P1posY && P1posY<s.yPos+5)) {
        if (s.starColor=="yellow") {  
          pointCounterP1++;
        }
        if (P1playerC=="blue") {   
          s.starColor="blue";
          s.starDisplay();
        } else if (P1playerC=="purple") {
          s.starColor="purple";
          s.starDisplay();
        }
        println("P1 points: ", pointCounterP1);
      } else if ((s.xPos-5<P2posX && P2posX<s.xPos+5) && (s.yPos-5<P2posY && P2posY<s.yPos+5)) {
        if (s.starColor=="yellow") {  
          pointCounterP2++;
        }
        if (P2playerC=="blue") {
          s.starColor="blue";
          s.starDisplay();
        } else if (P2playerC=="purple") {
          s.starColor="purple";
          s.starDisplay();
        }
        println("P2 points: ", pointCounterP2);
      } else {
        println("P1 points: ", pointCounterP1);
        println("P2 points: ", pointCounterP2);
      }
    }
    if ((pointCounterP1+pointCounterP2)>15) {
      if (pointCounterP1>pointCounterP2) {
        fill(0);
        rect(0, 0, width, height);
        fill(255);
        text("Purple Wins!", width/2, height/2);
      } else if (pointCounterP1<pointCounterP2) {
        fill(0);
        rect(0, 0, width, height);
        fill(255);
        text("Blue Wins!", width/2, height/2);
      } else if (pointCounterP1==pointCounterP2) {
        fill(0);
        rect(0, 0, width, height);
        fill(255);
        text("Tie!", width/2, height/2);
      }
    }
  }
}

class Move {
  String playerColor;
  int positionX;
  int positionY;

  Move(String tempColor, int tempX, int tempY) {
    playerColor=tempColor;
    positionX=tempX;
    positionY=tempY;
  }

  void display() {
    background(0);
    if (P1playerC == "blue") {
      fill(0, 0, 255);
      ellipse(p1X[arrayVal-1], p1Y[arrayVal-1], 40, 40);
      for (int i=0; i<arrayVal; i++) {
        ellipse(p1X[i], p1Y[i], 20, 20);
      }
      fill(255);
      ellipse((p1X[arrayVal-1]-10), p1Y[arrayVal-1], 10, 10);
      ellipse((p1X[arrayVal-1]+10), p1Y[arrayVal-1], 10, 10);
      fill(0);
      ellipse((p1X[arrayVal-1]-10), p1Y[arrayVal-1], 5, 5);
      ellipse((p1X[arrayVal-1]+10), p1Y[arrayVal-1], 5, 5);
    } else if (P1playerC == "purple") {
      fill(138, 43, 226);
      ellipse(p1X[arrayVal-1], p1Y[arrayVal-1], 40, 40);
      for (int i=0; i<arrayVal; i++) {
        ellipse(p1X[i], p1Y[i], 20, 20);
      }
      fill(255);
      ellipse((p1X[arrayVal-1]-10), p1Y[arrayVal-1], 10, 10);
      ellipse((p1X[arrayVal-1]+10), p1Y[arrayVal-1], 10, 10);
      fill(0);
      ellipse((p1X[arrayVal-1]-10), p1Y[arrayVal-1], 5, 5);
      ellipse((p1X[arrayVal-1]+10), p1Y[arrayVal-1], 5, 5);
    }
    if (P2playerC == "blue") {
      fill(0, 0, 255);
      ellipse(p2X[arrayVal-1], p2Y[arrayVal-1], 40, 40);
      for (int i=0; i<arrayVal; i++) {
        ellipse(p2X[i], p2Y[i], 20, 20);
      }
      fill(255);
      ellipse((p2X[arrayVal-1]-10), p2Y[arrayVal-1], 10, 10);
      ellipse((p2X[arrayVal-1]+10), p2Y[arrayVal-1], 10, 10);
      fill(0);
      ellipse((p2X[arrayVal-1]-10), p2Y[arrayVal-1], 5, 5);
      ellipse((p2X[arrayVal-1]+10), p2Y[arrayVal-1], 5, 5);
    } else if (P2playerC == "purple") {
      fill(138, 43, 226);
      ellipse(p2X[arrayVal-1], p2Y[arrayVal-1], 40, 40);
      for (int i=0; i<arrayVal; i++) {
        ellipse(p2X[i], p2Y[i], 20, 20);
      }
      fill(255);
      ellipse((p2X[arrayVal-1]-10), p2Y[arrayVal-1], 10, 10);
      ellipse((p2X[arrayVal-1]+10), p2Y[arrayVal-1], 10, 10);
      fill(0);
      ellipse((p2X[arrayVal-1]-10), p2Y[arrayVal-1], 5, 5);
      ellipse((p2X[arrayVal-1]+10), p2Y[arrayVal-1], 5, 5);
    }
  }

  void keyPressed() {
   
      switch(keyCode) {
        case UP:
          P2posY -= 10;
          if (P2posY < 0) {
            P2posY=10;
          }
          boo1=false;
          boo2=true;
          println("up");
          break;
  
        case DOWN:
          println("down");
          P2posY += 10;
          if (P2posY>height) {
            P2posY=height-10;
          }
          boo1=false;
          boo2=true;
          break;
  
        case RIGHT:
          println("right");
          P2posX += 10;
          if (P2posX>width) {
            P2posX=width-10;
          }
          boo1=false;
          boo2=true;
          break;
  
        case LEFT:
          println("left");
          P2posX -= 10;
          if (P2posX<0) {
            P2posX=10;
          }
          boo1=false;
          boo2=true;
          break;
        }
  
      switch(key) {
        case 'w':
          println("w");
          P1posY += 10;
          if (P1posY>height) {
            P1posY=height-10;
          }
          
          boo1=true;
          boo2=false;
          break;
  
        case 's':
          println("s");
          P1posY -= 10;
          if (P1posY<0) {
            P1posY=10;
          }
          boo1=true;
          boo2=false;
          break;
  
        case 'd':
          println("d");
          P1posX -= 10;
          if (P1posX<0) {
            P1posX=10;
          }
          boo1=true;
          boo2=false;
          break;
  
        case 'a':
          println("a");
          P1posX += 10;
          if (P1posX>width) {
            P1posX=width-10;
          }
          
          boo1=true;
          boo2=false;
          break;
        }

    print(boo1, boo2);

    if (arr1<arrayVal && boo1==true) {
      p1X[arr1]=P1posX;
      p1Y[arr1]=P1posY;
    }
    if (arr1>=arrayVal && boo1==true) {
      for (int i=0; i<(arrayVal-1); i++) {
        p1X[i]=p1X[i+1];
        p1Y[i]=p1Y[i+1];
      }
      p1X[arrayVal-1]=P1posX;
      p1Y[arrayVal-1]=P1posY;
    }
    if (arr2<arrayVal && boo2==true) {
      p2X[arr2]=P2posX;
      p2Y[arr2]=P2posY;
    }
    if (arr2>=arrayVal && boo2==true) {
      for (int i=0; i<(arrayVal-1); i++) {
        p2X[i]=p2X[i+1];
        p2Y[i]=p2Y[i+1];
      }
      p2X[arrayVal-1]=P2posX;
      p2Y[arrayVal-1]=P2posY;
    }
    arr1++;
    arr2++;
  }
}

class Star {
  PVector loc;
  int xPos;
  int yPos;
  int npoints;
  float radius1;
  float radius2;
  String starColor;

  Star(int x, int y, float tempRad1, float tempRad2, int tempPoints, String tempColor) {
    loc=new PVector(x, y);
    xPos=x;
    yPos=y;
    npoints=tempPoints;
    radius1=tempRad1;
    radius2=tempRad2;
    starColor=tempColor;
  }

  void starDisplay() {
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = loc.x + cos(a) * radius2;
      float sy = loc.y + sin(a) * radius2;
      vertex(sx, sy);
      sx = loc.x + cos(a+halfAngle) * radius1;
      sy = loc.y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}
