#ifndef BUTTON_H
#define BUTTON_H
#include "Window.h"
#include "GRect.h"

class Button
{
  private: OBJCButton* wrapped;
  public: OBJCButton* Object()const{return this->wrapped;}

  public: Button(const char* t, int x, int y, int w, int h, void(*c)())
  {
    this->wrapped = [[OBJCButton alloc] initWithTitle:t xPos:x yPos:y width:w height:h callback:c];
  }

  public: Button(const char* t, GRect* rect, void(*c)())
  {
    this->wrapped = [[OBJCButton alloc] initWithTitle:t frame:rect->Object() callback:c];
  }

  public: Button(const char* path, int x, int y, void(*c)())
  {
    this->wrapped = [[OBJCButton alloc] initWithImagePath:path xPos:x yPos:y callback:c];
  }

  public: void show(Window* window)
  {
    [this->wrapped show:[window->Object() Object]];
  }
};
#endif
