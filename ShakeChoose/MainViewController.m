//
//  MainViewController.m
//  ShakeChoose
//
//  Created by Zzy on 8/25/14.
//  Copyright (c) 2014 Duobei Brothers. All rights reserved.
//

#import "MainViewController.h"
#import "ListViewController.h"
#import "AppDelegate.h"
#import "GlobalService.h"
#import "Food.h"
#import <AudioToolbox/AudioToolbox.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateViewWithInit:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)updateViewWithInit:(BOOL)isInit
{
    [UIView animateWithDuration:0.5f animations:^{
        self.view.backgroundColor = [[GlobalService sharedSingleton] getRandomColor];
    }];
    if (!isInit) {
        Food *food = [[GlobalService sharedSingleton] getRandomFood];
        if (food) {
            self.mainLabel.text = food.name;
            self.todayLabel.hidden = NO;
            self.detailLabel.hidden = YES;
            return;
        } else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请点击左上角菜单图标添加菜单" delegate:self cancelButtonTitle:@"好的" otherButtonTitles: nil];
            [alertView show];
        }
    }
    self.mainLabel.text = @"摇一摇";
    self.todayLabel.hidden = YES;
    self.detailLabel.hidden = NO;
}

- (IBAction)onClickMenu:(id)sender
{
    ListViewController *listViewController = [[ListViewController alloc] init];
    [[AppDelegate delegate].navigationController presentViewController:listViewController animated:YES completion:nil];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    [self updateViewWithInit:NO];
}

@end
