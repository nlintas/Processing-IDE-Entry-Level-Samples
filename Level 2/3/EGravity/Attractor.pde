class Attractor {
  float mass;
  PVector location;

  Attractor(float x, float y, float m) {
    location = new PVector(x, y);  
    mass = m;
  }


  void display() {
    fill(#E55D02);
    ellipse(location.x, location.y, mass*5, mass*5);
  }

  PVector attract(ForceMover m) {
    PVector gravity = PVector.sub(location, m.location);
    float r = constrain(gravity.mag(), 5, 25);
    gravity.normalize();
    float magnitute = mass * m.mass / (r*r);
    gravity.mult(magnitute);
    return gravity;
  }
}
