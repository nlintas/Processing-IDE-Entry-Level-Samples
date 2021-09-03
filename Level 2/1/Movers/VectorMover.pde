class VectorMover{
  PVector location;
  PVector velocity;
  
  VectorMover(){
    location = new PVector(random(width),random(height));
    velocity = new PVector(8, 3); 
    
  }
  
  void step(){
    location.add(velocity);
  }
  
  void bounceOnEdges(){
    if(location.x>width || location.x<0) velocity.x *= -1;
    if(location.y>height || location.y<0) velocity.y *= -1;

}
  
  void display(){
    fill(pink);
    ellipse(location.x,location.y, 50,50);
  }
}
