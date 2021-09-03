class PerlinMover{
  
  float x;
  float y;
  float tx;
  float ty;
  
  PerlinMover(){
    
    x = width/2; 
    y = height/2;
    tx = 0;
    float ty = 10.000;
  }
  
  void step(){
    //random takes a range, noise gets steps, noise is predictible you can get the same number
    //map takes, a value, min, max, new min, new max. relative
    x = noise(tx);
    y = noise(ty);
    tx += 0.01;
    ty += 0.01;
    x = map(x, 0, 1, 0, width);
    y = map(y, 0, 1, 0, height);
  
  }

  void display(){
    
    //point(x,y);
    ellipse(x,y,100,100);
    fill(pink);
  }

}
