#import "FWindow.m"
#import "Colour.m"
#import "MenuItem.m"
#import "Menu.m"
#import "MainMenu.m"

@interface OBJCWindow : NSObject
{
  FWindow* window;
  // NSMenu* mainMenu;
  // NSMutableArray* menuItems;
}
-(id)initWithTitle:(const char*)title xPos:(int)x yPos:(int)y width:(int)w height:(int)h;
-(void)createWindow:(const char*)title :(int)x :(int)y :(int)w :(int)h;
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

-(void)createWindow:(const char*)title :(int)x :(int)y :(int)w :(int)h
{
  //Pool?
  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
  NSString* appTitle = [NSString stringWithUTF8String: title];

  //Main application
  NSApplication* application = [NSApplication sharedApplication];
  [NSApp setActivationPolicy: NSApplicationActivationPolicyRegular];
  [NSApp finishLaunching];

  //Main Menu
  MainMenu* mainMenu = [[MainMenu alloc] init];

  MenuItem* programItem = [[MenuItem alloc] init];
  [mainMenu addMenuItemToBar: programItem];

  Menu* programMenu = [[Menu alloc] init];
  [programItem setSubmenu:programMenu];

  MenuItem* quitItem = [[MenuItem alloc] initWithTitle:"Quit" action:@selector(terminate:) key:"q"];
  [programMenu addMenuItem:quitItem];


  MenuItem* fileItem = [[MenuItem alloc] init];
  [mainMenu addMenuItemToBar:fileItem];

  Menu* fileMenu = [[Menu alloc] initWithTitle:"File"];
  [fileItem setSubmenu:fileMenu];

  MenuItem* newItem = [[MenuItem alloc] initWithTitle:"New" action:NULL key:"n"];
  [fileMenu addMenuItem:newItem];

  [NSApp setMainMenu:[mainMenu mainMenu]];

  NSRect frame = NSMakeRect(x, y, w, h);
  NSUInteger windowStyle = NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable;
  NSRect rect = [FWindow contentRectForFrameRect:frame styleMask:windowStyle];

  self->window = [[[FWindow alloc] initWithContentRect:rect styleMask:windowStyle backing:NSBackingStoreBuffered defer:NO] autorelease];
  [self->window makeKeyAndOrderFront: self->window];
  [self->window setTitle:appTitle];

  [self->window setBackgroundColor: [Colour colourWithRedInt:200 green:77 blue:77 alpha:255]];

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
