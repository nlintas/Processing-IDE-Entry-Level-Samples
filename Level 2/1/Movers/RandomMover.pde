class RandomMover{
  float x;
  float y;
  
  RandomMover(){
    x = width/2;
    y = height/2;
  }
  
  void step(){
    int choice = int(random(100));
    if(choice<40) x++;
    else if (choice<60) x--;
    else if (choice<80) y++;
    else y--;
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }
  
  void display(){
    fill(pink);
    ellipse(x,y, 50,50);
  }
}
