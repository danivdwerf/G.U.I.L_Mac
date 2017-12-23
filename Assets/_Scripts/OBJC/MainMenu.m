#import "Cocoa/Cocoa.h"
#import "MenuItem.m"

@interface MainMenu : NSObject
{
  NSMenu* menuObject;
}

-(id)init;
-(NSMenu*)mainMenu;
-(void)addMenuItemToBar:(MenuItem*)menuToAdd;
@end

@implementation MainMenu

-(id)init
{
  if(!(self = [super init]))
    return nil;

  self->menuObject = [[NSMenu new] autorelease];
  return self;
}

-(NSMenu*)mainMenu{return self->menuObject;}

-(void)addMenuItemToBar:(MenuItem*)menuToAdd
{
  [self->menuObject addItem:[menuToAdd menuItem]];
}
@end
