#include <iostream>
#include "Assets/_Scripts/GUIL.h"

void callback()
{
  exit(0);
}

void createFile()
{
  std::cout << "Create A file" << '\n';
}

int main(int argc, char* argv[])
{
  Colour* bg = new Colour(0.3f, 0.3f, 0.3f, 1.0f);
  Window* window = new Window("Hoppakee", 0, 0, 640, 360, WINDOWSTYLE_TITLED | WINDOWSTYLE_CLOSABLE | WINDOWSTYLE_RESIZABLE);
  window->setBackgroundColor(bg);

  MenuItem* fileItem = new MenuItem();
  window->addMenu(fileItem->Object());

  Menu* fileMenu = new Menu("File");
  fileItem->setSubmenu(fileMenu);

  MenuItem* stopMenu = new MenuItem("New", createFile, "n");
  fileMenu->addMenuItem(stopMenu->Object());

  Button* btn = new Button("Close", 5, 5, 100, 30, callback);
  btn->show(window);

  window->run();
  return 0;
}
