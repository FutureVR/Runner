class Obstacle extends Element
{
  Obstacle(float w, float h)
  {
    super(w, h); 
    symbol = 'o';
  }
  
  void display(float x, float y)
  {
    fill(0);
    stroke(0);
    rect(x, y, myWidth, -myHeight);
  }
}