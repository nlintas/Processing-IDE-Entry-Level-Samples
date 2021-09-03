//Bouncing Ball, Beginner Physics, Reversing Values, Objects Tutorial
//declaration and assignement can be combined.
float x = 400;
int y = 300;
//represents x speed, stored in variable for manipulation purposes.
//if you change the x and y speed to unequal values you change the angle of
//the bounce
float xSpeed = 10;
float ySpeed = 10;
Ball b = new Ball(400, 300, 5, 5, 25);
Ball b2 = new Ball(200, 100, 10, 10, 50);
void setup()
{
  size(800, 600);
  
}

void draw()
{
  //disabled for trailing.
  //background(0);
  fill(random(255), random(255), random(255));
  
  x += xSpeed;
  /*if the ellipse is of the screen on the right or 0 for the left, make 
  the speed negative. We use - 25 to bounce from its sides and not its
  center point.*/
  if(x + 25 > width || x - 25 < 0)
  {
    //reverses value to negative, shorthand for * -1
    xSpeed *= -1;
  }
  
  y += ySpeed;
  if(y + 25 > height || y - 25 < 0)
  {
    //reverses value to negative, shorthand for * -1
    ySpeed *= -1;
  }
  
  ellipse(x, y, 50, 50);
  b.display();
  b.move();
  b2.display();
  b2.move();
}
