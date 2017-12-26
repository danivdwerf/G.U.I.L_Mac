#import "Cocoa/Cocoa.h"
#import "OBJCMenu.m"

@interface OBJCMenuItem : NSObject
{
  NSMenuItem* menuObject;
  void(*callback)();
}
-(id)init;
-(id)initWithTitle:(const char*)t action:(SEL)sel key:(const char*)k;
-(id)initWithTitle:(const char*)t callback:(void(*)())c key:(const char*)k;
-(void)setSubmenu:(OBJCMenu*)m;
-(void)onClick:(id)sender;
-(NSMenuItem*)menuItem;
@end

@implementation OBJCMenuItem
-(id)init
{
  if(!(self = [super init]))
    return nil;

  self->menuObject = [[NSMenuItem alloc] autorelease];
  return self;
}

-(id)initWithTitle:(const char*)t action:(SEL)sel key:(const char*)k
{
  if(!(self = [super init]))
    return nil;

  NSString* title = [NSString stringWithUTF8String:t];
  NSString* key = [NSString stringWithUTF8String:k];
  self->menuObject = [[[NSMenuItem alloc] initWithTitle:title action:sel keyEquivalent:key] autorelease];
  return self;
}

-(id)initWithTitle:(const char*)t callback:(void(*)())c key:(const char*)k
{
  if(!(self = [super init]))
    return nil;

  NSString* title = [NSString stringWithUTF8String:t];
  NSString* key = [NSString stringWithUTF8String:k];
  self->callback = c;
  SEL sel = @selector(onClick:);
  self->menuObject = [[[NSMenuItem alloc] initWithTitle:title action:sel keyEquivalent:key] autorelease];
  [self->menuObject setTarget:self];

  return self;
}

-(void)onClick:(id)sender
{
  NSLog(@"Clicked");
  if(self->callback == NULL)
    return;

  self->callback();
}

-(void)setSubmenu:(OBJCMenu*)m
{
  [self->menuObject setSubmenu:[m menu]];
}

-(NSMenuItem*)menuItem{return self->menuObject;}
@end
