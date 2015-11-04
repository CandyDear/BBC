//
//  AppDelegate.m
//  BBC_News
//
//  Created by mac on 15/10/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AppDelegate.h"
#import "LeftViewController.h"
#import "MMDrawerController.h"
#import "MMDrawerVisualState.h"
#import "BaseBarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //左边控制栏
    LeftViewController *leftVC = [[LeftViewController alloc] init];
    //中间控制器
    BaseBarViewController *barVC = [[BaseBarViewController alloc] init];
    
    MMDrawerController *drawerVC = [[MMDrawerController alloc] initWithCenterViewController:barVC leftDrawerViewController:leftVC];
//    drawerVC.         
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [drawerVC setMaximumLeftDrawerWidth:320];
    //设置手势区域
    [drawerVC setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [drawerVC setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    //设置动画效果
    MMDrawerControllerDrawerVisualStateBlock block = [MMDrawerVisualState swingingDoorVisualStateBlock];
    [drawerVC setDrawerVisualStateBlock:block];
    //状态栏
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = drawerVC;
    
    UIApplication *app = [UIApplication sharedApplication];
    //设置状态栏的颜色
    app.statusBarStyle  = UIStatusBarStyleLightContent;
//    [app setStatusBarStyle:UIStatusBarStyleLightContent];
    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
