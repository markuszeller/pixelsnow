class Textline
{
  void line(String text, int fontSize, int y)
  {
    PFont font;

    font = createFont(fontName, fontSize);
    textFont(font);
    textAlign(LEFT);
    tw = textWidth(text);
    text(text, cx-tw/2, y, width, height);
  }
  
}
