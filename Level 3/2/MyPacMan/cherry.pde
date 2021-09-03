public class Cherry extends Being{
  private PVector velocity;
  PImage image;
  
  Cherry(){
    super(new PVector(random(width),random(height)), 50); 
    image = loadImage("assets/cherry.png");
    velocity = new PVector(-5,-5);
    image.resize(size, size);
  }
  
  void drawme(){
    //fill(#F01616);
    //ellipse(x, y, size, size);
    image(image, position.x-size/2, position.y-size/2);
    //stroke(255);
    //strokeWeight(5);
    //point(x,y);
    //strokeWeight(1);
  }
  //mouseX, mouseY
  
  void updatePosition(){
    if(position.x<size/2 || position.x>width-size/2){
      velocity.x *= -1;
    }
    if(position.y<size/2 || position.y>height-size/2){
      velocity.y *= -1;
    }
    position.add(velocity);
  }
}
