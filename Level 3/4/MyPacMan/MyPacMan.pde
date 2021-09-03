//Beings
Food eatme;
Pacman pizzaFace;
Ghost ghost;
Wall w1;
TextBeing scoreText;
TextBeing gameOverText;

//Screens
Screen main;
Screen gameOver;
Screen active;

int score;
color YELLOW = color(244, 232, 66);

void setup() {
  size(800, 1170);
  surface.setLocation(4500-width, 100); //Do not write this line
  score=0;
  buildMainScreen();  
  buildGameOverScreen();
  active = main;
}

void draw() {
  background(color(23, 8, 102));
  active.step();
}

void buildGameOverScreen(){
  gameOver = new Screen();
  gameOverText = new TextBeing("GAME OVER", YELLOW, 50, width/2, height/2);
  gameOver.register(gameOverText);
}

void buildMainScreen(){
  //Make the main screen
  main = new Screen();
  
  //create and add a food being at the main screen
  eatme = new Food(50);
  main.register(eatme);
  
  //create and add pacman being at the main screen
  pizzaFace = new Pacman(50);
  main.register(pizzaFace);
  main.register(new FoodInteractor(eatme, pizzaFace));
  
  //create and add a ghost being at the main screen
  ghost = new Ghost(pizzaFace, 50);
  main.register(ghost);
  main.register(new PacmanInteractor(pizzaFace, ghost));
  
  //create and add a wall being at the main screen
  w1 = new Wall(new PVector(450, 500), 300, 20);
  main.register(w1);
  main.register(new FoodWallInteractor(eatme, w1));
  
  //create and add a TextBeing being at the main screen
  scoreText = new TextBeing("Score: 0", YELLOW, 40, width/2, 40);
  main.register(scoreText);
}
