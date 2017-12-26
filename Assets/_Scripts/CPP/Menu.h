#ifndef MENU_H
#define MENU_H
#include "MenuItem.h"

class Menu
{
  private: OBJCMenu* wrapped;
  public: OBJCMenu* Object(){return this->wrapped;}

  public: Menu()
  {
    this->wrapped = [[OBJCMenu alloc] init];
  }

  public: Menu(const char* title)
  {
    this->wrapped = [[OBJCMenu alloc] initWithTitle:title];
  }

  public: void addMenuItem(MenuItem* itemToAdd)
  {
    [this->wrapped addMenuItem:itemToAdd->Object()];
  }
};
#endif
