//
//  HitoryViewController.m
//  ShakeChoose
//
//  Created by Zzy on 9/11/14.
//  Copyright (c) 2014 Duobei Brothers. All rights reserved.
//

#import "HistoryViewController.h"
#import "GlobalService.h"
#import "AppDelegate.h"
#import "FoodHistory.h"

@interface HistoryViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HistoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [GlobalService sharedSingleton].currentColor;
    self.navigationBar.barTintColor = [GlobalService sharedSingleton].currentColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [GlobalService sharedSingleton].foodHistoryList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"History"];
    FoodHistory *foodHistory = [[GlobalService sharedSingleton].foodHistoryList objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"吃了 %@", foodHistory.name];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    cell.detailTextLabel.text = [dateFormatter stringFromDate:foodHistory.createTime];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

- (IBAction)onClickDone:(id)sender
{
    [[AppDelegate delegate].navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
