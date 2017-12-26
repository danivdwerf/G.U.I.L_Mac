#import "FWindow.m"
#import "OBJCColour.m"
#import "OBJCMenuItem.m"
#import "OBJCMenu.m"
#import "OBJCMainMenu.m"

@interface OBJCWindow : NSObject
{
  FWindow* window;
  // NSMenu* mainMenu;
  // NSMutableArray* menuItems;
}
-(id)initWithTitle:(const char*)title xPos:(int)x yPos:(int)y width:(int)w height:(int)h;
-(void)createWindow:(const char*)title :(int)x :(int)y :(int)w :(int)h;
-(void)newFile:(id)sender;
@end

@implementation OBJCWindow
-(id)initWithTitle:(const char*)title xPos:(int)x yPos:(int)y width:(int)w height:(int)h
{
  if (!(self = [super init]))
    return nil;

  // [menuItems init];
  [self createWindow:title:x:y:w:h];
  return self;
}

-(void)newFile:(id)sender
{
  NSLog(@"Create new file pls");
}

-(void)createWindow:(const char*)title :(int)x :(int)y :(int)w :(int)h
{
  //Pool?
  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
  NSString* appTitle = [NSString stringWithUTF8String: title];

  //Main application
  NSApplication* application = [NSApplication sharedApplication];
  [NSApp setActivationPolicy: NSApplicationActivationPolicyRegular];
  [NSApp finishLaunching];

  //Main OBJCMenu
  OBJCMainMenu* mainMenu = [[OBJCMainMenu alloc] init];

  OBJCMenuItem* programItem = [[OBJCMenuItem alloc] init];
  [mainMenu addMenuItemToBar: programItem];

  OBJCMenu* programMenu = [[OBJCMenu alloc] init];
  [programItem setSubmenu:programMenu];

  OBJCMenuItem* quitItem = [[OBJCMenuItem alloc] initWithTitle:"Quit" action:@selector(terminate:) key:"q"];
  [programMenu addMenuItem:quitItem];

  // OBJCMenuItem* fileItem = [[OBJCMenuItem alloc] init];
  // [mainMenu addMenuItemToBar:fileItem];
  //
  // OBJCMenu* fileMenu = [[OBJCMenu alloc] initWithTitle:"File"];
  // [fileItem setSubmenu:fileMenu];
  //
  // OBJCMenuItem* newItem = [[OBJCMenuItem alloc] initWithTitle:"New" callback:newFile key:"n"];
  // [fileMenu addMenuItem:newItem];

  [NSApp setMainMenu:[mainMenu mainMenu]];

  NSRect frame = NSMakeRect(x, y, w, h);
  NSUInteger windowStyle = NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable;
  NSRect rect = [FWindow contentRectForFrameRect:frame styleMask:windowStyle];

  self->window = [[[FWindow alloc] initWithContentRect:rect styleMask:windowStyle backing:NSBackingStoreBuffered defer:NO] autorelease];
  [self->window makeKeyAndOrderFront: self->window];
  [self->window setTitle:appTitle];

  [self->window setBackgroundColor: [OBJCColour colourWithRedInt:200 green:77 blue:77 alpha:255]];

  NSWindowController* windowController = [[[NSWindowController alloc] initWithWindow:self->window] autorelease];

  // Close window
  // [self->window close];
  [self->window orderFrontRegardless];
  [pool drain];
}

-(void)run
{
  [NSApp run];
}
@end
