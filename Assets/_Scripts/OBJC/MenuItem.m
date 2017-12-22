#import "Cocoa/Cocoa.h"
@interface MenuItem : NSObject
{
  NSMenuItem* menuObject;
}
-(id)initWithTitle:(const char*)t action:(SEL)callback key:(const char*)k;
-(NSMenuItem*)Object;
@end

@implementation MenuItem
-(id)initWithTitle:(const char*)t action:(SEL)callback key:(const char*)k
{
  if(!(self = [super init]))
    return nil;

  NSString* title = [NSString stringWithUTF8String:t];
  NSString* key = [NSString stringWithUTF8String:k];
  self->menuObject = [[[NSMenuItem alloc] initWithTitle:title action:callback keyEquivalent:key] autorelease];

  return self;
}

-(NSMenuItem*)Object{return self->menuObject;}
@end
