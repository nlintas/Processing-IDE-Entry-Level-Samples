class VectorMover{
  
  PVector location;
  PVector velocity;
  
  VectorMover(){
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(8, 3);  
  }
  
  void step(){
    
    location.add(velocity);
  }

  void display(){
    
    //point(x,y);
    ellipse(location.x,location.y,100,100);
    fill(pink);
  }
  
  void bounceEdge()
  {
    if(location.x >= width || location.x < 0) velocity.x = - velocity.x;
    if(location.y >= height || location.y < 0) velocity.y = - velocity.y;
  }
}
