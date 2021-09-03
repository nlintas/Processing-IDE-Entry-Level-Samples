public class Pacman extends Being{
  
  Pacman(){
    super(new PVector(mouseX, mouseY), 100); 
  }
  
  void drawme(){
    fill(YELLOW);
    ellipse(position.x, position.y, size, size);
  }
  
  void updatePosition(){
    position.x=mouseX;
    position.y=mouseY;
  }
}
