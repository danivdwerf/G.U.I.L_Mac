#ifndef BUTTON_H
#define BUTTON_H
#include "Window.h"

class Button
{
  private: OBJCButton* wrapped;
  public: OBJCButton* Object()const{return this->wrapped;}

  public: Button(const char* t, int x, int y, int w, int h, void(*c)())
  {
    this->wrapped = [[OBJCButton alloc] initWithTitle:t xPos:x yPos:y width:w height:h callback:c];
  }

  public: void show(Window* window)
  {
    [this->wrapped show:[window->Object() Object]];
  }
};
#endif
