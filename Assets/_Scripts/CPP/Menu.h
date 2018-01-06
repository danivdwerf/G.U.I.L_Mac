#ifndef MENU_H
#define MENU_H

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

  public: void addMenuItem(OBJCMenuItem* itemToAdd)
  {
    [this->wrapped addMenuItem:itemToAdd];
  }
};
#endif
