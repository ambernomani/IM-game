# IM-game

Player P1;
Player P2;

void setup(){
  size(600, 600);
  background(0);
  P1 = new Player("red", width/2, 0);
  P2 = new Player("black", width/2, height);
}

void draw(){
  if (keyPressed == true){
    if (P1 == "red"){
      
    //run game
    print("hi");
  }else{
    textSize(32);
    textAlign(CENTER);
    text("Press any key to start", width/2, height/2);
  }
}
