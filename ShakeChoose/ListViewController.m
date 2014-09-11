//
//  ListViewController.m
//  ShakeChoose
//
//  Created by Zzy on 8/26/14.
//  Copyright (c) 2014 Duobei Brothers. All rights reserved.
//

#import "ListViewController.h"
#import "Food.h"
#import "GlobalService.h"
#import "AppDelegate.h"

@interface ListViewController ()<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@end

@implementation ListViewController

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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [GlobalService sharedSingleton].foodList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"food"];
    Food *food = [[GlobalService sharedSingleton].foodList objectAtIndex:indexPath.row];
    cell.textLabel.text = food.name;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[GlobalService sharedSingleton] deleteFoodAtIndex:indexPath.row];
    [self.tableView reloadData];
}

- (IBAction)onClickDone:(id)sender
{
    [[AppDelegate delegate].navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onClickAdd:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"添加" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"完成", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alertView textFieldAtIndex:0].placeholder = @"请输入外卖名称";
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        Food *food = [[Food alloc] initWithName:[[alertView textFieldAtIndex:0] text]];
        [[GlobalService sharedSingleton] insertFood:food];
        [self.tableView reloadData];
    }
}

@end
