#ifndef WINDOW_H
#define WINDOW_H

#import "../OBJC/OBJCWindow.m"

class Window
{
  private: OBJCWindow* window;
  public: OBJCWindow* Object()const{return this->window;}

  public: Window(const char* title, int x, int y, int w, int h)
  {
    this->window = [[OBJCWindow alloc] initWithTitle:title xPos:x yPos:y width:w height:h];
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
