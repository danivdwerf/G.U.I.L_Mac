#include "MenuItem.h"
#include "Menu.h"
OBJCMenu* Menu::Object(){return this->wrapped;}

Menu::Menu()
{
  this->wrapped = [[OBJCMenu alloc] init];
}
Menu::Menu(const char* title)
{
  this->wrapped = [[OBJCMenu alloc] initWithTitle:title];
}
void Menu::addMenuItem(MenuItem* itemToAdd)
{
  [this->wrapped addMenuItem:itemToAdd->Object()];
}
