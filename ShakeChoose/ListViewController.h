//
//  ListViewController.h
//  ShakeChoose
//
//  Created by Zzy on 8/26/14.
//  Copyright (c) 2014 Duobei Brothers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
- (IBAction)onClickDone:(id)sender;
- (IBAction)onClickAdd:(id)sender;

@end
