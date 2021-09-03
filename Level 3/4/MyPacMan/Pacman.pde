public class Pacman extends Being{
  int size;
  
  Pacman(int s){
    super(new Circle(new PVector(mouseX, mouseY), s/2)); 
    size = s;
  }
  
  void drawme(){
    fill(YELLOW);
    circle(location.x, location.y, size);
  }
  
  void step(){
    location.x=mouseX;
    location.y=mouseY;
  }
}
