#import "OBJCOpenGLWindow.m"
#import "OBJCOpenGLView.m"

@interface OBJCOpenGLWindow : OBJCWindow
{

}

-(id)initWithTitle:(const char*)title xPos:(int)x yPos:(int)y width:(int)w height:(int)h style:(int16_t)s;

@end

@implementation OBJCOpenGLWindow
-(id)initWithTitle:(const char*)title xPos:(int)x yPos:(int)y width:(int)w height:(int)h style:(int16_t)s
{
    if (!(self = [super initWithTitle:title xPos:x yPos:y width:w height:h style:s]))
        return nil;

    OBJCOpenGLView* view = [[[OBJCOpenGLView alloc] initWithFrame:self->rect] autorelease];
    view->windowRect = self->rect;
    [self->window setAcceptsMouseMovedEvents:YES];
    [self->window setContentView: view];
    [self->window setDelegate: view];
    return self;
}
@end
