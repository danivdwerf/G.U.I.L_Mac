#import <Cocoa/Cocoa.h>
#import <QuartzCore/CVDisplayLink.h>
#import <OpenGL/OpenGL.h>
#include <OpenGL/gl3.h>

@interface OBJCOpenGLView : NSOpenGLView <NSWindowDelegate>
{
	@public CVDisplayLinkRef displayLink;
	@public bool isRunning;
  @public NSRect windowRect;
  @public NSRecursiveLock* appLock;
}
@end

@implementation OBJCOpenGLView
-(id) initWithFrame:(NSRect)frame
{
	if(!(self = [super initWithFrame:frame]))
    return nil;

	self->isRunning = true;

	int samples = 0;

  NSOpenGLPixelFormatAttribute windowedAttrs[] =
  {
  	NSOpenGLPFAMultisample,
  	NSOpenGLPFASampleBuffers, samples ? 1 : 0,
  	NSOpenGLPFASamples, samples,
  	NSOpenGLPFAAccelerated,
  	NSOpenGLPFADoubleBuffer,
  	NSOpenGLPFAColorSize, 32,
  	NSOpenGLPFADepthSize, 24,
  	NSOpenGLPFAAlphaSize, 8,
  	NSOpenGLPFAOpenGLProfile, NSOpenGLProfileVersion3_2Core,
  	0
  };

  NSOpenGLPixelFormat* pf = [[NSOpenGLPixelFormat alloc] initWithAttributes:windowedAttrs];

  if (!pf)
  {
		bool valid = false;
		while (!pf && samples > 0)
    {
			samples /= 2;
			windowedAttrs[2] = samples ? 1 : 0;
			windowedAttrs[4] = samples;
			pf = [[NSOpenGLPixelFormat alloc] initWithAttributes:windowedAttrs];
			if (pf)
      {
				valid = true;
				break;
			}
		}

		if (!valid)
    {
			NSLog(@"OpenGL pixel format not supported.");
			return nil;
		}
	}

	self = [super initWithFrame:frame pixelFormat:[pf autorelease]];
	appLock = [[NSRecursiveLock alloc] init];

	return self;
}

- (void) prepareOpenGL
{
	[super prepareOpenGL];
	[[self openGLContext] makeCurrentContext];

  //VSYNC
	GLint swapInt = 1;
	[[self openGLContext] setValues:&swapInt forParameter:NSOpenGLCPSwapInterval];

	CVDisplayLinkCreateWithActiveCGDisplays(&displayLink);
	CVDisplayLinkSetOutputCallback(displayLink, &GlobalDisplayLinkCallback, self);

	CGLContextObj cglContext = (CGLContextObj)[[self openGLContext] CGLContextObj];
	CGLPixelFormatObj cglPixelFormat = (CGLPixelFormatObj)[[self pixelFormat] CGLPixelFormatObj];
	CVDisplayLinkSetCurrentCGDisplayFromOpenGLContext(displayLink, cglContext, cglPixelFormat);

	GLint dim[2] = {windowRect.size.width, windowRect.size.height};
	CGLSetParameter(cglContext, kCGLCPSurfaceBackingSize, dim);
	CGLEnable(cglContext, kCGLCESurfaceBackingSize);

	[appLock lock];
	CGLLockContext((CGLContextObj)[[self openGLContext] CGLContextObj]);

	NSLog(@"GL version:   %s", glGetString(GL_VERSION));
	NSLog(@"GLSL version: %s", glGetString(GL_SHADING_LANGUAGE_VERSION));

	glClearColor(0.5f, 0.6f, 0.7f, 1.0f);
	glViewport(0, 0, windowRect.size.width, windowRect.size.height);
	glEnable(GL_DEPTH_TEST);

	CGLUnlockContext((CGLContextObj)[[self openGLContext] CGLContextObj]);
	[appLock unlock];

	CVDisplayLinkStart(displayLink);
}

-(CVReturn) getFrameForTime:(const CVTimeStamp*)outputTime
{
	[appLock lock];
	[[self openGLContext] makeCurrentContext];
	CGLLockContext((CGLContextObj)[[self openGLContext] CGLContextObj]);

	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	CGLFlushDrawable((CGLContextObj)[[self openGLContext] CGLContextObj]);
	CGLUnlockContext((CGLContextObj)[[self openGLContext] CGLContextObj]);

	if (false)
		[NSApp terminate:self];

	[appLock unlock];

	return kCVReturnSuccess;
}

-(BOOL)acceptsFirstResponder
{
  return YES;
}

-(void)windowWillClose:(NSNotification *)notification
{
  if (isRunning)
  {
		isRunning = false;
    [appLock lock];
    CVDisplayLinkStop(displayLink);
    CVDisplayLinkRelease(displayLink);
    [appLock unlock];
  }

	[NSApp terminate:self];
}

static CVReturn GlobalDisplayLinkCallback(CVDisplayLinkRef displayLink, const CVTimeStamp* now, const CVTimeStamp* outputTime, CVOptionFlags flagsIn, CVOptionFlags* flagsOut, void* displayLinkContext)
{
	CVReturn result = [(OBJCOpenGLView*)displayLinkContext getFrameForTime:outputTime];
	return result;
}

-(void)dealloc
{
  [appLock release];
	[super dealloc];
}

-(void)windowDidResize:(NSNotification*)notification
{
  NSSize size = [[_window contentView] frame].size;
	[appLock lock];
	[[self openGLContext] makeCurrentContext];
	CGLLockContext((CGLContextObj)[[self openGLContext] CGLContextObj]);
	windowRect.size.width = size.width;
	windowRect.size.height = size.height;
	glViewport(0, 0, windowRect.size.width, windowRect.size.height);
	CGLUnlockContext((CGLContextObj)[[self openGLContext] CGLContextObj]);
	[appLock unlock];
}
@end
