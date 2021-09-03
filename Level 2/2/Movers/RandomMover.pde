class RandomMover{
  
  float x;
  float y;
  
  RandomMover(){
    
    x = width/2; 
    y = height/2;
    
  }
  
  void step(){
    float choice = random(1);
    //extend so it has 40% to move towards the right, current 25%
    if (choice >= 0 && choice <= 0.2){
      y++;
    }
    else if (choice > 0.2 && choice <= 0.4){
      y--;
    }
    //right
    else if (choice > 0.4 && choice >= 0.8) {
      x++;
    }
    else{
      x--;
    }
    
    //  void step(){
    //float choice = int(random(100));
    ////extend so it has 40% to move towards the right, current 25%
    //if (choice < 80){
    //  y++;
    //}
    //else if (choice < 60){
    //  y--;
    //}
    ////right
    //else if (choice < 40) {
    //  x++;
    //}
    //else{
    //  x--;
    //}
    //constrain makes sure we are within the app window
    // x = constrain(x, 0, width);
    // y = constrain(y, 0, height);
    //random takes a range, noise gets steps, noise is predictible you can get the same number
    //map takes, a value, min, max, new min, new max. relative
  
  }

  void display(){
    
    //point(x,y);
    ellipse(x,y,100,100);
    fill(pink);
  }

}
