//
//  MainViewController.m
//  ShakeChoose
//
//  Created by Zzy on 8/25/14.
//  Copyright (c) 2014 Duobei Brothers. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "GlobalService.h"
#import "Food.h"
#import "FoodHistory.h"
#import "ListViewController.h"
#import "HistoryViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "GoogleMobileAdsSdkiOS/GADBannerView.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet UILabel *todayLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (strong, nonatomic) GADBannerView *adBannerView;
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
    self.confirmButton.layer.cornerRadius = 6.0f;
    self.confirmButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.confirmButton.layer.borderWidth = 1.0f;
    self.confirmButton.hidden = YES;
    self.todayLabel.hidden = YES;
    
    self.adBannerView = [[GADBannerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - GAD_SIZE_320x50.height, GAD_SIZE_320x50.width, GAD_SIZE_320x50.height)];
    self.adBannerView.adUnitID = @"ca-app-pub-2517651978200721/2931818096";
    self.adBannerView.rootViewController = self;
    [self.view addSubview:self.adBannerView];
    [self.adBannerView loadRequest:[GADRequest request]];
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
            self.confirmButton.hidden = NO;
            self.detailLabel.hidden = YES;
            return;
        } else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请点击左上角菜单图标添加菜单" delegate:self cancelButtonTitle:@"好的" otherButtonTitles: nil];
            [alertView show];
        }
    }
    self.mainLabel.text = @"摇一摇";
    self.todayLabel.hidden = YES;
    self.confirmButton.hidden = YES;
    self.detailLabel.hidden = NO;
}

- (IBAction)onClickMenu:(id)sender
{
    ListViewController *listViewController = [[ListViewController alloc] init];
    [[AppDelegate delegate].navigationController presentViewController:listViewController animated:YES completion:nil];
}

- (IBAction)onClickHistory:(id)sender
{
    HistoryViewController *historyViewController = [[HistoryViewController alloc] init];
    [[AppDelegate delegate].navigationController presentViewController:historyViewController animated:YES completion:nil];
}

- (IBAction)onClickConfirm:(id)sender
{
    FoodHistory *foodHistory = [[FoodHistory alloc] initWithName:self.mainLabel.text createTime:[NSDate date]];
    [[GlobalService sharedSingleton] inserFoodHistory:foodHistory];
    self.confirmButton.hidden = YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    [self updateViewWithInit:NO];
}

@end
