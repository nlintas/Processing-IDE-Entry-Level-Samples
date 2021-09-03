class ForceMover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  float mass; 

  ForceMover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(5), random(5));  
    acceleration = new PVector(0, 0); 
    topSpeed = 10;
    mass = 5;
  }

  ForceMover(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);  
    acceleration = new PVector(0, 0); 
    topSpeed = 10;
    mass = random(0.2, 2);
  }
  
  void attractedTo(Attractor a){
    applyForce(a.attract(this));  
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void step() { 
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    acceleration = new PVector(0, 0);
  }

  void bounceOnEdges() {
    if (location.x>width || location.x<0) velocity.x *= -1;
    if (location.y>height || location.y<0) velocity.y *= -1;
  }

  void passEdges() {
    if (location.x>width) location.x = 0;
    if (location.y>height) location.y =0;
    if (location.x<0) location.x = width;
    if (location.y<0) location.y = height;
  }

  void display() {
    fill(pink);
    ellipse(location.x, location.y, 5*mass, 5*mass);
  }
}
