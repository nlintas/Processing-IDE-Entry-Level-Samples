//Unique Functions and Basic Principals.
//void creates a funtion, then you define the name(setup in this case)
//setup is also a unique predefined function which gets called only once in the beggining of execution
void setup()
{
  //takes 2 arguments, window size 800 x 600 in this case.
  //width then height. w x h.
  size(800, 600);
}
//function draw, an infinite loop that draws.
void draw()
{
  //background clears the screen before rendering the rest, 0 is black in hexadecimal.
  background(0);
  /*4 arguments, right, down, width, height. Right and down to find the top 
  left corner and then width and height from that point*/
  rect(100, 100, 200, 100);
  //mouseX is the position x for our mouse pointer, updates every frame
  rect(mouseX, mouseY, 200, 100);
}
