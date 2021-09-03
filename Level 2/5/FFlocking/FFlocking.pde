ArrayList<Biod> m;
final color blue = color(25, 25, 112);
final color pink = color(255, 182, 193);


void setup() {
  size(850, 850);
  surface.setLocation(2200, -600);
  m= new ArrayList<Biod>();
  for(int i=0; i<500; i++){
    m.add(new Biod());
  }
}

void draw() {
  background(blue);

  for(int i=0; i<m.size(); i++){
    m.get(i).applyBehaviour(m);
    m.get(i).step();
    m.get(i).passEdges();
    m.get(i).display();
  }
}
