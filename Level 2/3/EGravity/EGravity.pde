ForceMover[] m;
final color blue = color(25, 25, 112);
final color pink = color(255, 182, 193);

void setup() {
  size(1000, 600);
  //delete the line bellow when you run it to your machines
  surface.setLocation(2200, -170);
  m= new ForceMover[20];
  for(int i=0; i<m.length; i++){
    m[i] = new ForceMover();
  }
}

void draw() {
  background(blue);
  for(int i=0; i<m.length; i++){
    for(int j=0; j<m.length; j++){
      if(i!=j){
        m[i].attractedTo(m[j]);
      }
    }
    m[i].step();
    m[i].passEdges();
    m[i].display();
  }
}
