#import "MenubarController.h"
#import "StatusItemView.h"

@implementation MenubarController

@synthesize statusItemView = _statusItemView;

#pragma mark -

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        
        // Install status item into the menu bar
        NSStatusItem *statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:STATUS_ITEM_VIEW_WIDTH];
        _statusItemView = [[StatusItemView alloc] initWithStatusItem:statusItem];
        _statusItemView.image = [NSImage imageNamed:@"Top"];
        _statusItemView.alternateImage = [NSImage imageNamed:@"TopHighlighted"];
        _statusItemView.action = @selector(scrollTopAction:);
        _statusItemView.prefs  = @selector(showPrefsAction:);
    }
    return self;
}

- (void)dealloc
{
    [[NSStatusBar systemStatusBar] removeStatusItem:self.statusItem];
}

#pragma mark -
#pragma mark Public accessors

- (NSStatusItem *)statusItem
{
    return self.statusItemView.statusItem;
}

#pragma mark -

- (BOOL)hasActiveIcon
{
    return self.statusItemView.isHighlighted;

}

- (void)setHasActiveIcon:(BOOL)flag
{
    self.statusItemView.isHighlighted = flag;
}

- (void)scrollTop
{
  CGEventRef e = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)115, true); CGEventPost(kCGSessionEventTap, e); CFRelease(e);
  [self setHasActiveIcon:TRUE];
  [self performSelector: @selector(setHasActiveIcon:) withObject:FALSE afterDelay:0.05];
}

- (void)showPrefs
{
  NSLog(@"Showing Prefs");
}




@end
