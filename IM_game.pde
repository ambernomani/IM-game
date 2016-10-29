class Person{
  String characterColor;
  int positionX;
  int positionY;
  
  Person(String tempColor,int tempX, int tempY){
    characterColor=tempColor;
    positionX=tempX;
    positionY=tempY;
  }
  void display(){
   if(characterColor=="red"){
     fill(255,0,0);
   }
   if(characterColor=="black"){
     fill(0,0,0);
   }
   else{
     fill(200,200,200);
   }
   
  }
}