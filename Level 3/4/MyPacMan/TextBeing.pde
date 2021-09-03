class TextBeing extends Being{
  protected String text;
  protected color col;
  protected int size;
 
  TextBeing(String t, color c, int s, int x, int y){
    super(new Rectangle(new PVector(x-textWidth(t)/2,y-s/2),int(textWidth(t)),s));
    text = t;
    col = c;
    size = s;
    //TODO update the shape coordinates
  }
  
  void step(){
  }
  
  void setText(String s){
    text = s;  
  }
  
  void drawme(){
    fill(col);
    textMode(CENTER);
    textSize(size);
    text(text, location.x, location.y);
  }
}
