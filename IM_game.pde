
int P1posY = 0;
int P1posX = 300;
int P2posX = 300;
int P2posY = 600;
String P1playerC = "purple";
String P2playerC = "blue";

Player p1;
Player p2;
Move m1;
Move m2;
PImage photo;
int setTextColor = 0;//determines if the key has been pressed

void setup(){
  size(600, 600);
  background(0);
  p1 = new Player(P1playerC, P1posX, P1posY);
  p2 = new Player(P2playerC, P2posX, P2posY);
  m1= new Move(P1playerC, P1posX, P1posY);
  m2=new Move(P2playerC, P2posX, P2posY);
}

void draw(){
  noStroke();
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
    //p1.display();
    //p2.display();
    //m1.display();
    //m2.display();
    p1.keyPressed();
    m1.keyPressed();    
    p2.keyPressed();
    m2.keyPressed();
    delay(75);
    color pTrue = color(138, 43, 226);
    //println("trueP: ", pTrue);
    //println("TPRed:"+red(pTrue)+" Green:"+green(pTrue)+" Blue:"+blue(pTrue)); 
    color bTrue = color(0, 0, 255);
    //println("trueB: ", bTrue);
    //println("TPRed:"+red(bTrue)+" Green:"+green(bTrue)+" Blue:"+blue(bTrue)); 
    color p = get(P1posX, P1posY);
    //println("colorP: ", p);
    //println("PRed:"+red(p)+" Green:"+green(p)+" Blue:"+blue(p)); 
    color b = get(P2posX, P2posY);
    //println("colorB: ", b);
    //println("BRed:"+red(b)+" Green:"+green(b)+" Blue:"+blue(b)); 
    
    if (p == bTrue){
      m1.display();
      text("GAME OVER. Blue wins", width/2, height/2);
      println("gameoverB");
    } else if (b == pTrue){
      m2.display();
      text("GAME OVER. Purple wins", width/2, height/2);
      println("gameoverP");
    } else {
      
      m1.display();
      m2.display();
     
    } 
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
     photo = loadImage("blueGirl.png");
     image(photo, P2posX, P2posY,30,40);
   }
   if(playerColor=="purple"){
     photo = loadImage("purpleGirl.png");
     image(photo, P1posX, P1posY,30,40);
   }
   
  }
  void keyPressed(){
    //if(keyPressed==true){
    //if (key == CODED) {
      if (keyCode == UP){
        P2posY -= 10;
      } else if (keyCode == DOWN){
        P2posY += 10;
      } else if (keyCode == RIGHT){
        P2posX += 10;
      } else if (keyCode == LEFT){
        P2posX -= 10;
      } else if (key == 'w'){
        P1posY += 10;
        print('w');
      } else if (key == 's'){
        P1posY -= 10;
        print('s');
      } else if (key == 'a'){
        P1posX += 10;
        print('a');
      } else if (key == 'd'){
        P1posX -= 10;
        print('d');
      }
    }
  }
  
  //void keyReleased(){
  //  //if(keyPressed==true){
  //  //if (key == CODED) {
  //    if (keyCode == UP){
  //      P2posY -= 0;
  //    } else if (keyCode == DOWN){
  //      P2posY += 0;
  //    } else if (keyCode == RIGHT){
  //      P2posX += 0;
  //    } else if (keyCode == LEFT){
  //      P2posX -= 0;
  //    } else if (key == 'w'){
  //      P1posY -= 0;
  //    } else if (key == 's'){
  //      P1posY += 0;
  //    } else if (key == 'a'){
  //      P1posX -= 0;
  //    } else if (key == 'd'){
  //      P1posX += 0;
  //    }
  //  }



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
  
  void keyPressed(){
    //if(keyPressed==true){
    //if (key == CODED) {
      if (keyCode == UP){
        P2posY -= 10;
      } else if (keyCode == DOWN){
        P2posY += 10;
      } else if (keyCode == RIGHT){
        P2posX += 10;
      } else if (keyCode == LEFT){
        P2posX -= 10;
      } else if (key == 'w'){
        P1posY += 10;
        print('w');
      } else if (key == 's'){
        P1posY -= 10;
        print('s');
      } else if (key == 'a'){
        P1posX += 10;
        print('a');
      } else if (key == 'd'){
        P1posX -= 10;
        print('d');
      }
    }
  }
  
/*  void keyReleased(){
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
