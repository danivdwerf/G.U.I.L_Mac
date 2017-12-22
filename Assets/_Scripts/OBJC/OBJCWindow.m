#import "FWindow.m"
#import "Colour.m"

@interface OBJCWindow : NSObject
{
  FWindow* window;
  NSMenu* mainMenu;
  NSMutableArray* menuItems;
}
@end

@implementation OBJCWindow
-(id)init:(const char*)title :(int)x :(int)y :(int)w :(int)h
{
  if (!(self = [super init]))
    return nil;

  [menuItems init];
  [self createWindow:title:x:y:w:h];
  return self;
}

-(void)createWindow:(const char*)title :(int)x :(int)y :(int)w :(int)h
{
  //Pool?
  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
  NSString* appTitle = [NSString stringWithUTF8String: title];

  //Create main Menu
  NSApplication* application = [NSApplication sharedApplication];
  [NSApp setActivationPolicy: NSApplicationActivationPolicyRegular];
  [NSApp finishLaunching];

  //Create Main menu
  self->mainMenu = [[NSMenu new] autorelease];
  NSMenuItem* emptyMenuItem = [[NSMenuItem new] autorelease];
  [self->mainMenu addItem:emptyMenuItem];
  [NSApp setMainMenu:self->mainMenu];

  //First item
  NSMenu* firstMenuItem = [[NSMenu new] autorelease];
  [emptyMenuItem setSubmenu:firstMenuItem];

  NSString* quitTitle = @"Quit";
  NSMenuItem* quitMenuItem = [[[NSMenuItem alloc] initWithTitle:quitTitle action:@selector(terminate:) keyEquivalent:@"q"] autorelease];
  [firstMenuItem addItem:quitMenuItem];
  [self->menuItems addObject:quitMenuItem];

  NSRect frame = NSMakeRect(x, y, w, h);
  NSUInteger windowStyle = NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable;
  NSRect rect = [FWindow contentRectForFrameRect:frame styleMask:windowStyle];

  self->window = [[[FWindow alloc] initWithContentRect:rect styleMask:windowStyle backing:NSBackingStoreBuffered defer:NO] autorelease];
  [self->window makeKeyAndOrderFront: self->window];
  [self->window setTitle:appTitle];

  [self->window setBackgroundColor: [Colour colourWithRedInt:200 green:77 blue:77 alpha:255]];

  NSWindowController* windowController = [[[NSWindowController alloc] initWithWindow:self->window] autorelease];
  // Hide window
  // [self->window orderOut: self];

  // Close window
  // [self->window close];
  [self->window orderFrontRegardless];
  [pool drain];
}

-(void)run
{
  [NSApp activateIgnoringOtherApps:YES];
  [NSApp run];
}
@end
