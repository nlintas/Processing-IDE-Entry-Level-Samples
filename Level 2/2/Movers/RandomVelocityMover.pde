class RandomVelocityMover{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  
  RandomVelocityMover(){
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0); 
    acceleration = new PVector(-0.002, 0.05);
    //limit
    topSpeed = 10;
  }
  
  void step(){
    acceleration = PVector.random2D();
    acceleration.mult(0.5);
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
  }

  void display(){
    
    //point(x,y);
    ellipse(location.x,location.y,100,100);
    fill(pink);
  }
  
  void bounceEdge()
  {
    if(location.x > width || location.x < 0) velocity.x *= -1;
    if(location.y > height || location.y < 0) velocity.y *= -1;
  }
  
  void passEdges()
  {
    if(location.x > width) location.x = 0;
    else if(location.x < 0) location.x = width;
    
    if(location.y < 0) location.y = height;
    else if(location.y > height) location.y = 0;
    
  }
  //change the color of the ball if it travels at maximum speed
}
