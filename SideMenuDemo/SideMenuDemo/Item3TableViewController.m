//
//  Item3TableViewController.m
//  SideMenuDemo
//
//  Created by 千锋 on 15/12/28.
//  Copyright © 2015年 Yhphone. All rights reserved.
//

#import "Item3TableViewController.h"
#import "UIScrollView+Scale.h"

@interface Item3TableViewController ()

@end

@implementation Item3TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    [self addScaleView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addScaleView{
    
    [self.tableView addScaleImageViewWithImage:[UIImage imageNamed:@"image000.jpg"]];
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
