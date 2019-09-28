class SnowFlake
{
  float vel;
  PVector p;
  color c;
  int delay;
  float wind;
  
  SnowFlake(int x, int y, color colorValue)
  {
    p = new PVector(x, y);
    vel = random(0.1, 2);
    c = colorValue;
    delay = height-y;
    delay = y;
    wind = random(-1.2, 1.2);
  }
  
  int getIndex()
  {
    return (int)p.y * width + (int)p.x;
  }
  
  void update()
  {
    if(vel == 0) return;
    if(delay != 0)
    {
      delay--;
      return;
    }
    
    p.x += wind;
    if(p.x < 0) p.x = 0;
    else if(p.x > width) p.x = width - 1;
    
    int ix = (int) p.x;
    
    vel += vel * .1;
    p.y += vel; //<>//
    if(p.y > snow[ix])
    {
      snow[ix] -= random(0,.2);
      p.y = snow[ix];
      vel = 0;
      c = color(255);
      deadCount--;
    }
  }
 
}
