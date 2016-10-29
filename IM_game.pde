Player p1;
Player p2;
PImage photo;

void setup(){
  size(600,600);
  background(0);
}
void draw(){
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


void move(){
    if (characterColor=="blue") {
     fill(0,0,255);
    } else if (characterColor=="purple") {
     fill(138, 43, 226);
     }
    ellipse(positionX, positionY, 20, 20);  
  }
  
  void keyPressed(){
    if (key == CODED) {
      if (keyCode == UP){
        positionY += 50;
      } else if (keyCode == DOWN){
        positionY -= 50;
      } else if (keyCode == RIGHT){
        positionX += 50;
      } else if (keyCode == LEFT){
        positionX -= 50;
      } else if (keyCode == 87){
        positionY -= 50;
      } else if (keyCode == 83){
        positionY += 50;
      } else if (keyCode == 68){
        positionX -= 50;
      } else if (keyCode == 65){
        positionX += 50;
      }
    }
  }
  
  void keyReleased(){
    if (key == CODED) {
      if (keyCode == UP){
        positionY += 0;
      } else if (keyCode == DOWN){
        positionY -= 0;
      } else if (keyCode == RIGHT){
        positionX += 0;
      } else if (keyCode == LEFT){
        positionX -= 0;
      } else if (keyCode == 87){
        positionY -= 0;
      } else if (keyCode == 83){
        positionY += 0;
      } else if (keyCode == 68){
        positionX -= 0;
      } else if (keyCode == 65){
        positionX += 0;
      }
    }
  }
}
