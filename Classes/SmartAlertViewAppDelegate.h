//
//  SmartAlertViewAppDelegate.h
//  SmartAlertView
//
//  Created by Fry Constantine on 10/17/09.
//  Copyright home 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SmartAlertViewViewController;

@interface SmartAlertViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SmartAlertViewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SmartAlertViewViewController *viewController;

@end

