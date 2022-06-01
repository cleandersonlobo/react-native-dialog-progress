
#import "RNDialogProgress.h"

@implementation RNDialogProgress

-(dispatch_queue_t) methodQueue {
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE(DialogProgress)

RCT_REMAP_METHOD(show, show:(NSDictionary*)opts resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    
    // Remove old alert if it's still visible
    BOOL animate = YES;
    if (self.visibleAlert) {
        [self.visibleAlert dismissViewControllerAnimated:NO completion:nil];
        animate = NO;
    }
    
    // Create alert
    NSString* title = [opts valueForKey:@"title"];
    NSString* msg = [opts valueForKey:@"message"];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    // Add cancel button if cancelable
    NSNumber* cancelable = [opts valueForKey:@"isCancelable"];
    if (cancelable.boolValue) {
        [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction* action) {
            self.visibleAlert = nil;
        }]];
    }

    // Find parent view controller
    UIViewController* vc = [UIApplication sharedApplication].delegate.window.rootViewController;
    while (vc.presentedViewController)
        vc = vc.presentedViewController;
    
    // Make it visible
    self.visibleAlert = alert;
    if (vc) [vc presentViewController:alert animated:animate completion:^{
        
        // Done
        resolve(@"OK");
        
    }];
    
    // Fail if no root view controller
    if (!vc)
        reject(@"no_viewcontroller", @"No UIViewController found.", nil);
    
}

RCT_REMAP_METHOD(hide, hideWithResolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    
    // Check if visible
    if (self.visibleAlert) {
        
        // Hide it
        [self.visibleAlert dismissViewControllerAnimated:YES completion:^{
            resolve(@"HIDE");
        }];

        // Remove it
        self.visibleAlert = nil;
        
    } else {
        
        // Nothing to hide
        resolve(@"HIDE");
        
    }
    
}

@end
  
