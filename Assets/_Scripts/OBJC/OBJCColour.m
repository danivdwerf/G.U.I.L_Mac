@interface OBJCColour : NSObject
@end

@implementation OBJCColour
+(NSColor*)colourWithRedFloat:(float)r green:(float)g blue:(float)b alpha:(float)a
{
  return [NSColor colorWithCalibratedRed:r green:g blue:b alpha:a];
}

+(NSColor*)colourWithRedInt:(int)r green:(int)g blue:(int)b alpha:(int)a
{
  float red = (float)r/255;
  float green = (float)g/255;
  float blue = (float)b/255;
  float alpha = (float)a/255;

  return [NSColor colorWithCalibratedRed:red green:green blue:blue alpha:alpha];
}
@end
