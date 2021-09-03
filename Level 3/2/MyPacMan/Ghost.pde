public class Ghost extends Being{
  private PVector velocity;
  private Pacman target;
  PImage image;
  
  Ghost(Pacman p){
    super(new PVector(random(width),random(height)), 50);
    image = loadImage("assets/ghost"+int(random(4)+1)+".png");
    image.resize(size, size);
    velocity = new PVector(-5,-5);
    target = p;
  }
  
  void drawme(){
    //fill(#16F01E);
    //ellipse(x, y, size, size);
    image(image, position.x-size/2, position.y-size/2);
  }
  //mouseX, mouseY
  
  void updatePosition(){
    float distH = (position.x-target.position.x)*(position.x-target.position.x);
    float distV = (position.y-target.position.y)*(position.y-target.position.y);
    if(distH>distV){
      velocity.y = 0;
      if(position.x>target.position.x){
        velocity.x = -5;
      }else{
        velocity.x = 5;
      }
    }else{
      velocity.x = 0;
      if(position.y>target.position.y){
        velocity.y = -5;   
      }else{
        velocity.y = 5;
      }
    }
    position.add(velocity);
  }
}
