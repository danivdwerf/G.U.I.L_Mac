#ifndef MAINMENU_H
#define MAINMENU_H
#include "MenuItem.h"

class MainMenu
{
  private: OBJCMainMenu* wrapped;
  public: OBJCMainMenu* Object(){return this->wrapped;}

  public: MainMenu()
  {
    this->wrapped = [[OBJCMainMenu alloc] init];
  }

  public: void addMenuItemToBar(MenuItem* menuToAdd)
  {
    [this->wrapped addMenuItemToBar: menuToAdd->Object()];
  }
};
#endif
