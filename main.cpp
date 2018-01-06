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
  Window* window = new Window("Hoppakee", 0, 0, 640, 360, WINDOWSTYLE_TITLED | WINDOWSTYLE_CLOSABLE | WINDOWSTYLE_RESIZABLE);

  MenuItem* fileItem = new MenuItem();
  window->addMenu(fileItem->Object());

  Menu* fileMenu = new Menu("File");
  fileItem->setSubmenu(fileMenu);

  MenuItem* stopMenu = new MenuItem("New", createFile, "n");
  fileMenu->addMenuItem(stopMenu->Object());

  Button* btn = new Button("YAYY", 5, 5, 100, 30, callback);
  btn->show(window);

  window->run();
  return 0;
}
