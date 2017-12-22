#include <iostream>
#include "Assets/_Scripts/CPP/Window.h"
// #include "includes/Menu.mm"

void callback()
{
    std::cout << "callback called" << '\n';
}

int main(int argc, char* argv[])
{
  Window* window = new Window("Hoppakee", 0, 0, 640, 360);
  // Menu* testMenu = new Menu("STOP!", callbackc, "a");
  // window->addMenu(testMenu);
  window->run();
  return 0;
}
