Cherry eatme;
Pacman pizzaFace;
FoodInteractor eatCherry;
ArrayList<Ghost> boo;
ArrayList <PacmanInteractor> eatPacman;
Wall w1;
int score;
color YELLOW = color(244, 232, 66);

void setup() {
  size(800, 1170);
  surface.setLocation(4500-width, 100); //Do not write this line 
  eatme = new Cherry(50);
  pizzaFace = new Pacman(50);
  eatCherry = new FoodInteractor(eatme, pizzaFace);
  boo= new ArrayList<Ghost>();
  boo.add(new Ghost(pizzaFace, 50));
  eatPacman = new ArrayList<PacmanInteractor>();
  eatPacman.add(new PacmanInteractor(pizzaFace, boo.get(0)));
  score=0;
  w1 = new Wall(new PVector(450, 500), 300, 20);
}

void draw() {
  background(color(23, 8, 102));
  fill(YELLOW);
  textSize(20);
  textMode(CENTER);
  text("Score: "+score, width/2, 20);
  eatme.drawme();
  eatme.step();
  pizzaFace.drawme();
  pizzaFace.step();
  w1.drawme();
  for(Ghost g:boo){
    g.drawme();
    g.step();
  }
  if(eatCherry.detect()){
    eatCherry.resolve();
  }
  for(PacmanInteractor p:eatPacman){
    if(p.detect()){
      p.resolve();
    }
  }
}
