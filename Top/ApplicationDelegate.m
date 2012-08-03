#import "ApplicationDelegate.h"

@implementation ApplicationDelegate

@synthesize menubarController = _menubarController;

#pragma mark -

- (void)dealloc
{
}

#pragma mark -

void *kContextActivePanel = &kContextActivePanel;

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == kContextActivePanel) {
//        self.menubarController.hasActiveIcon = self.panelController.hasActivePanel;
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - NSApplicationDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
    // Install icon into the menu bar
    self.menubarController      = [[MenubarController alloc] init];
    self.preferencesController  = [[PreferencesController alloc] init];
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender
{
    // Explicitly remove the icon from the menu bar
    self.menubarController = nil;
    return NSTerminateNow;
}

#pragma mark - Actions

- (IBAction)scrollTopAction:(id)sender
{
  [self.menubarController scrollTop];
}

- (IBAction)showPrefsAction:(id)sender
{
  [self.preferencesController showWindow:self];
}

@end
