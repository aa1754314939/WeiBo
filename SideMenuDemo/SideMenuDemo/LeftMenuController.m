//
//  LeftMenuController.m
//  SideMenuDemo
//
//  Created by 千锋 on 15/12/28.
//  Copyright © 2015年 Yhphone. All rights reserved.
//

#import "LeftMenuController.h"
#import <RESideMenu.h>

@interface LeftMenuController ()

@end

@implementation LeftMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            UIViewController * vc = [[UIViewController alloc]init];
            vc.title = @"购买会员";
            vc.view.backgroundColor = [UIColor orangeColor];
            vc.hidesBottomBarWhenPushed = YES;
            UITabBarController * tabBarVC = (UITabBarController *)self.sideMenuViewController.contentViewController;
            UINavigationController * nav = tabBarVC.selectedViewController;
            
            [nav pushViewController:vc animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}



@end
