#ifndef WINDOW_H
#define WINDOW_H

#import "../OBJC/OBJCWindow.m"
#import "../OBJC/OBJCOpenGLWindow.m"
#include "../CPP/Colour.h"

#define WINDOWSTYLE_BORDERLESS (0<<0) //Window without titlebar
#define WINDOWSTYLE_TITLED (1<<0) //Window with titlebar and title
#define WINDOWSTYLE_CLOSABLE (1<<1) //Display close button
#define WINDOWSTYLE_MINIATUIZABLE (1<<2) //Display minimize button
#define WINDOWSTYLE_RESIZABLE (1<<3) //Display fullscreen button and drag borders to scale
#define WINDOWSTYLE_UTILITY (1<<4) //I have no fucking clue
#define WINDOWSTYLE_DOCMODAL (1<<6) //Document modal window (somthing like a popup window)
#define WINDOWSTYLE_NONACTIVATINGPANEL (1<<7) //I have no fucking clue
#define WINDOWSTYLE_TEXTUREDBACKGROUND (1<<8) //I have no fucking clue
#define WINDOWSTYLE_UNIFIEDTITLEANDTOOLBAR (1<<12) //I have no fucking clue
#define WINDOWSTYLE_HUD (1<<13) //I have no fucking clue
#define WINDOWSTYLE_FULLSCREEN (1<<14) //I have no fucking clue
#define WINDOWSTYLE_FULLSIZECONTENTVIEW (1<<15) //I have no fucking clue

class Window
{
  private: OBJCOpenGLWindow* window;
  public: OBJCOpenGLWindow* Object()const{return this->window;}

  public: Window(const char* title, int x, int y, int w, int h, int16_t s)
  {
    this->window = [[OBJCOpenGLWindow alloc] initWithTitle:title xPos:x yPos:y width:w height:h style:s];
  }

  public: void setBackgroundColor(Colour* colour)
  {
    [this->window setBackgroundColor: colour->Wrapped()];
  }

  public: void addMenu(OBJCMenuItem* itemToAdd)
  {
    [this->window addMenu:itemToAdd];
  }

  public: void run()
  {
    [this->window run];
  }
};
#endif
