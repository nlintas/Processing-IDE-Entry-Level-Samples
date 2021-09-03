//Object with Setters and Getters
public class Ball
{
  //Attributes
  private int y = 100;
  private int ySpeed = 5;
  private int x = 400;
  private int xSpeed = 0;
  private int size = 50;
  //Constructor with x and y coordinates.
  public Ball(int x, int y, int ySpeed, int xSpeed, int size)
  {
    this.y = y;
    this.ySpeed = ySpeed;
    this.x = x;
    this.xSpeed = xSpeed;
    this.size = size;
  }
  //Methods
  public void move()
  {
    y += ySpeed;
    x += xSpeed;
  }
  
  public void setYSpeed(int ySpeed)
  {
    this.ySpeed = ySpeed; 
  }
  
  //or this
  /*
      public void setYSpeed(int newY)
      {
        ySpeed = newY; 
      }
  */
  
  public void setXSpeed(int xSpeed)
  {
    this.xSpeed = xSpeed; 
  }
  
  public int getXSpeed()
  {
    return xSpeed; 
  }
  
  public int getYSpeed()
  {
    return ySpeed; 
  }
  
  public void display()
  {
    ellipse(x, y, size, size);
  }
}
