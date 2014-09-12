//
//  AppDelegate.m
//  ShakeChoose
//
//  Created by Zzy on 8/25/14.
//  Copyright (c) 2014 Duobei Brothers. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "ListViewController.h"
#import "HistoryViewController.h"
#import "GlobalService.h"

@interface AppDelegate ()
@property (strong, nonatomic) UINavigationController *navigationController;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    application.statusBarHidden = NO;
    application.statusBarStyle = UIStatusBarStyleLightContent;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.navigationController = [[UINavigationController alloc] init];
    [self.navigationController setNavigationBarHidden:YES];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    
    [[GlobalService sharedSingleton] recoverFromFile];
    
    [self enterMainViewControllerAnimated:NO];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

+ (AppDelegate *)delegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)enterMainViewControllerAnimated:(BOOL)animated
{
    MainViewController *mainViewController = [[MainViewController alloc] init];
    [self.navigationController pushViewController:mainViewController animated:animated];
}

@end
