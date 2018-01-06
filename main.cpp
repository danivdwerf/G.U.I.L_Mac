#include <iostream>
#include "Assets/_Scripts/CPP/Window.h"
#include "Assets/_Scripts/CPP/Menu.h"
#include "Assets/_Scripts/CPP/MenuItem.h"
#include "Assets/_Scripts/CPP/MainMenu.h"
#include "Assets/_Scripts/CPP/GRect.h"
#include "Assets/_Scripts/CPP/Button.h"

void callback()
{
    std::cout << "FLOTS!" << '\n';
}

void createFile()
{
  std::cout << "Create A file" << '\n';
}

int main(int argc, char* argv[])
{
  Window* window = new Window("Hoppakee", 0, 0, 640, 360, WINDOWSTYLE_TITLED | WINDOWSTYLE_CLOSABLE | WINDOWSTYLE_RESIZABLE);

  MenuItem* fileItem = new MenuItem();
  window->addMenu(fileItem->Object());

  Menu* fileMenu = new Menu("File");
  fileItem->setSubmenu(fileMenu);

  MenuItem* stopMenu = new MenuItem("New", createFile, "n");
  fileMenu->addMenuItem(stopMenu->Object());

  Button* btn2 = new Button("/Users/danivanderwerf/Documents/Personal/converter/images/logo.png", 5, 5, callback);
  btn2->show(window);

  window->run();
  return 0;
}
