#import "MenubarController.h"
#import "PreferencesController.h"

@interface ApplicationDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, strong) MenubarController *menubarController;
@property (nonatomic, strong) PreferencesController *preferencesController;

@end
