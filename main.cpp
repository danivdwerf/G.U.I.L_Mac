#include <iostream>
#include "Assets/_Scripts/CPP/Window.h"
#include "Assets/_Scripts/CPP/Colour.h"
// #include "includes/Menu.mm"

void callback()
{
    std::cout << "callback called" << '\n';
}

int main(int argc, char* argv[])
{
  Window* window = new Window("Hoppakee", 0, 0, 640, 360);
  Colour* bg = new Colour(0.3f, 0.3f, 0.3f, 1.0f);
  window->setBackgroundColor(bg);
  // Menu* testMenu = new Menu("STOP!", callbackc, "a");
  // window->addMenu(testMenu);
  window->run();
  return 0;
}
