RandomMover m;
RandomMover m1;
RandomMover m2;
RandomMover m3;
RandomMover m4;
PerlinMover p;
VectorMover v;
VelocityMover v2;
RandomVelocityMover rv;
VelocityMover mv;
VelocityMover[] a;
ForceMover f;
PVector gravity = new PVector(0, 0.1);
ForceMover[] fa;

final color blue = color(0,0,205);
final color pink = color(255,182,193);
final color green = color(0,0,205);


void setup(){
  
  size(1000,600);
  frameRate(60);
  m = new RandomMover();
  m1 = new RandomMover();
  m2 = new RandomMover();
  m3 = new RandomMover();
  m4 = new RandomMover();
  p = new PerlinMover();
  v = new VectorMover();
  v2 = new VelocityMover();
  rv = new RandomVelocityMover();
  mv = new VelocityMover();
  f = new ForceMover();
  fa = new ForceMover[200];
  //21 because n(20) + 1, need to start from
  for(int i=0; i<fa.length; i++)
  {
    fa[i] = new ForceMover((i+1)*width/fa.length+1, 10);
  }
  //for(int i=0; i<20; i++)
  //{
  //  a[i] = new VelocityMover();
  //}
}

void draw()
{
  background(blue);
  //m.step();
  //m.display();
  //m1.step();
  //m1.display();
  //m2.step();
  //m2.display();
  //m3.step();
  //m3.display();
  //m4.step();
  //m4.display();
  //p.step();
  //p.display();
  //v.step();
  //v.bounceEdge();
  //v.display();
  //v2.step();
  //v2.bounceEdge();
  //v2.passEdges();
  //v2.display();
  //rv.step();
  //rv.bounceEdge();
  //rv.passEdges();
  //rv.display();
  //mv.mouseStep();
  //mv.passEdges();
  //mv.display();
  //for(int i=0; i<20; i++)
  //{
  //  a[i].initialise();
  //}
  //wind is here because it can change
  PVector wind = new PVector(-0.01, 0);

  f.applyForce(gravity);
  f.applyForce(wind);
  f.initialise();
  for(int i=0; i<fa.length; i++)
  {
    PVector gravity = new PVector(0, 0.1*fa[i].mass);
    fa[i].applyForce(gravity);
    fa[i].applyForce(wind);
    fa[i].initialise();
  }

  /*
  
  if (frameCount % 2 == 0) {
    line(0,0,width,height);
  }
  
  ellipse(width/2, height/2, 50,60);
  
  strokeWeight(5);
  point(width/2, 300);
  strokeWeight(1);
  
  */
  
  
}
