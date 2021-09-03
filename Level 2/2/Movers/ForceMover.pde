class ForceMover{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  float mass;
  
  ForceMover(){
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0); 
    acceleration = new PVector(0, 0);
    //limit
    topSpeed = 20;
    mass = 1;
  }
  
    ForceMover(float x, float y){
    location = new PVector(x, y);
    velocity = new PVector(0, 0); 
    acceleration = new PVector(0, 0);
    //limit
    topSpeed = 20;
    mass = random(0.5, 15);
  }
  
  void step(){
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    acceleration = new PVector(0, 0);
  }

  void display(){
    
    //point(x,y);
    ellipse(location.x,location.y,15 * mass,15 * mass);
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
  
  void applyForce(PVector force)
  {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void initialise()
  {
    this.step();
    this.bounceEdge();
    this.display();
  }
}
