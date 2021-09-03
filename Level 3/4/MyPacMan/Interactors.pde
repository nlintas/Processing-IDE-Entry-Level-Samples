abstract class Interactor{
  protected Being being1;
  protected Being being2;
  
  Interactor(Being one, Being two){
    being1 = one;
    being2 = two;
  }
  
  boolean involves(Being b){
    return(being1 == b || being2 ==b);  
  }
  
  abstract boolean detect();
  abstract void resolve();
}
/////////////////////////////////////////////
class FoodInteractor extends Interactor{
  
  FoodInteractor(Food c, Pacman p){
    super(c, p);  
  }
  
  boolean detect(){
    return being1.shape.collides(being2.shape);
  }
  
  void resolve(){
    being1.location.x= random(width);
    being1.location.y= random(height);
    Ghost temp = new Ghost(pizzaFace, 50);
    main.register(temp);
    main.register(new PacmanInteractor(pizzaFace, temp));
    score++;
    scoreText.setText("Score: "+score);
  }
}
////////////////////////////////////////////////////////
class PacmanInteractor extends Interactor{
  PacmanInteractor(Pacman p, Ghost g){
    super(p, g);  
  }
  
  boolean detect(){
    return being1.shape.collides(being2.shape);
  }
  
  void resolve(){
    active = gameOver;
  }
}
////////////////////////////////////////////////////
class FoodWallInteractor extends Interactor{
 
  FoodWallInteractor(Food c, Wall w){
    super(c, w);
  }
  
  boolean detect(){
    return being1.shape.collides(being2.shape);
  }
  
  void resolve(){
    ((Food) being1).velocity.mult(-1);
  }
    
}
