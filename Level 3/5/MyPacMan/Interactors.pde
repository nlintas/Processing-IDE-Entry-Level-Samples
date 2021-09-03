
/////////////////////////////////////////////
class FoodInteractor extends Interactor<Food, Pacman>{
  
  FoodInteractor(){
    super();  
  }
  
  boolean detect(Food being1, Pacman being2){
    return being1.shape.collides(being2.shape);
  }
  
  void resolve(Food being1, Pacman being2){
    being1.location.x= random(width);
    being1.location.y= random(height);
    ghosts.add(new Ghost(pizzaFace, 50));
    score++;
    scoreText.setText("Score: "+score);
  }
}
////////////////////////////////////////////////////////
class PacmanInteractor extends Interactor<Pacman, Ghost>{
  PacmanInteractor(){
    super();  
  }
  
  boolean detect(Pacman being1, Ghost being2){
    return being1.shape.collides(being2.shape);
  }
  
  void resolve(Pacman being1, Ghost being2){
    active = gameOver;
  }
}
////////////////////////////////////////////////////
class FoodWallInteractor extends Interactor<Food, Wall>{
 
  FoodWallInteractor(){
    super();
  }
  
  boolean detect(Food being1, Wall being2){
    return being1.shape.collides(being2.shape);
  }
  
  void resolve(Food being1, Wall being2){
    being1.velocity.mult(-1);
  }
    
}
