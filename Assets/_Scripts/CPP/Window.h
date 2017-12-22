#ifndef WINDOW_H
#define WINDOW_H

#import "../OBJC/OBJCWindow.m"
#include "../CPP/Colour.h"

class Window
{
  OBJCWindow* window;

  public: Window(const char* title, int x, int y, int w, int h)
  {
    this->window = [[OBJCWindow alloc] initWithTitle:title xPos:x yPos:y width:w height:h];
  }

  public: void setBackgroundColor(Colour* colour)
  {
    [this->window setBackgroundColor: colour->Wrapped()];
  }

  public: void run()
  {
    [this->window run];
  }
};
#endif
