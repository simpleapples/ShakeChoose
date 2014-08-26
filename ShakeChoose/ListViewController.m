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

@interface ListViewController ()

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
    [[self view] setBackgroundColor:[[GlobalService sharedSingleton] currentColor]];
    [[self navigationBar] setBarTintColor:[[GlobalService sharedSingleton] currentColor]];
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
    return [[GlobalService sharedSingleton] foodListCount];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"food"];
    Food *food = [[GlobalService sharedSingleton] foodAtIndex:indexPath.row];
    [[cell textLabel] setText:[food name]];
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
    [[self tableView] reloadData];
}

- (IBAction)onClickDone:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onClickAdd:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"添加" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"完成", nil];
    [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        Food *food = [[Food alloc] initWithName:[[alertView textFieldAtIndex:0] text]];
        [[GlobalService sharedSingleton] insertFood:food];
        [[self tableView] reloadData];
    }
}

@end
