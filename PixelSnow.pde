String fontName = "Arimoto";

boolean saveImageSequence = false;

float tw, th;
float cx, cy;
float snow[];
ArrayList<SnowFlake> snowFlakes;
int deadCount;

void setup()
{
  size(1280, 720);
  cx = width / 2;
  cy = height / 2;
  background(0);

  snow = new float[1280];
  for(int i = 0; i < width; i++)
  {
    snow[i] = height - 1;
  }
  
  Textline textline = new Textline();
  textline.line("HAPPY NEW YEAR", 100, 0);
  textline.line("and the very best wishes", 80, 100);
  textline.line("2019", 500, 100);
  
  snowFlakes = new ArrayList<SnowFlake>();
  loadPixels();
  for(int y = height-1; y >= 0; y--)
  {
    for(int x = 0; x < width; x++)
    {
      int index = x + y * width;
      if(brightness(pixels[index]) > 0)
      {
        snowFlakes.add(new SnowFlake(x, y, pixels[index]));
      }
    }
  }
  deadCount = snowFlakes.size();
  println("Bullets: " + deadCount);
  background(0);
  frameRate(30);
}

void draw()
{
  clearPixels();  
  for(SnowFlake bullet : snowFlakes)
  {
    pixels[bullet.getIndex()] = bullet.c;
    bullet.update();
  }   
  updatePixels();
  if(deadCount == 0) noLoop();
  if(saveImageSequence) saveFrame("data/screen-#####.tif");
  
}

void clearPixels()
{
  int i = width * height - 1;
  while(i > 0)
  {
    pixels[i--] = color(0);
  }
}
