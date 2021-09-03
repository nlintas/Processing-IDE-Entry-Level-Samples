public class Food extends Being{
  private PVector velocity;
  PImage image;
  int size;
  
  Food(int s){
    super(new Circle(new PVector(random(width),random(height)), s/2)); 
    size = s;
    image = loadImage("assets/cherry.png");
    velocity = new PVector(-5,-5);
    image.resize(size, size);
  }
  
  void drawme(){
    image(image, location.x-size/2, location.y-size/2);
  }
  
  void step(){
    if(location.x<size/2 || location.x>width-size/2){
      velocity.x *= -1;
    }
    if(location.y<size/2 || location.y>height-size/2){
      velocity.y *= -1;
    }
    location.add(velocity);
  }
}
