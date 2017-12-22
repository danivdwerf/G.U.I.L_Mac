#import "Cocoa/Cocoa.h"

@interface FWindow : NSWindow
@end

@implementation FWindow

- (void)keyDown:(NSEvent *)e
{
    NSLog(@"%d", [e keyCode]);
}
@end
