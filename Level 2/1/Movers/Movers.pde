VectorMover m;
PerlinMover p;
final color blue = color(25,25,112);
final color pink = color(255,182,193);

void setup(){
  size(700, 250);
  m = new VectorMover();
  p = new PerlinMover();
}

void draw(){
  background(blue);
  m.step();
  m.bounceOnEdges();
  m.display();
  p.step();
  p.display();
}
