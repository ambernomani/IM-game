int P1posY = 30;
int P1posX = 30;
int P2posX = 550;//width/2;
int P2posY = 550; //height;
String P1playerC = "purple";
String P2playerC = "blue";

int arrayVal=30;

int arr1=0;//counter for how many stored values for player 1
int arr2=0;//counter for how many stored values for player 2
boolean boo1=false;//checks if player 1 or player 2 has moved
boolean boo2=false;
int[] p1X;
int[] p1Y;
int[] p2X;
int[] p2Y;

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
  
  p1X=new int[arrayVal];
  p1Y=new int[arrayVal];
  p2X=new int[arrayVal];
  p2Y=new int[arrayVal];
  
  for(int l=0;l<arrayVal;l++){
    p1X[l]=P1posX;
    p1Y[l]=P1posY;
    p2X[l]=P2posX;
    p2Y[l]=P2posY;
  }
  printArray(p1X);
  printArray(p1Y);
  printArray(p2X);
  printArray(p2Y);
}

void draw(){
  if(setTextColor == 0){
       fill(255);
       textSize(32);
       textAlign(CENTER);
       text("Press any key to start", width/2, height/2);
  }else{
      fill(0);
      //text("Press any key to start", width/2, height/2);
  }
  
  if (keyPressed == true){
    setTextColor = 1;
    //p1.keyPressed();
    m1.keyPressed();    
    //p2.keyPressed();
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
     //fill(0,0,255);
     photo=loadImage("blueGirl.png");
     //ellipse(positionX,positionY,40,40);
   }
   if(playerColor=="purple"){
     //fill(138, 43, 226);
     //ellipse(positionX,positionY,40,40);
     photo=loadImage("purpleGirl.png");
   }
   image(photo, positionX, positionY,30,40);
   ellipse(positionX,positionY,40,40);
  }
  void keyPressed(){
    if(keyPressed==true){
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
    background(0);
    if (P1playerC == "blue") {
       fill(0,0,255);
       for(int i=0;i<arrayVal;i++){
          ellipse(p1X[i],p1Y[i],20,20);
       }
       //ellipse(p1X[19],p1Y[19],40,40);
       
    } else if (P1playerC == "purple") {
       fill(138, 43, 226);
       for(int i=0;i<arrayVal;i++){
          ellipse(p1X[i],p1Y[i],20,20);
       }
       //ellipse(p1X[19],p1Y[19],40,40);
       
    }
    if (P2playerC == "blue") {
      fill(0,0,255);
      for(int i=0;i<arrayVal;i++){
        ellipse(p2X[i],p2Y[i],20,20);
      }
      //ellipse(p2X[19],p2Y[19],40,40);
      
    } else if(P2playerC == "purple"){
      fill(138, 43, 226);
      for(int i=0;i<arrayVal;i++){
        ellipse(p2X[i],p2Y[i],20,20);
      }
      //ellipse(p2X[19],p2Y[19],40,40);
    }
  }
  
  void keyPressed(){
      if (keyCode == UP){
        P2posY -= 20;
        if(P2posY < 0){
          P2posY=10;
        }
        boo1=false;
        boo2=true;
      } else if (keyCode == DOWN){
        P2posY += 20;
        if(P2posY>height){
          P2posY=height-10;
        }
        boo1=false;
        boo2=true;
      } else if (keyCode == RIGHT){
        P2posX += 20;
        if(P2posX>width){
          P2posX=width-10;
        }
        boo1=false;
        boo2=true;
      } else if (keyCode == LEFT){
        P2posX -= 20;
        if(P2posX<0){
          P2posX=10;
        }
        boo1=false;
        boo2=true;
      } else if (key == 'w'){
        P1posY -= 20;
        if(P1posY<0){
          P1posY=10;
        }
        boo1=true;
        boo2=false;
        print("W");
      } else if (key == 's'){
        P1posY += 20;
        if(P1posY>height){
          P1posY=height-10;
        }
        boo1=true;
        boo2=false;
        print("S");
      } else if (key == 'a'){
        P1posX -= 20;
        if(P1posX<0){
          P1posX=10;
        }
        boo1=true;
        boo2=false;
        print("A");
      } else if (key == 'd'){
        P1posX += 20;
        if(P1posX>width){
          P1posX=width-10;
        }
        boo1=true;
        boo2=false;
        print("D");
      }
      print(boo1, boo2);
      if(arr1<arrayVal && boo1==true){
      p1X[arr1]=P1posX;
      p1Y[arr1]=P1posY;
      }
      if (arr1>=arrayVal && boo1==true){
        for(int i=0;i<(arrayVal-1);i++){
          p1X[i]=p1X[i+1];
          p1Y[i]=p1Y[i+1];
        }
        p1X[arrayVal-1]=P1posX;
        p1Y[arrayVal-1]=P1posY;
      }
      if(arr2<arrayVal && boo2==true){
        p2X[arr2]=P2posX;
        p2Y[arr2]=P2posY;
      }if (arr2>=arrayVal && boo2==true){
        for(int i=0;i<(arrayVal-1);i++){
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
