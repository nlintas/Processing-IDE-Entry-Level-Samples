abstract class Being{
  PVector location;
  Shape shape;
  
  Being(Shape s){
    location = s.position;
    shape = s;
  }
  
  abstract void step();
  abstract void drawme();
}
