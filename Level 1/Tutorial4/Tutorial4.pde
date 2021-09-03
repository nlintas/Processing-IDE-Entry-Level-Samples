// Functions Tutorial
void setup()
{
  size(800, 600);
}

void draw()
{
  background(255);
  int i = 0;
  //loop creates multiple objects, updates their position using the i loop variable
  while(i < 30)
  {
    table(i * 40 + 100, i * 40 + 100);
    i += 1;
  }
}
//use this functions to make a table, given coordinates x and y
void table(int x, int y)
{
  rect(x - 50, y, 20, 50);
  rect(x + 30, y, 20, 50);
  ellipse(x, y, 100, 40);
}
