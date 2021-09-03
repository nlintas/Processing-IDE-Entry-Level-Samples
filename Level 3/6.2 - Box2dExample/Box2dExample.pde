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
ArrayList<Box> boxes;
Wall ground;

//A reference to the box2d world
Box2DProcessing b2dWorld;

void setup(){
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

void draw(){
  background(BLUE);
  //STEP1B 2/2 update the physics world
  b2dWorld.step();
  
  mainScreen.step();
}

void createMainScreen(){
  mainScreen = new Screen();
  boxes = new ArrayList<Box>();
  ground = new Wall(width/2, height-3, width, 6);
  mainScreen.register(ground);
}

void mousePressed(){
  Box b = new Box(mouseX, mouseY);
  mainScreen.register(b);
}
