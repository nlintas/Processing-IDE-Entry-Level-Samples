class PerlinMover{
  float x;
  float y;
  float tx;
  float ty;
  
  PerlinMover(){
    x = width/2;
    y = height/2;
    tx= 0;
    ty= 10000;
  }
  
  void step(){
    x=noise(tx);
    tx +=0.01;
    y=noise(ty);
    ty+=0.01;
    x = map(x, 0, 1, 0, width);
    y = map(y, 0, 1, 0, height); 
  }
  
  void display(){
    fill(pink);
    ellipse(x,y, 50,50);
  }
}
