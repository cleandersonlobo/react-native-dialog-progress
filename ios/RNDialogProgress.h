
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

@interface RNDialogProgress : NSObject <RCTBridgeModule>

@property (retain) UIAlertController* visibleAlert;

@end
  
