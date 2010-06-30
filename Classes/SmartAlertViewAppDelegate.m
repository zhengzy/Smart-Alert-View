//
//  SmartAlertViewAppDelegate.m
//  SmartAlertView
//
//  Created by Fry Constantine on 10/17/09.
//  Copyright home 2009. All rights reserved.
//

#import "SmartAlertViewAppDelegate.h"
#import "SmartAlertViewViewController.h"

@implementation SmartAlertViewAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
