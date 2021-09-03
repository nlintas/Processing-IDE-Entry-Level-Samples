import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

color GREEN = #11EA53;
color YELLOW = #F1F534;
color RED = #F70C20;
color BLUE = #130CF7;
color BLACK = #000000;
color WHITE = #FFFFFF;
color PINK = #FF4BD2;

Screen mainScreen;
Wall ground;
Wall left;
Wall right;
Wall top;
Paddle user;

//A reference to the box2d world
Box2DProcessing b2dWorld;

void setup() {
  size(1000, 600);
  //Do not write the line bellow//////////////////////
  surface.setLocation(4500-width, 100); //Do not write this line
  //Do not write the line above////////////////////////

  //STEP 1A 1/2 Add the box2d world to our simulation
  b2dWorld = new Box2DProcessing(this);
  b2dWorld.createWorld();
  b2dWorld.setGravity(0, -9.8);
  createMainScreen();
}

void draw() {
  background(BLUE);
  //STEP1B 2/2 update the physics world
  b2dWorld.step();

  mainScreen.step();
}

void createMainScreen() {
  mainScreen = new Screen();
  for(int i=0; i<14; i++){
    Brick temp = new Brick(70+65*i, int(0.2*height));
    mainScreen.register(temp);
  }
  ground = new Wall(width/2, height-3, width, 6);
  top = new Wall(width/2, 3, width, 6);
  left = new Wall(3, height/2, 6, height-12);
  right = new Wall(width-3, height/2, 6, height-12);
  mainScreen.register(ground);
  mainScreen.register(top);
  mainScreen.register(left);
  mainScreen.register(right);
  user = new Paddle(width/2, int(0.8*height));
  mainScreen.register(user);
}

//void mousePressed() {
//  Brick b = new Brick(mouseX, mouseY);
//  mainScreen.register(b);
//}

void keyPressed(){
  if(key == CODED){
    if( keyCode == LEFT){
      user.move(false);  
    }else if( keyCode == RIGHT){
      user.move(true);  
    }
  }
}

void keyReleased(){
  user.body.setLinearVelocity(new Vec2(0,0));
}
