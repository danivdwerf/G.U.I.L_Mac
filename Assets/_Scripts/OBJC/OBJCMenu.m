#import "Cocoa/Cocoa.h"
#import "OBJCMenuItem.m"

@class OBJCMenuItem;
@interface OBJCMenu : NSObject
{
  NSMenu* menuObject;
}
-(id)init;
-(id)initWithTitle:(const char*)title;
-(void)addMenuItem:(OBJCMenuItem*)itemToAdd;
-(NSMenu*)menu;
@end

@implementation OBJCMenu
-(id)init
{
  if(!(self = [super init]))
    return nil;

  self->menuObject = [[NSMenu alloc] autorelease];

  return self;
}

-(id)initWithTitle:(const char*)t
{
  if(!(self = [super init]))
    return nil;

  NSString* title = [NSString stringWithUTF8String: t];
  self->menuObject = [[NSMenu alloc] initWithTitle:title];

  return self;
}

-(void)addMenuItem:(OBJCMenuItem*)itemToAdd
{
  NSMenuItem* tmpItem = [itemToAdd menuItem];
  [self->menuObject addItem:tmpItem];
}

-(NSMenu*)menu{return self->menuObject;}
@end
