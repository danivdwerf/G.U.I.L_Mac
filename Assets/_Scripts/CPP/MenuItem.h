#ifndef MENUITEM_H
#define MENUITEM_H

class MenuItem
{
  private: OBJCMenuItem* wrapped;
  public: OBJCMenuItem* Object(){return this->wrapped;}

  public: MenuItem()
  {
    this->wrapped = [[OBJCMenuItem alloc] init];
  }

  public: MenuItem(const char* title, void(*c)(), const char* k)
  {
    this->wrapped = [[OBJCMenuItem alloc] initWithTitle:title callback:c key:k];
  }

  public: void setSubmenu(Menu* menu)
  {
    [this->wrapped setSubmenu:menu->Object()];
  }
};

#endif
