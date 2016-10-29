int P1posY = 30;
int P1posX = 30;
int P2posX = 550;//width/2;
int P2posY = 550; //height;
String P1playerC = "purple";
String P2playerC = "blue";
int arr1=0;//counter for how many stored values for player 1
int arr2=0;//counter for how many stored values for player 2
boolean boo1=false;//checks if player 1 or player 2 has moved
boolean boo2=false;

Player p1;
Player p2;
Move m1;
Move m2;
PImage photo;
int setTextColor = 0;//determines if the key has been pressed

int[] p1X;
int[] p1Y;
int[] p2X;
int[] p2Y;


void setup(){
  size(600, 600);
  background(0);
  p1 = new Player(P1playerC, P1posX, P1posY);
  p2 = new Player(P2playerC, P2posX, P2posY);
  m1= new Move(P1playerC, P1posX, P1posY);
  m2=new Move(P2playerC, P2posX, P2posY);
  
  p1X=new int[20];
  p1Y=new int[20];
  p2X=new int[20];
  p2Y=new int[20];
}

void draw(){
  if(setTextColor == 0){
       fill(255);
       textSize(32);
       textAlign(CENTER);
       text("Press any key to start", width/2, height/2);
  }else{
      fill(0);
      text("Press any key to start", width/2, height/2);
  }
  
  if (keyPressed == true){
    setTextColor = 1;
    p1.display();
    p2.display();
    m1.display();
    m2.display();
    p1.keyPressed();
   // p1.keyReleased();    
    p2.keyPressed();
   // p2.keyReleased();
    
    } 
}
  
class Player{ //makes the players in their position and color
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
   image(photo, positionX, positionY,30,40);
  }
  void keyPressed(){
    if(keyPressed==true){
    //if (key == CODED) {
      if (keyCode == UP){
        P2posY -= 10;
        boo2=true;
        boo1=false;
      } else if (keyCode == DOWN){
        P2posY += 10;
        boo2=true;
        boo1=false;
      } else if (keyCode == RIGHT){
        P2posX += 10;
        boo2=true;
        boo1=false;
      } else if (keyCode == LEFT){
        P2posX -= 10;
        boo2=true;
        boo1=false;
      } else if (key == 'w'){
        P1posY += 10;
        boo2=false;
        boo1=true;
        print('w');
      } else if (key == 's'){
        P1posY -= 10;
        boo2=false;
        boo1=true;
        print('s');
      } else if (key == 'a'){
        P1posX += 10;
        boo2=false;
        boo1=true;
        print('a');
      } else if (key == 'd'){
        P1posX -= 10;
        boo2=false;
        boo1=true;
        print('d');
      }
    }
  }
  
  void keyReleased(){
    if(keyPressed==true){
    //if (key == CODED) {
      if (keyCode == UP){
        P2posY -= 0;
      } else if (keyCode == DOWN){
        P2posY += 0;
      } else if (keyCode == RIGHT){
        P2posX += 0;
      } else if (keyCode == LEFT){
        P2posX -= 0;
      } else if (key == 'w'){
        P1posY -= 0;
      } else if (key == 's'){
        P1posY += 0;
      } else if (key == 'a'){
        P1posX -= 0;
      } else if (key == 'd'){
        P1posX += 0;
      }
    }
  }
}


/*class Dots{
  String playerColor;
  int positionX;
  int positionY;
  int count;
  
  Dots(String tempColor, int tempX, int tempY, int tempCount){
    playerColor=tempColor;
    positionX=tempX;
    positionY=tempY;
    count=tempCount;
  }
  void display(){
    if (P1playerC == "blue") {
       fill(0,0,255);
       ellipse(P1posX, P1posY, 20, 20); 
    } else if (P1playerC == "purple") {
       fill(138, 43, 226);
       ellipse(P1posX, P1posY, 20, 20); 
    }
    if (P2playerC == "blue") {
      fill(0,0,255);
      ellipse(P2posX, P2posY, 20, 20);
    } else if(P2playerC == "purple"){
      fill(138, 43, 226);
      ellipse(P2posX, P2posY, 20, 20);
    }
  }
}*/

class Move{
  String playerColor;
  int positionX;
  int positionY;
  
  Move(String tempColor,int tempX, int tempY){
    playerColor=tempColor;
    positionX=tempX;
    positionY=tempY;
  }
  
  void display(){
    if (P1playerC == "blue") {
       fill(0,0,255);
       for(int i=0;i<20;i++){
          ellipse(p1X[i],p1Y[i],20,20);
       }
       //ellipse(P1posX, P1posY, 20, 20); 
    } else if (P1playerC == "purple") {
       fill(138, 43, 226);
       for(int i=0;i<20;i++){
          ellipse(p1X[i],p1Y[i],20,20);
       }
       //ellipse(P1posX, P1posY, 20, 20); 
    }
    if (P2playerC == "blue") {
      fill(0,0,255);
      for(int i=0;i<20;i++){
        ellipse(p2X[i],p2Y[i],20,20);
      }
      //ellipse(P2posX, P2posY, 20, 20);
    } else if(P2playerC == "purple"){
      fill(138, 43, 226);
      for(int i=0;i<20;i++){
        ellipse(p2X[i],p2Y[i],20,20);
      }
      //ellipse(P2posX, P2posY, 20, 20);
    }
    
  }
  
  void keyPressed(){
      if (keyCode == UP){
        P2posY -= 10;
        boo2=true;
        boo1=false;
      } else if (keyCode == DOWN){
        P2posY += 10;
        boo2=true;
        boo1=false;
      } else if (keyCode == RIGHT){
        P2posX += 10;
        boo2=true;
        boo1=false;
      } else if (keyCode == LEFT){
        P2posX -= 10;
        boo2=true;
        boo1=false;
      } else if (key == 'w'){
        P1posY -= 10;
        boo2=false;
        boo1=true;
        print("W");
      } else if (key == 's'){
        P1posY += 10;
        boo2=false;
        boo1=true;
        print("S");
      } else if (key == 'a'){
        P1posX -= 10;
        boo2=false;
        boo1=true;
        print("A");
      } else if (key == 'd'){
        P1posX += 10;
        boo2=false;
        boo1=true;
        print("D");
      }
    if(arr1<20 && boo1==true){
      p1X[arr1]=P1posX;
      p1Y[arr1]=P1posY;
    }else if (arr1>=20 && boo1==true){
      int temp=0;
      for(int i=(arr1-20);i<arr1;i++){
        p1X[temp]=p1X[i];
        p1Y[temp]=p1Y[i];
        temp++;
      }
    }
    if(arr2<20 && boo2==true){
      p2X[arr2]=P2posX;
      p2Y[arr2]=P2posY;
    }else if (arr2>=20 && boo2==true){
      int temp=0;
      for(int i=(arr2-20);i<arr2;i++){
        p2X[temp]=p2X[i];
        p2Y[temp]=p2Y[i];
        temp++;
      }
    }
  }
  
  /*void keyReleased(){
    if(keyPressed==true){
    //if (key == CODED) {
      if (key == UP){
        P2posY -= 10;
        keyPressed=false;
      } else if (keyCode == DOWN){
        P2posY += 10;
      } else if (keyCode == RIGHT){
        P2posX += 10;
      } else if (keyCode == LEFT){
        P2posX -= 10;
      } else if (keyCode == 87){
        P1posY -= 10;
      } else if (keyCode == 83){
        P1posY += 10;
      } else if (keyCode == 68){
        P1posX -= 10;
      } else if (keyCode == 65){
        P1posX += 10;
      }
    }
  }*/
}
