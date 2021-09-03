Vehicle[] m;
final color blue = color(25, 25, 112);
final color pink = color(255, 182, 193);


void setup() {
  size(850, 350);
  surface.setLocation(2200, -600);
  m= new Vehicle[1];
  for(int i=0; i<m.length; i++){
    m[i] = new Vehicle();
  }
}

void draw() {
  background(blue);

  for(int i=0; i<m.length; i++){
    m[i].seek(new PVector(mouseX, mouseY));
    m[i].step();
    m[i].passEdges();
    m[i].display();
  }
}
