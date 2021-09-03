class VelocityMover{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  
  VelocityMover(){
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0); 
    acceleration = new PVector(-0.002, 0.05);
    //limit
    topSpeed = 30;
  }
  
  void step()
  {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    
  }
  
  void mouseStep()
  {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    
    PVector mouse = new PVector(mouseX, mouseY);
    //subtract
    mouse.sub(location);
    mouse.normalize();
    mouse.mult(5);
    acceleration.set(mouse);
  }

  void display(){
    
    //point(x,y);
    ellipse(location.x,location.y,100,100);
    //if(acceleration.x == topSpeed || acceleration.y == topSpeed) fill(random(255),random(255),random(255));
    //else fill(pink);
    fill(pink);
  }
  
  void initialise()
  {
    this.mouseStep();
    this.passEdges();
    this.display();
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
