#ifndef GRECT_H
#define GRECT_H
class GRect
{
  private: NSRect rect;
  public: NSRect Object(){return this->rect;}

  public: GRect(int x, int y, int w, int h)
  {
    this->rect = NSMakeRect(x, y, w, h);
  }
};
#endif
