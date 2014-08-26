//
//  AppDelegate.h
//  ShakeChoose
//
//  Created by Zzy on 8/25/14.
//  Copyright (c) 2014 Duobei Brothers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, readonly, nonatomic) UINavigationController *navigationController;

+ (AppDelegate *)delegate;
- (void)enterMainViewControllerAnimated:(BOOL)animated;

@end
