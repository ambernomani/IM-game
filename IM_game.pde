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
