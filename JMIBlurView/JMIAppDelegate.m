//
//  JMIAppDelegate.m
//  JMIBlurView
//
//  Created by Jose Ibanez on 7/15/13.
//  Copyright (c) 2013 Jose Ibanez. All rights reserved.
//

#import "JMIAppDelegate.h"
#import "JMIViewController.h"
#import <MediaPlayer/MediaPlayer.h>

// enable CAFilter logging
#define LOG_CAFILTER 0

#if LOG_CAFILTER
#import "Swizz.h"
#import "NSObject+MyCAFilter.h"
#endif

@implementation JMIAppDelegate

#if LOG_CAFILTER
+ (void)initialize {
    Class classCAFilter = NSClassFromString(@"CAFilter");
    if (classCAFilter) {
        NSLog(@"found CAFilter class!");
    } else {
        NSLog(@"found nothing but sadness.");
    }
    SwizzClassMethod(classCAFilter, classCAFilter, NSSelectorFromString(@"filterTypes"), @selector(_filterTypes));
    SwizzClassMethod(classCAFilter, classCAFilter, NSSelectorFromString(@"filterWithName:"), @selector(_filterWithName:));
    SwizzClassMethod(classCAFilter, classCAFilter, NSSelectorFromString(@"filterWithType:"), @selector(_filterWithType:));
    
    SwizzInstanceMethod(classCAFilter, classCAFilter, NSSelectorFromString(@"cachesInputImage"), @selector(_cachesInputImage));
    SwizzInstanceMethod(classCAFilter, classCAFilter, NSSelectorFromString(@"copyWithZone:"), @selector(_copyWithZone:));
    SwizzInstanceMethod(classCAFilter, classCAFilter, NSSelectorFromString(@"enabled"), @selector(_enabled));
    SwizzInstanceMethod(classCAFilter, classCAFilter, NSSelectorFromString(@"encodeWithCoder:"), @selector(_encodeWithCoder:));
    SwizzInstanceMethod(classCAFilter, classCAFilter, NSSelectorFromString(@"initWithCoder:"), @selector(_initWithCoder:));
    SwizzInstanceMethod(classCAFilter, classCAFilter, NSSelectorFromString(@"initWithName:"), @selector(_initWithName:));
    SwizzInstanceMethod(classCAFilter, classCAFilter, NSSelectorFromString(@"initWithType:"), @selector(_initWithType:));
    SwizzInstanceMethod(classCAFilter, classCAFilter, NSSelectorFromString(@"isEnabled"), @selector(_isEnabled));
    SwizzInstanceMethod(classCAFilter, classCAFilter, NSSelectorFromString(@"mutableCopyWithZone:"), @selector(_mutableCopyWithZone:));
    SwizzInstanceMethod(classCAFilter, classCAFilter, NSSelectorFromString(@"name"), @selector(_name));
    SwizzInstanceMethod(classCAFilter, classCAFilter, NSSelectorFromString(@"setCachesInputImage:"), @selector(_setCachesInputImage:));
    SwizzInstanceMethod(classCAFilter, classCAFilter, NSSelectorFromString(@"setDefaults"), @selector(_setDefaults));
    SwizzInstanceMethod(classCAFilter, classCAFilter, NSSelectorFromString(@"setEnabled:"), @selector(_setEnabled:));
    SwizzInstanceMethod(classCAFilter, classCAFilter, NSSelectorFromString(@"setName:"), @selector(_setName:));
    SwizzInstanceMethod(classCAFilter, classCAFilter, NSSelectorFromString(@"setValue:forKey:"), @selector(_setValue:forKey:));
    SwizzInstanceMethod(classCAFilter, classCAFilter, NSSelectorFromString(@"type"), @selector(_type));
    SwizzInstanceMethod(classCAFilter, classCAFilter, NSSelectorFromString(@"valueForKey:"), @selector(_valueForKey:));
}
#endif

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //
    // swap these comments to see what Apple does
    
    // VC only
    self.window.rootViewController = [[JMIViewController alloc] initWithNibName:Nil bundle:nil];
    
    // UITabBarController w/ UINavigationController & UIToolbar
//    UITabBarController *tab = [[UITabBarController alloc] initWithNibName:nil bundle:nil];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[JMIViewController alloc] initWithNibName:nil bundle:nil]];
//    nav.toolbarHidden = NO;
//    tab.viewControllers = @[nav];
//    self.window.rootViewController = tab;
    
    // MPMoviePlayerViewController
//    self.window.rootViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:nil];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
