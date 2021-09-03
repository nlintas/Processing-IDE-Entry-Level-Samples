abstract class Interactor{
  Being a;
  Being b;
  
  Interactor(Being one, Being two){
    a = one;
    b = two;
  }
  
  abstract boolean detect();
  abstract void resolve();
}

class FoodInteractor extends Interactor{
  
  FoodInteractor(Cherry c, Pacman p){
    super(c, p);  
  }
  
  boolean detect(){
    boolean result=false;
    float d = dist(a.position.x, a.position.y, b.position.x, b.position.y);
    if(d<=a.size/2+b.size/2) result = true;
    return result;
  }
  
  void resolve(){
    a.position.x= random(width);
    a.position.y= random(height);
    Ghost temp = new Ghost(pizzaFace);
    boo.add(temp);
    eatPacman.add(new PacmanInteractor(pizzaFace, temp));
    score++;
  }
}

class PacmanInteractor extends Interactor{
  PacmanInteractor(Pacman p, Ghost g){
    super(p, g);  
  }
  
  boolean detect(){
    boolean result=false;
    float d = dist(a.position.x, a.position.y, b.position.x, b.position.y);
    if(d<=a.size/2+b.size/2) result = true;
    return result;
  }
  
  void resolve(){
    exit();
  }
  
}
