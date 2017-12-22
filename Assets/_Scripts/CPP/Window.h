#ifndef WINDOW_H
#define WINDOW_H

#import "OBJCWindow.m"

class Window
{
  OBJCWindow* window;

  public: Window(const char* title, int x, int y, int w, int h)
  {
    this->window = [[OBJCWindow alloc] init:title:x:y:w:h];
  }

  public: void run()
  {
    [this->window run];
  }
};
#endif
