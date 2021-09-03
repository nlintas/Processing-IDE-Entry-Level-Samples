Cherry eatme;
Pucman pizzaFace;
Ghost boo;
int score;
color YELLOW = color(244, 232, 66);

void setup() {
  size(1200, 800);
  surface.setLocation(5400-width, -140); //Do not write this line 
  eatme = new Cherry();
  pizzaFace = new Pucman();
  boo=new Ghost(pizzaFace);
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
  boo.drawme();
  boo.updatePosition();
  float d = dist(eatme.x, eatme.y, pizzaFace.x, pizzaFace.y);
  if(d<eatme.size/2+pizzaFace.size/2){
    eatme = new Cherry();
    score++;
    println(score);
  }
}
