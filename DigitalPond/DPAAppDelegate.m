//
//  DPAAppDelegate.m
//  DigitalPond
//
//  Created by MadArkitekt on 5/14/14.
//  Copyright (c) 2014 Ed Salter. All rights reserved.
//

#import "DPAAppDelegate.h"
#import "DPAPondVC.h"

@implementation DPAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[DPAPondVC alloc] initWithNibName:@"DPAPondVC" bundle:nil];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

//- (void)applicationWillResignActive:(UIApplication *)application {
//}
//
//- (void)applicationDidEnterBackground:(UIApplication *)application {
//}
//
//- (void)applicationWillEnterForeground:(UIApplication *)application {
//}
//
//- (void)applicationDidBecomeActive:(UIApplication *)application {
//    
//}
//
//- (void)applicationWillTerminate:(UIApplication *)application {
//}

@end
