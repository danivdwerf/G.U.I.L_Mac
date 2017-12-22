#import "Cocoa/Cocoa.h"

@interface Input : NSView
@end

@implementation Input
- (void)keyDown:(NSEvent *)e
{
    NSString* const character = [e charactersIgnoringModifiers];
    unichar const code = [character characterAtIndex:0];
    std::cout << "/* message */" << '\n';
}

- (void)mouseDown:(NSEvent *)e
{
  std::cout << "click" << '\n';
}
@end
