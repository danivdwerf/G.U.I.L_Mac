#import "Cocoa/Cocoa.h"
#import "MenuItem.m"
@interface Menu : NSObject
{
  NSMenu* menuObject;
  NSMutableArray* menuItems;
}
-(id)init;
-(void)addMenuItem:(MenuItem*)itemToAdd;
-(NSMenu*)Object;
@end

@implementation Menu
-(id)init
{
  if(!(self = [super init]))
    return nil;

  self->menuObject = [[NSMenu new] autorelease];

  return self;
}

-(void)addMenuItem:(MenuItem*)itemToAdd
{
  NSMenuItem* tmpItem = [itemToAdd Object];
  [self->menuObject addItem:tmpItem];
  [self->menuItems addObject:tmpItem];
}

-(NSMenu*)Object{return self->menuObject;}
@end
