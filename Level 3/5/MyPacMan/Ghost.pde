public class Ghost extends Being{
  private PVector velocity;
  private Pacman target;
  PImage image;
  int size;
  
  Ghost(Pacman p, int s){
    super(new Circle(new PVector(random(width),random(height)), s/2));
    size = s;
    image = loadImage("assets/ghost"+int(random(4)+1)+".png");
    image.resize(size, size);
    velocity = new PVector(-5,-5);
    target = p;
  }
  
  void drawme(){
    image(image, location.x-size/2, location.y-size/2);
  }
  
  void step(){
    float distH = (location.x-target.location.x)*(location.x-target.location.x);
    float distV = (location.y-target.location.y)*(location.y-target.location.y);
    if(distH>distV){
      velocity.y = 0;
      if(location.x>target.location.x){
        velocity.x = -5;
      }else{
        velocity.x = 5;
      }
    }else{
      velocity.x = 0;
      if(location.y>target.location.y){
        velocity.y = -5;   
      }else{
        velocity.y = 5;
      }
    }
    location.add(velocity);
  }
}
