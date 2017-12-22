#import "Cocoa/Cocoa.h"
#import "Menu.m"
@interface MainMenu : NSObject
{
  NSMenu* menuObject;
  NSMenuItem* menuHolder;
}

-(id)init;
-(NSMenu*)Object;
-(void)addMenuToBar:(Menu*)menuToAdd;
@end

@implementation MainMenu

-(id)init
{
  if(!(self = [super init]))
    return nil;

  self->menuObject = [[NSMenu new] autorelease];
  self->menuHolder = [[NSMenuItem new] autorelease];
  [self->menuObject addItem:self->menuHolder];
  return self;
}

-(NSMenu*)Object{return self->menuObject;}

-(void)addMenuToBar:(Menu*)menuToAdd
{
  [self->menuHolder setSubmenu:[menuToAdd Object]];
}
@end
