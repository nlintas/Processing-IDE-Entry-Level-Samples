class Liquid
{
  //attributes
  float x;
  float y;
  float width;
  float height;
  float coefficient;
  
  //constructors
  Liquid()
  {
    x = 0;
    y = 0;
    width = 100;
    height = 100;
    coefficient = 0;
  }
  
   Liquid(float xs, float ys, float w, float h, float coef)
   {
    xs = x;
    ys = x;
    w = width;
    h = height;
    coef = coefficient;
  }
  
  //methods
  boolean contains(ForceMover m)
  {
    if(m.location.x > x && x < (x + width))
    {
      if(m.location.y > y && y < (y + height))
      {
        return true;
      }
    }
    return false;
  }
  
  PVector drag(ForceMover m)
  {
    //fluid resistance, could also add surface.
    PVector d = m.velocity.copy();
    d.normalize();
    d.mult(-1);
    //magnitude -> velocity + coefficient. Magnitude squared.
    float magnitude = m.velocity.magSq() * coefficient;
    d.mult(magnitude);
    return d;
  }
  
  void display()
  {
    fill(random(255));
    rect(x, y, width, height);
  }
  
}
