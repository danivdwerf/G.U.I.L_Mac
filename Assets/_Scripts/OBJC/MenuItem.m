#import "Cocoa/Cocoa.h"
#import "Menu.m"

@interface MenuItem : NSObject
{
  NSMenuItem* menuObject;
}
-(id)init;
-(id)initWithTitle:(const char*)t action:(SEL)callback key:(const char*)k;
-(void)setSubmenu:(Menu*)m;
-(NSMenuItem*)menuItem;
@end

@implementation MenuItem
-(id)init
{
  if(!(self = [super init]))
    return nil;

  self->menuObject = [[NSMenuItem alloc] autorelease];
  return self;
}

-(id)initWithTitle:(const char*)t action:(SEL)callback key:(const char*)k
{
  if(!(self = [super init]))
    return nil;

  NSString* title = [NSString stringWithUTF8String:t];
  NSString* key = [NSString stringWithUTF8String:k];
  self->menuObject = [[[NSMenuItem alloc] initWithTitle:title action:callback keyEquivalent:key] autorelease];

  return self;
}

-(void)setSubmenu:(Menu*)m
{
  [self->menuObject setSubmenu:[m menu]];
}

-(NSMenuItem*)menuItem{return self->menuObject;}
@end
