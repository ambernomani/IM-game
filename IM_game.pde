int P1posY = 0;
int P2posX = width/2;
int P2posY = height;
String P1playerC = "purple";
String P2playerC = "blue";

void setup(){
  size(600, 600);
  background(0);
  P1 = new Player(P1playerC, P1posX, P1posY);
  P2 = new Player(P2playerC, P2posX, P2posY);
}

void draw(){
if (keyPressed == true){

  
  p2=new Player("purple",500,500);
  p1=new Player("blue", 30,30);
  p1.display();
  p2.display();
  p1.move();
  p1.keyPressed();
  p1.keyReleased();
      
  p2.move();
  p2.keyPressed();
  p2.keyReleased();
  }else{
    textSize(32);
    textAlign(CENTER);
    text("Press any key to start", width/2, height/2);
  }
}
  
class Player{
  String playerColor;
  int positionX;
  int positionY;
  
  Player(String tempColor,int tempX, int tempY){
    playerColor=tempColor;
    positionX=tempX;
    positionY=tempY;
  }
  void display(){
   if(playerColor == "blue"){
     photo=loadImage("blueGirl.png");
   }
   if(playerColor=="purple"){
     photo=loadImage("purpleGirl.png");
   }
   image(photo, positionX, positionY,60,80);
  }

}

class Move(){
     
  
  void display(){
  
    if (P1playerC == "blue") {
     fill(0,0,255);
    } else if (P1playerC == "purple") {
     fill(138, 43, 226);
     }
    ellipse(P1posX, P1posY, 20, 20); 
    ellipse(P2posX, P2posY, 20, 20);
  }
  
  void keyPressed(){
    if (key == CODED) {
      if (keyCode == UP){
        P2posY += 50;
      } else if (keyCode == DOWN){
        P2posY -= 50;
      } else if (keyCode == RIGHT){
        P2posX += 50;
      } else if (keyCode == LEFT){
        P2posX -= 50;
      } else if (keyCode == 87){
        P1posY -= 50;
      } else if (keyCode == 83){
        P1posY += 50;
      } else if (keyCode == 68){
        P1posX -= 50;
      } else if (keyCode == 65){
        P1posX += 50;
      }
    }
  }
  
  void keyReleased(){
    if (key == CODED) {
      if (keyCode == UP){
        P2posY += 50;
      } else if (keyCode == DOWN){
        P2posY -= 50;
      } else if (keyCode == RIGHT){
        P2posX += 50;
      } else if (keyCode == LEFT){
        P2posX -= 50;
      } else if (keyCode == 87){
        P1posY -= 50;
      } else if (keyCode == 83){
        P1posY += 50;
      } else if (keyCode == 68){
        P1posX -= 50;
      } else if (keyCode == 65){
        P1posX += 50;
      }
    }
  }
}
 
