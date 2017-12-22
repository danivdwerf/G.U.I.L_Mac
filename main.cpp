#include <iostream>
#include "includes/Window.h"
// #include "includes/Menu.mm"

void showAss()
{
    std::cout << "Nice ass boi" << '\n';
}

int main(int argc, char* argv[])
{
  Window* window = new Window("Hoppakee", 0, 0, 640, 360);
  // Menu* assMenu = new Menu("STOP!", showAss, "a");
  // window->addMenu(assMenu);
  window->run();
  return 0;
}
