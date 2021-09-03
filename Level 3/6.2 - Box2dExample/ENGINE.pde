abstract class Being{
  PVector location;
  Shape shape;
  
  Being(Shape s){
    location = s.position;
    shape = s;
  }
  
  abstract void step();
  abstract void drawme();
}

//////////////////////////////////

abstract class Shape {
  PVector position;

  Shape(PVector hdlr) {
    position = hdlr;
  }

  abstract boolean collides(Shape other);
  abstract boolean contains(PVector point);
}

//////////////////////////////////

class Circle extends Shape {
  float radius;

  Circle(PVector center, float r) {
    super(center);
    radius = r;
  }

  boolean collides(Shape other) {
    if (other instanceof Circle) {
      boolean result=false;
      float d = dist(this.position.x, this.position.y, other.position.x, other.position.y);
      if (d<=this.radius+((Circle) other).radius) result = true;
      return result;
    } else if (other instanceof Rectangle) {
      float cx = this.position.x;
      float cy = this.position.y;

      float rx = other.position.x-((Rectangle) other).rw/2;
      float ry = other.position.y-((Rectangle) other).rh/2;
      float rw = ((Rectangle) other).rw;
      float rh = ((Rectangle) other).rh;

      // temporary variables to set edges for testing
      float testX = cx;
      float testY = cy;

      // which edge is closest?
      if (cx < rx)         testX = rx;      // test left edge
      else if (cx > rx+rw) testX = rx+rw;   // right edge
      if (cy < ry)         testY = ry;      // top edge
      else if (cy > ry+rh) testY = ry+rh;   // bottom edge

      // get distance from closest edges
      float distX = cx-testX;
      float distY = cy-testY;
      float distance = sqrt( (distX*distX) + (distY*distY) );

      // if the distance is less than the radius, collision!
      if (distance <= radius) {
        return true;
      }
      return false;
    }
    return true;
  }

  boolean contains(PVector point) {
    boolean result=false;
    float d = dist(this.position.x, this.position.y, point.x, point.y);
    if (d<=this.radius) result = true;
    return result;
  }
}
//////////////////////////////////////

class Rectangle extends Shape {
  int rw, rh;

  Rectangle(PVector center, int w, int h) {
    super(center);
    rw = w;
    rh = h;
  }

  boolean collides(Shape other) {
    if (other instanceof Rectangle) {
      float r1x = this.position.x-rw/2;
      float r1y = this.position.y-rh/2;
      float r1w = this.rw;
      float r1h = this.rh;

      float r2x = other.position.x-((Rectangle) other).rw/2;
      float r2y = other.position.y-((Rectangle) other).rh/2;
      float r2w = ((Rectangle) other).rw;
      float r2h = ((Rectangle) other).rh;

      if (r1x + r1w >= r2x &&    // r1 right edge past r2 left
        r1x <= r2x + r2w &&    // r1 left edge past r2 right
        r1y + r1h >= r2y &&    // r1 top edge past r2 bottom
        r1y <= r2y + r2h) {    // r1 bottom edge past r2 top
        return true;
      }
      return false;
    } else if (other instanceof Circle) {
      return other.collides(this);
    }
    return true;
  }

  boolean contains(PVector point) {
    float rx = this.position.x-rw/2;
    float ry = this.position.y-rh/2;
    return (point.x>=rx && point.x<=rx+rw && 
            point.y>=ry && point.y<=ry+rh);
  }
}
////////////////////////////////////

class TextBeing extends Being{
  protected String text;
  protected color col;
  protected int size;
 
  TextBeing(String t, color c, int s, int x, int y){
    super(new Rectangle(new PVector(x,y),s,s));
    text = t;
    col = c;
    size = s;
    textSize(s);
    ((Rectangle)shape).rw =int(textWidth(t));
    //TODO update the shape coordinates
  }
  
  void step(){
  }
  
  void setText(String s){
    text = s;  
  }
  
  void drawme(){
    fill(col);
    textAlign(CENTER,CENTER);
    textSize(size);
    text(text, location.x, location.y);
  }
}

////////////////////////////////////

abstract class ButtonBeing extends TextBeing {
  color fillColor;

  ButtonBeing(String t, color tc, color fc, int s, int x, int y) {
    super(t, tc, s, x, y);
    ((Rectangle) shape).rw +=50;
    ((Rectangle) shape).rh +=20;
    fillColor = fc;
  }

  void drawme() {
    fill(fillColor);
    rectMode(CENTER);
    rect(location.x, location.y, ((Rectangle) shape).rw, ((Rectangle) shape).rh);  
    super.drawme();
  }

  abstract void act();

  void step() {
    //if my shape contains the mouse coordinates AND
    //the mouse is pressed call the method act()
    if (mousePressed && ((Rectangle)shape).contains(new PVector(mouseX, mouseY))) {
      act();
    }
  }
}
///////////////////////////////////////

class Group<B extends Being> {
  private ArrayList<B> collection;  
  private Screen owner;
  
  Group(Screen s){
    owner = s;
    collection = new ArrayList<B>();
  }

  //add to the collection
  void add(B b) {
    collection.add(b);
    if(!owner.contains(b)){
      owner.register(b);
    }
  }

  //remove
  void remove(B b) {
    collection.remove(b);
  }

  //get(index)
  B get(int i) {
    return collection.get(i);
  }

  //getIndex: index of smth in the collection
  int getIndex(B b) {
    return collection.indexOf(b);
  }

  //size
  int size() {
    return collection.size();
  }
}
////////////////////////////////////

abstract class Interactor<A extends Being, B extends Being>{
  
  Interactor(){
  }
   
  abstract boolean detect(A being1, B being2);
  abstract void resolve(A being1, B being2);
}
/////////////////////////////////////////////
class Interaction<A extends Being, B extends Being>{
  Group<A> group1;
  Group<B> group2;
  Interactor<A, B> interactor;
  
  Interaction(Group<A> g1, Group<B> g2, Interactor<A,B> inter){
    group1 = g1;
    group2 = g2;
    interactor = inter;
  }
}
////////////////////////////////////////
class Screen{
  //all the beings the screen is responsible for (drawing and updating)
  protected ArrayList<Being> beingCollection; 
  protected ArrayList<Interaction> interactions;
  //the beings that we care about interactions
  protected ArrayList<Group> groupCollection;
  
  Screen(){
    beingCollection = new ArrayList<Being>();
    interactions = new ArrayList<Interaction>();
    groupCollection = new ArrayList<Group>();
  }
  
  boolean contains(Being b){
    return beingCollection.contains(b);  
  }
  
  void step(){
    //1. draw every being in my colection
    for(int i=0; i<beingCollection.size(); i++){
      beingCollection.get(i).step();
      beingCollection.get(i).drawme();
    }
    //2. detect resolve every interaction in my collection
    //2.1 for every interaction registered
    for(int i=0; i<interactions.size(); i++){
      Group g1 = interactions.get(i).group1;
      Group g2 = interactions.get(i).group2;
      Interactor inter = interactions.get(i).interactor;
      //2.2 for every being in group1 of the interaction
      for(int b1=0; b1<g1.size(); b1++){
        //2.3 for every being in group 2 of the interaction
        for(int b2=0; b2<g2.size(); b2++){
          //2.4 detect and resolve
          if(g1.get(b1) != g2.get(b2) && inter.detect(g1.get(b1),g2.get(b2))){
            inter.resolve(g1.get(b1),g2.get(b2));  
          }
        }
      }
    }
  }
  
  void register(Being b){
    beingCollection.add(b);
  }
  
  void register(Group g1, Group g2, Interactor i){
    interactions.add(new Interaction(g1, g2, i));
  }
  
  void register(Being b, Group g, Interactor i){
    Group dummy = new Group(this);
    dummy.add(b);
    register(dummy, g, i);
  }
  
  void register(Group g, Being b, Interactor i){
    Group dummy = new Group(this);
    dummy.add(b);
    register(dummy, g, i);
  }
  
  void register(Being b1, Being b2, Interactor i){
    Group dummy1 = new Group(this);
    dummy1.add(b1);
    Group dummy2 = new Group(this);
    dummy2.add(b2);
    register(dummy1, dummy2, i);
  }
  
  void delete(Being b){
    beingCollection.remove(b);
    for(int i=groupCollection.size()-1; i>=0; i--){
      Group g = groupCollection.get(i);
      for(int j=g.size(); j>=0; j--){
        if(b.equals(g.get(j))){
          g.remove(b);  
        }
      }
    }
  }

}
