public class Pucman{
  public int x, y, size;
  
  Pucman(){
    x=mouseX;
    y=mouseY;
    size=100;
  }
  
  void drawme(){
    fill(YELLOW);
    ellipse(x, y, size, size);
  }
  
  void updatePosition(){
    x=mouseX;
    y=mouseY;
  }
}
