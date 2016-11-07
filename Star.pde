
class Star {
  PVector loc;
  int xPos;
  int yPos;
  int npoints;
  float radius1;
  float radius2;
  String starColor;

  Star(int x, int y, float tempRad1, float tempRad2, int tempPoints, String tempColor) {
    loc=new PVector(x, y);
    xPos=x;
    yPos=y;
    npoints=tempPoints;
    radius1=tempRad1;
    radius2=tempRad2;
    starColor=tempColor;
  }

  void starDisplay() {
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = loc.x + cos(a) * radius2;
      float sy = loc.y + sin(a) * radius2;
      vertex(sx, sy);
      sx = loc.x + cos(a+halfAngle) * radius1;
      sy = loc.y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}