//
//  RootViewController.m
//  SideMenuDemo
//
//  Created by 千锋 on 15/12/28.
//  Copyright © 2015年 Yhphone. All rights reserved.
//

#import "RootViewController.h"
#import "LeftMenuController.h"
#import "MainTableViewController.h"
#import "MainTabBarController.h"

@interface RootViewController ()

@end

@implementation RootViewController

//当一个视图从storyboard中苏醒时调用
-(void)awakeFromNib{
    
    self.scaleContentView = NO;
    self.scaleMenuView = NO;
    self.contentViewInPortraitOffsetCenterX = 100;
    self.contentViewShadowEnabled = YES;
    self.contentViewShadowOffset = CGSizeMake(-10, 10);
    self.contentViewShadowColor = [UIColor lightGrayColor];
    self.contentViewShadowRadius = 5;
    
    UIStoryboard * mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //2.取出viewController
    LeftMenuController * leftVC = [mainSB instantiateViewControllerWithIdentifier:@"LeftMenuVC"];
//    MainTableViewController * mainVC = [mainSB instantiateViewControllerWithIdentifier:@"MainVC"];
//    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:mainVC];
    
    MainTabBarController * mainTabBar = [mainSB instantiateViewControllerWithIdentifier:@"MainTabBarVC"];
    
    self.leftMenuViewController = leftVC;
    self.contentViewController = mainTabBar;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加左边和中间
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
