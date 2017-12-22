#import "FWindow.m"
#import "Colour.m"
#import "MainMenu.m"
#import "MenuItem.m"
#import "Menu.m"

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

  //Main menubar
  // self->mainMenu = [[NSMenu new] autorelease];
  // NSMenuItem* emptyMenuItem = [[NSMenuItem new] autorelease];
  // [self->mainMenu addItem:emptyMenuItem];
  // [NSApp setMainMenu:self->mainMenu];
  MainMenu* mainMenu = [[MainMenu alloc] init];
  [NSApp setMainMenu:[mainMenu Object]];

  //First item
  Menu* firstMenuItem = [[Menu alloc] init];
  [mainMenu addMenuToBar:firstMenuItem];

  MenuItem* test = [[MenuItem alloc] initWithTitle:"Test" action:@selector(terminate:) key:"a"];
  [firstMenuItem addMenuItem:test];

  MenuItem* quitMenuItem = [[MenuItem alloc] initWithTitle:"Quit" action:@selector(terminate:) key:"q"];
  [firstMenuItem addMenuItem:quitMenuItem];

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
