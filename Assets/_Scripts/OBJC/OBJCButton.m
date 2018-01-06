@interface OBJCButton : NSObject
{
  NSButton* buttonObject;
  void(*callback)();
}
-(id)initWithTitle:(const char*)t xPos:(int)x yPos:(int)y width:(int)w height:(int)h callback:(void(*)())c;
-(id)initWithTitle:(const char*)t frame:(NSRect)r callback:(void(*)())c;
-(id)initWithImagePath:(const char*)i xPos:(int)x yPos:(int)y callback:(void(*)())c;
-(void)onClick:(id)sender;
-(void)show:(NSWindow*)window;
@end

@implementation OBJCButton
-(id)initWithTitle:(const char*)t xPos:(int)x yPos:(int)y width:(int)w height:(int)h callback:(void(*)())c
{
  if(!(self = [super init]))
    return nil;

  NSRect frame = NSMakeRect(x, y, w, h);
  self->buttonObject = [[[NSButton alloc] initWithFrame: frame] autorelease];
  [self->buttonObject setTitle: [NSString stringWithUTF8String:t]];
  [self->buttonObject setTarget: self];
  [self->buttonObject setAction:@selector(onClick:)];
  self->callback = c;

  return self;
}

-(id)initWithTitle:(const char*)t frame:(NSRect)r callback:(void(*)())c
{
  if(!(self = [super init]))
    return nil;

  self->buttonObject = [[[NSButton alloc] initWithFrame:r] autorelease];
  [self->buttonObject setTitle: [NSString stringWithUTF8String:t]];
  [self->buttonObject setTarget: self];
  [self->buttonObject setAction:@selector(onClick:)];
  self->callback = c;

  return self;
}

-(id)initWithImagePath:(const char*)i xPos:(int)x yPos:(int)y callback:(void(*)())c
{
  if(!(self = [super init]))
    return nil;

  NSImage* image = [[NSImage alloc]initWithContentsOfFile:[NSString stringWithUTF8String: i]];
  NSRect frame = NSMakeRect(x, y, (int)[image size].width, (int)[image size].height);
  self->buttonObject = [[[NSButton alloc] initWithFrame: frame] autorelease];
  [self->buttonObject setTarget: self];
  [self->buttonObject setAction:@selector(onClick:)];
  [self->buttonObject setImage: image];
  [self->buttonObject setBordered:NO];
  self->callback = c;
  return self;
}

-(void)show:(NSWindow*)window
{
  [[window contentView] addSubview:self->buttonObject];
}

-(void)onClick:(id)sender
{
  if(callback != NULL)
    self->callback();
}
@end
