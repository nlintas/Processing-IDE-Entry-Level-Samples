public class Cherry{
  private int x, y, speedX, speedY, dirX, dirY, size;
  
  Cherry(){
    x=(int) random(width);
    y=(int) random(height);
    size=50;
    speedX=5;
    speedY=5;
    dirX=-1;
    dirY=-1;
  }
  
  void drawme(){
    fill(#F01616);
    ellipse(x, y, size, size);
  }
  //mouseX, mouseY
  
  void updatePosition(){
    if(x<size/2 || x>width-size/2){
      dirX *= -1;
    }
    if(y<size/2 || y>height-size/2){
      dirY *= -1;
    }
    x+=speedX*dirX;
    y+=speedY*dirY;
  }
}
