#include "Menu.h"
#include "MenuItem.h"

OBJCMenuItem* MenuItem::Object(){return this->wrapped;}
MenuItem::MenuItem()
{
  this->wrapped = [[OBJCMenuItem alloc] init];
}
MenuItem::MenuItem(const char* title, void(*c)(), const char* k)
{
  this->wrapped = [[OBJCMenuItem alloc] initWithTitle:title callback:c key:k];
}
void MenuItem::setSubmenu(Menu* menu)
{
  [this->wrapped setSubmenu:menu->Object()];
}
