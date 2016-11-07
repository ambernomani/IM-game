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