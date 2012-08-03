#pragma mark -

@class StatusItemView;

@interface PreferencesController : NSWindowController {
  IBOutlet PreferencesController *preferencesController;
}

@property (nonatomic) BOOL login;
@property (nonatomic, retain) IBOutlet PreferencesController *preferencesController;

@end
