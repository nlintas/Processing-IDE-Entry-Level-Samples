class Wall extends Being{
  Wall(PVector p, int w, int h){
    super(new Rectangle(p, w, h));
  }
  
  void step(){}
  
  void drawme(){
    fill(0);
    rect(location.x, location.y, ((Rectangle) shape).rw, ((Rectangle) shape).rh); 
  }
}
