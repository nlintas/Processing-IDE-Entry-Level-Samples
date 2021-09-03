class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxSpeed;
  float maxForce;
  float heading;
  float slowDownDistance;
  float desiredSeperation;
  float desiredCohesion;
  float mass; 

  Vehicle() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);  
    acceleration = new PVector(0, 0); 
    maxSpeed = 10;
    maxForce = 0.6;
    heading = 0;
    slowDownDistance = 200;
    desiredSeperation = 100;
    desiredCohesion = 200;
    mass = 2;
  }

  Vehicle(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);  
    acceleration = new PVector(0, 0); 
    maxSpeed = 10;
    maxForce = 0.6;
    heading = 0;
    slowDownDistance = 200;
    desiredSeperation = 50;
    desiredCohesion = 200;
    mass = random(1, 4);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void separate(ArrayList<Vehicle> others){
    PVector desiredVelocity = new PVector(0,0);
    PVector steering;
    int count=0;
    //for every OTHER vehicle within a distance calculate 
    //a desired velocity away from that vehicle
    for(Vehicle v: others){
      //calculate the average desired velocity
      PVector diff = PVector.sub(location, v.location);
      float distance = diff.mag();
      if(distance < desiredSeperation && distance > 0){
        diff.limit(maxSpeed);
        desiredVelocity.add(diff);
        count++;
      }
    }
    if(count !=0){
      desiredVelocity.div(count);
      desiredVelocity.limit(maxSpeed); 
      
    //calculate the steering force
    steering = PVector.sub(desiredVelocity, velocity); 
    steering.limit(maxForce);
    //apply this force
    this.applyForce(steering);
    }
  }
  
  void cohesion(ArrayList<Vehicle> others){
    PVector desiredVelocity = new PVector(0,0);
    PVector steering;
    int count=0;
    //for every OTHER vehicle within a distance calculate 
    //a desired velocity towards from that vehicle
    for(Vehicle v: others){
      //calculate the average desired velocity
      PVector diff = PVector.sub(v.location, location);
      float distance = diff.mag();
      if(distance < desiredCohesion && distance > 0){
        diff.limit(maxSpeed);
        desiredVelocity.add(diff);
        count++;
      }
    }
    if(count !=0){
      desiredVelocity.div(count);
      desiredVelocity.limit(maxSpeed); 
      
    //calculate the steering force
    steering = PVector.sub(desiredVelocity, velocity); 
    steering.limit(maxForce);
    //apply this force
    this.applyForce(steering);
    }
  }
  

  void seek(PVector target) {
    //1. calculate desired velocity by taking the difference between
    //target and current location using v3 = PVector.sub(v1, v2);
    PVector desired = PVector.sub(target, location);

    // Calculate the distance to the target
    float distance = desired.mag();
    //2. limit the desired velocity to maxSpeed using .limit(value)
    if (distance > slowDownDistance) {
      desired.limit(maxSpeed);
    } else {
      float speed = map(distance, 0, slowDownDistance, 0, maxSpeed);
      desired.limit(speed);
    }
    //3. Calculate the steering force by taking the difference between
    // the desired velocity - current velocity
    PVector steeringForce = PVector.sub(desired, velocity);
    //4. limit the steering force to maxForce using .limit(value)
    steeringForce.limit(maxForce);
    //5. apply the force to the vehicle using applyforce()
    this.applyForce(steeringForce);
  }

  void step() { 
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    heading = velocity.heading();
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
    pushMatrix();
    translate(location.x, location.y);
    rotate(heading);
    triangle(-mass*10, -mass*5, -mass*10, mass*5, mass*10, 0);
    strokeWeight(3);
    stroke(0);
    noFill();
    ellipse(0,0, desiredSeperation, desiredSeperation);
    popMatrix();
  }
}
