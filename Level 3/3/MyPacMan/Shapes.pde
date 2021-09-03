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

      float rx = other.position.x;
      float ry = other.position.y;
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

  Rectangle(PVector corner, int w, int h) {
    super(corner);
    rw = w;
    rh = h;
  }

  boolean collides(Shape other) {
    if (other instanceof Rectangle) {
      float r1x = this.position.x;
      float r1y = this.position.y;
      float r1w = this.rw;
      float r1h = this.rh;

      float r2x = other.position.x;
      float r2y = other.position.y;
      float r2w = ((Rectangle) other).rw;
      float r2h = ((Rectangle) other).rh;

      if (r1x + r1w >= r2x &&    // r1 right edge past r2 left
        r1x <= r2x + r2w &&    // r1 left edge past r2 right
        r1y + r1h >= r2y &&    // r1 top edge past r2 bottom
        r1y <= r2y + r2h) {    // r1 bottom edge past r2 top
        return true;
      }
      return false;
    }else if(other instanceof Circle){
      return other.collides(this);
    }
    return true;
  }

  boolean contains(PVector point) {

    return true;
  }
}
