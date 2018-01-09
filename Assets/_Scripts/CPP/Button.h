#ifndef BUTTON_H
#define BUTTON_H
#include "Window.h"
#include "GRect.h"

#define STANDARD_BUTTON 0 //Standard button 0
#define PUSH_ONOFF_BUTTON (1<<0) //Does Apple even read their own API? 1
#define TOGGLE_BUTTON (1<<1) //Toggle button 2
#define SWITCH_BUTTON (1<<0) | (1<<1) //Toggle button but actually works 3
#define RADIO_BUTTON (1<<2) //Radio Button 4
#define MOMENTARY_CHANGE_BUTTON (1<<2) | (1<<0) //No completely sure 5
#define ON_OFF_BUTTON (1<<2) | (1<<1) //Pretty sure it does nothing 6
#define MOMENTARY_PUSH_IN_BUTTON (1<<2) | (1<<1) | (1<<0) //Not Sure 7
#define ACCELERATOR_BUTTON (1<<3) //Not sure 8
#define MULTILEVEL_ACCELERATOR_BUTTON (1<<3) | (1<<0) //Not sure 9

class Button
{
  private: OBJCButton* wrapped;
  public: OBJCButton* Object()const{return this->wrapped;}

  public: int8_t Type()const{return [wrapped Type];}
  public: bool Value()const{return [wrapped Value];}

  public: Button(const char* t, int x, int y, int w, int h, int8_t type, void(*c)()){this->wrapped = [[OBJCButton alloc] initWithTitle:t xPos:x yPos:y width:w height:h type:type callback:c];}
  public: Button(const char* t, GRect* rect, int8_t type, void(*c)()){this->wrapped = [[OBJCButton alloc] initWithTitle:t frame:rect->Object() type:type callback:c];}
  public: Button(const char* path, int x, int y, int8_t t, void(*c)()){this->wrapped = [[OBJCButton alloc] initWithImagePath:path xPos:x yPos:y type:t callback:c];}
  public: void show(Window* window){[this->wrapped show:[window->Object() Object]];}
};
#endif
