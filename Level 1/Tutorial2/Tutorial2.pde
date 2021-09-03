//Variables, Control Statements, Animations and Windows Boundaries Tutorial.
// Variables in Processing
//int, float, boolean, char, String, Object (has custom data and behaviour)
//usable for the rest of the program.
float x;

void setup()
{
  size(800, 600);
  //giving a variable x a value.
  x = 400;
}

void draw()
{
  //removes outlines from objects.
  noStroke();
  //updates every frame.
  x = x + 5;
  //block that contains the object within the window
  if(x > width)
  {
    x = 0;
  }
  //color mixer in hex. 3 parameters RGB
  //fill(255, 0, 0);
  //random is a method that returns a random float value back, 255 is the limit.
  fill(random(255), random(255), random(255));
  //rect(mouseX, mouseY, 200, 100);
  /*ellipse is a flattened out cicle takes 4 arguments, right, down, width,
  height. Right and down to find the top left corner and then width and height
  from that point*/
  //ellipse(mouseX, mouseY, 100, 100);
  //making many ellipses at different heights
  ellipse(x, 0, 100, 100);
  ellipse(x, 100, 100, 100);
  ellipse(x, 200, 100, 100);
  ellipse(x, 300, 100, 100);
  ellipse(x, 400, 100, 100);
  ellipse(x, 500, 100, 100);
  ellipse(x, 600, 100, 100);
}
