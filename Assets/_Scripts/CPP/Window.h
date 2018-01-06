#ifndef WINDOW_H
#define WINDOW_H

#import "../OBJC/OBJCWindow.m"
#include "../CPP/Colour.h"
#define WINDOWSTYLE_BORDERLESS (0<<0);
#define WINDOWSTYLE_TITLED (1<<0)
#define WINDOWSTYLE_CLOSABLE (1<<1)
#define WINDOWSTYLE_RESIZABLE (1<<3)

class Window
{
  private: OBJCWindow* window;
  public: OBJCWindow* Object()const{return this->window;}

  public: Window(const char* title, int x, int y, int w, int h, int8_t s)
  {
    this->window = [[OBJCWindow alloc] initWithTitle:title xPos:x yPos:y width:w height:h style:s];
  }

  public: void setBackgroundColor(Colour* colour)
  {
    [this->window setBackgroundColor: colour->Wrapped()];
  }
  
  public: void addMenu(OBJCMenuItem* itemToAdd)
  {
    [this->window addMenu:itemToAdd];
  }
  
  public: void run()
  {
    [this->window run];
  }
};
#endif
