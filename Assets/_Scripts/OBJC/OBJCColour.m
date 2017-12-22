@interface OBJCColour : NSObject
{
  NSColor* colour;
}
@end

@implementation OBJCColour
-(id)colourWithRedFloat:(float)r green:(float)g blue:(float)b alpha:(float)a
{
  if(!(self = [super init]))
    return nil;
  self->colour = [NSColor colorWithCalibratedRed:r green:g blue:b alpha:a];
  return self;
}

-(id)colourWithRedInt:(int)r green:(int)g blue:(int)b alpha:(int)a
{
  if(!(self = [super init]))
    return nil;

  float red = (float)r/255;
  float green = (float)g/255;
  float blue = (float)b/255;
  float alpha = (float)a/255;

  self->colour = [NSColor colorWithCalibratedRed:red green:green blue:blue alpha:alpha];
  return self;
}

-(NSColor*)Value{return self->colour;}
@end
