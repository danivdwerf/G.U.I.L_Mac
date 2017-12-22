#ifndef MENU_H
#define MENU_H

#import "Cocoa/Cocoa.h"

class Menu
{
  private: NSMenuItem* object;
  public: NSMenuItem* Object(){return this->object;}

  public: Menu(const char* title, void(*c)(), const char* key)
  {
    NSString* nsTitle = [NSString stringWithUTF8String:title];
    NSString* charCode = [NSString stringWithUTF8String:key];

    this->object = [[[NSMenuItem alloc] initWithTitle:nsTitle action:@selector(c) keyEquivalent:charCode] autorelease];
  }
};
#endif
