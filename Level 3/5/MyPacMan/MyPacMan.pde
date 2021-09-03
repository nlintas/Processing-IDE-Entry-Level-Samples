//Beings of the main scren
Food eatme;
Pacman pizzaFace;
Group<Ghost> ghosts;
Wall w1;
TextBeing scoreText;
int score;

//Beings of the game over screen
TextBeing gameOverText;
ButtonBeing startAgainBtn;

//Screens
Screen main;
Screen gameOver;
Screen active;


color GREEN = #11EA53;
color YELLOW = #F1F534;
color RED = #F70C20;
color BLUE = #130CF7;
color BLACK = #000000;
color WHITE = #FFFFFF;

void setup() {
  size(800, 1170);
  //Do not write the line bellow//////////////////////
  surface.setLocation(4500-width, 100); //Do not write this line
  //Do not write the line above////////////////////////

  buildMainScreen();  
  buildGameOverScreen();
  active = main;
}

void draw() {
  background(color(23, 8, 102));
  active.step();
}

void buildGameOverScreen() {
  gameOver = new Screen();
  gameOverText = new TextBeing("GAME OVER", YELLOW, 50, width/2, height/2);
  gameOver.register(gameOverText);
  startAgainBtn = new ButtonBeing("Play again?", WHITE, GREEN, 50, width/2, int(height*0.6)) {
    public void act() {
      buildMainScreen();
      active = main;
    }
  };
  gameOver.register(startAgainBtn);
}

void buildMainScreen() {
  //Make the main screen
  main = new Screen();
  score = 0;
  //create and add a food being at the main screen
  eatme = new Food(50);
  main.register(eatme);

  //create and add pacman being at the main screen
  pizzaFace = new Pacman(50);
  main.register(pizzaFace);

  //create and add a ghost being at the main screen
  ghosts = new Group<Ghost>(main);
  ghosts.add(new Ghost(pizzaFace, 50));

  //create and add a wall being at the main screen
  w1 = new Wall(new PVector(width*0.5, height*0.5), 300, 20);
  main.register(w1);

  //create and add a TextBeing being at the main screen
  scoreText = new TextBeing("Score: 0", YELLOW, 40, width/2, 40);
  main.register(scoreText);
  
  //Interactor and interactions
  main.register(eatme, pizzaFace, new FoodInteractor());
  main.register(pizzaFace, ghosts, new PacmanInteractor());
  main.register(eatme, w1, new FoodWallInteractor());
}
////////////////////////////////////////////////
