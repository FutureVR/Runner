class Walkway extends Element
{
  Walkway(float w, float h)
  {
    super(w, h);
    symbol = 'w';
  }
  
  void display(float x, float y)
  {
    fill(0);
    stroke(0);
    rect(x, y, myWidth, -myHeight);
  }
}