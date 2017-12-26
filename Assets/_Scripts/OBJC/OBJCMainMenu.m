#import "Cocoa/Cocoa.h"
#import "OBJCMenuItem.m"

@interface OBJCMainMenu : NSObject
{
  NSMenu* menuObject;
}

-(id)init;
-(NSMenu*)mainMenu;
-(void)addMenuItemToBar:(OBJCMenuItem*)menuToAdd;
@end

@implementation OBJCMainMenu

-(id)init
{
  if(!(self = [super init]))
    return nil;

  self->menuObject = [[NSMenu new] autorelease];
  return self;
}

-(NSMenu*)mainMenu{return self->menuObject;}

-(void)addMenuItemToBar:(OBJCMenuItem*)menuToAdd
{
  [self->menuObject addItem:[menuToAdd menuItem]];
}
@end
