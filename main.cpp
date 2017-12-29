#include <iostream>
#include "Assets/_Scripts/CPP/Window.h"
#include "Assets/_Scripts/CPP/Menu.h"
#include "Assets/_Scripts/CPP/MenuItem.h"
#include "Assets/_Scripts/CPP/MainMenu.h"
#include "Assets/_Scripts/CPP/Button.h"

void callback()
{
    std::cout << "callback called" << '\n';
}

int main(int argc, char* argv[])
{
  Window* window = new Window("Hoppakee", 0, 0, 640, 360);

  MenuItem* fileItem = new MenuItem();
  Menu* fileMenu = new Menu("File");
  fileItem->setSubmenu(fileMenu);

  MenuItem* stopMenu = new MenuItem("STOP!", callback, "s");
  fileMenu->addMenuItem(stopMenu->Object());
  window->addMenu(fileItem->Object());

  Button* btn = new Button("FLOP", 100, 100, 100, 50, callback);
  btn->show(window);

  window->run();
  return 0;
}
