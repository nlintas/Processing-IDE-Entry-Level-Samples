Cherry eatme;
Pacman pizzaFace;
FoodInteractor eatCherry;
ArrayList<Ghost> boo;
ArrayList <PacmanInteractor> eatPacman;
int score;
color YELLOW = color(244, 232, 66);

void setup() {
  size(1200, 800);
  surface.setLocation(4500-width, 30); //Do not write this line 
  eatme = new Cherry();
  pizzaFace = new Pacman();
  eatCherry = new FoodInteractor(eatme, pizzaFace);
  boo= new ArrayList<Ghost>();
  boo.add(new Ghost(pizzaFace));
  eatPacman = new ArrayList<PacmanInteractor>();
  eatPacman.add(new PacmanInteractor(pizzaFace, boo.get(0)));
  score=0;
}

void draw() {
  background(color(23, 8, 102));
  fill(YELLOW);
  textSize(20);
  textMode(CENTER);
  text("Score: "+score, width/2, 20);
  eatme.drawme();
  eatme.updatePosition();
  pizzaFace.drawme();
  pizzaFace.updatePosition();
  for(Ghost g:boo){
    g.drawme();
    g.updatePosition();
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
