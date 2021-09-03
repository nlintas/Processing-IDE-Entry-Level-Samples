public class Ghost{
  private int x, y, speedX, speedY, dirX, dirY, size;
  private Pucman target;
  
  Ghost(Pucman p){
    x=(int) random(width);
    y=(int) random(height);
    size=50;
    speedX=5;
    speedY=5;
    dirX=-1;
    dirY=-1;
    target = p;
  }
  
  void drawme(){
    fill(#16F01E);
    ellipse(x, y, size, size);
  }
  //mouseX, mouseY
  
  void updatePosition(){
    float distH = (x-target.x)*(x-target.x);
    float distV = (y-target.y)*(y-target.y);
    if(distH>distV){
      speedX =5;
      speedY =0;
      if(x>target.x){
        dirX=-1;
      }else{
        dirX=1;
      }
    }else{
      speedX=0;
      speedY=5;
      if(y>target.y){
        dirY=-1;
      }else{
        dirY=1; 
      }
    }
    x+=speedX*dirX;
    y+=speedY*dirY;
  }
}
