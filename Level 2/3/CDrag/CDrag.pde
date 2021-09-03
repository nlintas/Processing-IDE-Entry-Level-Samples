ForceMover[] m;
Liquid l;
final color blue = color(25, 25, 112);
final color pink = color(255, 182, 193);

PVector wind;
PVector gravity;
//friction lowers the power of the balls
PVector friction;
float frictionCoef = 0.01;
float normalForce = 1;

void settings() {
  size(1000, 600);
}

void setup() {
  m= new ForceMover[20];
  for(int i=0; i<20; i++){
    m[i] = new ForceMover((i+1)*width/(m.length+1), 10);
  }
  gravity = new PVector(0, 0.1);
  l = new Liquid(0, height/2, width, height/2, 0.1);
}

void draw() 
{
  background(blue);
  l.display();
  //wind = new PVector(0.01, 0);
  for(int i=0; i<m.length; i++)
  {
    //calculated contiously
    friction = m[i].velocity.copy();
    //changes the vector to magnitude = 1.
    friction.normalize();  
    //reverse the direction
    friction.mult(-1);
    friction.mult(frictionCoef * normalForce);
    m[i].applyForce(friction);
    
    gravity= new PVector(0, 0.1*m[i].mass);
    m[i].applyForce(gravity);
    if(l.contains(m[i])
    {
      m[i].applyForce(l.drag(m[i]));
    }
    } m[i].applyForce(wi;
    m[i].step();
    m[i].bounceOnEdges();
    m[i].display();
  }
}
