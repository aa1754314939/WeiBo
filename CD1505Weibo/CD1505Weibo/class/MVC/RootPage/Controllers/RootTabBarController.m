//
//  RootTabBarController.m
//  CD1505Weibo
//
//  Created by 千锋 on 15/12/29.
//  Copyright © 2015年 Yhphone. All rights reserved.
//

#import "RootTabBarController.h"
#import "HomeTableViewController.h"
#import "PersonalTableViewController.h"
#import "DiscoveryTableViewController.h"
#import "MessageTableViewController.h"
#import "WBTabBar.h"
#import <PopMenu.h>

@interface RootTabBarController ()<WBTabBarDelegate>
/**
 *  自定义TabBar
 */
@property(nonatomic,strong)WBTabBar * wbTabBar;

@property (nonatomic, strong) PopMenu *popMenu;

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    //添加自定义TabBar
    [self addCustomTabBar];
    
    //添加
    [self addViewControllsers];
}

-(PopMenu *)popMenu{
    
    if (_popMenu == nil) {
        NSMutableArray * items = [[NSMutableArray alloc]init];
        
        NSArray * titleArr = @[@"文字",@"相册",@"拍摄",@"签到",@"点评",@"更多"];
        NSArray * imgArr = @[@"tabbar_compose_idea",@"tabbar_compose_photo",@"tabbar_compose_weibo",@"tabbar_compose_lbs",@"tabbar_compose_review",@"tabbar_compose_more"];
        
        for (int  i = 0; i < titleArr.count; i++) {
            MenuItem * item = [[MenuItem alloc]initWithTitle:titleArr[i] iconName:imgArr[i] glowColor:[UIColor whiteColor]];
            [items addObject:item];
        }
        
        _popMenu = [[PopMenu alloc]initWithFrame:[UIScreen mainScreen].bounds items:items];
        
        _popMenu.didSelectedItemCompletion = ^(MenuItem * item){
          
        };
    }
    return _popMenu;
}

-(void)addCustomTabBar{
    
    self.tabBar.hidden = YES;
    self.wbTabBar = [[WBTabBar alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49)];
    [self.view addSubview:self.wbTabBar];
    self.wbTabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]];
    self.wbTabBar.delegate = self;
    
    __weak typeof(self) weakSelf = self;
    self.wbTabBar.passBlock = ^(NSInteger index){
        weakSelf.selectedIndex = index;
    };
    
    self.wbTabBar.plubBlock = ^{
        //显示弹出界面
        [weakSelf.popMenu showMenuAtView:weakSelf.view];
    };
    
}

-(void)addViewControllsers{
    
    // self.viewControllers
    //1. _highlighted
    //HomeTableViewController * homeVC = [[HomeTableViewController alloc]init];
    
    NSArray * vcNameArray = @[@"HomeTableViewController",@"MessageTableViewController",@"DiscoveryTableViewController",@"PersonalTableViewController"];
    NSArray * vcTitle = @[@"首页",@"消息",@"发现",@"我"];
    //普通状态
    NSArray * norImageArray = @[@"tabbar_home",@"tabbar_message_center",@"tabbar_discover",@"tabbar_profile"];
    //高亮状态
    NSArray * hlImageArray = @[@"tabbar_home_highlighted",@"tabbar_message_center_highlighted",@"tabbar_discover_highlighted",@"tabbar_profile_highlighted"];
    //选中状态
    NSArray * selImageArray = @[@"tabbar_home_selected",@"tabbar_message_center_selected",@"tabbar_discover_selected",@"tabbar_profile_selected"];
    for (NSString * vcName in vcNameArray) {
        
        Class vcClass = NSClassFromString(vcName);
        NSInteger index = [vcNameArray indexOfObject:vcName];
        UITableViewController *vc = [[vcClass alloc]init];
        vc.title = vcTitle[index];
        
        [vc.tabBarItem setImage:[[UIImage imageNamed:norImageArray[index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        [vc.tabBarItem setSelectedImage:[[UIImage imageNamed:selImageArray[index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        //修改文字颜色
        NSDictionary * norAttribute = @{NSFontAttributeName:[UIFont systemFontOfSize:11],NSForegroundColorAttributeName:[UIColor lightGrayColor]};
        
        NSDictionary * selAttribute = @{NSFontAttributeName:[UIFont systemFontOfSize:11],NSForegroundColorAttributeName:[UIColor orangeColor]};
        
        [vc.tabBarItem setTitleTextAttributes:norAttribute forState:UIControlStateNormal];
        [vc.tabBarItem setTitleTextAttributes:selAttribute forState:UIControlStateSelected];
        UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
        [self addChildViewController:nav];
        self.wbTabBar.tabBarItem = vc.tabBarItem;
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)passIndex:(NSInteger )index{
    
    self.selectedIndex = index;
}



@end
