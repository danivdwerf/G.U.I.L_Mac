@interface OBJCButton : NSObject
{
  NSButton* buttonObject;
  int8_t type;
  void(*callback)();
}
-(id)initWithTitle:(const char*)t xPos:(int)x yPos:(int)y width:(int)w height:(int)h type:(int8_t)type callback:(void(*)())c;
-(id)initWithTitle:(const char*)t frame:(NSRect)r type:(int8_t)type callback:(void(*)())c;
-(id)initWithImagePath:(const char*)i xPos:(int)x yPos:(int)y type:(int8_t)t callback:(void(*)())c;

-(void)onClick:(id)sender;
-(void)show:(NSWindow*)window;

-(int8_t)Type;
@end

@implementation OBJCButton
-(id)initWithTitle:(const char*)t xPos:(int)x yPos:(int)y width:(int)w height:(int)h type:(int8_t)buttonType callback:(void(*)())c
{
  if(!(self = [super init]))
    return nil;

  self->type = buttonType;

  NSRect frame = NSMakeRect(x, y, w, h);
  self->buttonObject = [[[NSButton alloc] initWithFrame: frame] autorelease];
  [self->buttonObject setTitle: [NSString stringWithUTF8String:t]];
  [self->buttonObject setTarget: self];
  [self->buttonObject setButtonType:self->type];
  [self->buttonObject setAction:@selector(onClick:)];
  self->callback = c;


  return self;
}

-(id)initWithTitle:(const char*)t frame:(NSRect)r type:(int8_t)buttonType callback:(void(*)())c
{
  if(!(self = [super init]))
    return nil;

  self->type = buttonType;

  self->buttonObject = [[[NSButton alloc] initWithFrame:r] autorelease];
  [self->buttonObject setTitle: [NSString stringWithUTF8String:t]];
  [self->buttonObject setTarget: self];
  [self->buttonObject setButtonType: self->type];
  [self->buttonObject setAction:@selector(onClick:)];
  self->callback = c;

  return self;
}

-(id)initWithImagePath:(const char*)i xPos:(int)x yPos:(int)y type:(int8_t)buttonType callback:(void(*)())c
{
  if(!(self = [super init]))
    return nil;

  self->type = buttonType;
  NSImage* image = [[NSImage alloc]initWithContentsOfFile:[NSString stringWithUTF8String: i]];
  NSRect frame = NSMakeRect(x, y, (int)[image size].width, (int)[image size].height);
  self->buttonObject = [[[NSButton alloc] initWithFrame: frame] autorelease];
  [self->buttonObject setTarget: self];
  [self->buttonObject setAction:@selector(onClick:)];
  [self->buttonObject setTitle:@""];
  [self->buttonObject setImage: image];
  [self->buttonObject setButtonType: self->type];
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

-(int8_t)Type
{
    return self->type;
}
@end
