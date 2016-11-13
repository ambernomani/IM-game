void checkWinner(){
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
      P2posX = 760; //width/2;
      P2posY = 760; //height;
      for (int l=0; l<arrayVal; l++) {
        p1X[l]=P1posX;
        p1Y[l]=P1posY;
        p2X[l]=P2posX;
        p2Y[l]=P2posY;
      }
    }
    if (b == pTrue) {
      m2.display();
      fill(0);
      rect(0, 0, width, height);
      fill(255);
      text("GAME OVER. Purple wins", width/2, height/2);
      println("gameoverP");
      P1posY = 40;
      P1posX = 40;
      P2posX = 760;//width/2;
      P2posY = 760; //height;
      for (int l=0; l<arrayVal; l++) {
        p1X[l]=P1posX;
        p1Y[l]=P1posY;
        p2X[l]=P2posX;
        p2Y[l]=P2posY;
      }
    } if (p == color(0) || b == color(0)) {

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
