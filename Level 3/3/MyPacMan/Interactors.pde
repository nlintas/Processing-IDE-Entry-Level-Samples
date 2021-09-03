abstract class Interactor{
  Being being1;
  Being being2;
  
  Interactor(Being one, Being two){
    being1 = one;
    being2 = two;
  }
  
  abstract boolean detect();
  abstract void resolve();
}
/////////////////////////////////////////////
class FoodInteractor extends Interactor{
  
  FoodInteractor(Cherry c, Pacman p){
    super(c, p);  
  }
  
  boolean detect(){
    return being1.shape.collides(being2.shape);
  }
  
  void resolve(){
    being1.location.x= random(width);
    being1.location.y= random(height);
    Ghost temp = new Ghost(pizzaFace, 50);
    boo.add(temp);
    eatPacman.add(new PacmanInteractor(pizzaFace, temp));
    score++;
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
    exit();
  }
  
}
