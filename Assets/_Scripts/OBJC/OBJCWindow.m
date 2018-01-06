#import "FWindow.m"
#import "OBJCColour.m"
#import "OBJCMenuItem.m"
#import "OBJCMenu.m"
#import "OBJCMainMenu.m"
#import "OBJCButton.m"

@interface OBJCWindow : NSObject
{
  FWindow* window;
  OBJCMainMenu* mainMenu;
}
-(id)initWithTitle:(const char*)title xPos:(int)x yPos:(int)y width:(int)w height:(int)h style:(int8_t)s;
-(void)addMenu:(OBJCMenuItem*)itemToAdd;
-(FWindow*)Object;
@end

@implementation OBJCWindow
-(id)initWithTitle:(const char*)title xPos:(int)x yPos:(int)y width:(int)w height:(int)h style:(int8_t)s
{
  if (!(self = [super init]))
    return nil;

  //Pool?
  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
  NSString* appTitle = [NSString stringWithUTF8String:title];

  //Main application
  NSApplication* application = [NSApplication sharedApplication];
  [NSApp setActivationPolicy: NSApplicationActivationPolicyRegular];
  [NSApp finishLaunching];

  //Main OBJCMenu
  self->mainMenu = [[OBJCMainMenu alloc] init];

  OBJCMenuItem* programItem = [[OBJCMenuItem alloc] init];
  [self->mainMenu addMenuItemToBar: programItem];

  OBJCMenu* programMenu = [[OBJCMenu alloc] init];
  [programItem setSubmenu:programMenu];

  OBJCMenuItem* quitItem = [[OBJCMenuItem alloc] initWithTitle:"Quit" action:@selector(terminate:) key:"q"];
  [programMenu addMenuItem:quitItem];

  [NSApp setMainMenu:[self->mainMenu mainMenu]];


  NSRect frame = NSMakeRect(x, y, w, h);
  NSRect rect = [FWindow contentRectForFrameRect:frame styleMask:s];

  // NSLog(@"%i", NSWindowStyleMaskBorderless);

  self->window = [[[FWindow alloc] initWithContentRect:rect styleMask:s backing:NSBackingStoreBuffered defer:NO] autorelease];
  [self->window makeKeyAndOrderFront: self->window];
  [self->window setTitle:appTitle];

  [self->window setBackgroundColor: [OBJCColour colourWithRedInt:200 green:77 blue:77 alpha:255]];

  NSWindowController* windowController = [[[NSWindowController alloc] initWithWindow:self->window] autorelease];

  // Close window
  // [self->window close];
  [self->window orderFrontRegardless];
  [pool drain];

  return self;
}

-(FWindow*)Object
{
  return self->window;
}

-(void)setBackgroundColor:(NSColor*)colour
{
  [self->window setBackgroundColor: colour];
}

-(void)addMenu:(OBJCMenuItem*)itemToAdd
{
  [self->mainMenu addMenuItemToBar: itemToAdd];
}

-(void)run
{
  [NSApp run];
}
@end
