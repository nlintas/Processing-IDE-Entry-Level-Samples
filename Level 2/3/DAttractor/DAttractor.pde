ForceMover[] m;
final color blue = color(25, 25, 112);
final color pink = color(255, 182, 193);
Attractor sun;

void setup() {
  size(1000, 600);
  sun = new Attractor(width/2, height/2, 20);
  m= new ForceMover[20];
  for(int i=0; i<m.length; i++){
    m[i] = new ForceMover();
  }
}

void draw() 
{
  background(blue);
  sun.display();
  for(int i=0; i<m.length; i++){
    m[i].attractedTo(sun);
    m[i].step();
    m[i].passEdges();
    m[i].display();
  }
}
