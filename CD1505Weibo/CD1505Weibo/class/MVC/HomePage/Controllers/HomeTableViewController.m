//
//  HomeTableViewController.m
//  CD1505Weibo
//
//  Created by 千锋 on 15/12/29.
//  Copyright © 2015年 Yhphone. All rights reserved.
//

#import "HomeTableViewController.h"
#import "UIBarButtonItem+Util.h"
#import "TitleButton.h"

@interface HomeTableViewController ()

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createNaviBarItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/**
 *
 */

-(void)createNaviBarItem{
    
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [leftBtn setImage:[UIImage imageNamed:@"navigationbar_friendattention"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"navigationbar_friendattention_highlighted"] forState:UIControlStateHighlighted];
    
    CGSize size = leftBtn.currentImage.size;
    leftBtn.frame = CGRectMake(0, 0, size.width, size.height);
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem generateBarButtonItemWithNormalImageName:@"navigationbar_icon_radar" HighlightedImageName:@"navigationbar_icon_radar_highlighted"];
    TitleButton * btn = [TitleButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"hadjsgfhk" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    btn.frame = CGRectMake(0, 0, 150, 30);
    self.navigationItem.titleView = btn;
    btn.backgroundColor = [UIColor clearColor];
    [btn addTarget:self action:@selector(titleBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)titleBtnPressed:(UIButton *)sender{
    
    sender.selected = !sender.selected;
//    if (sender.selected) {
//        
//    }
//    UIView * view = [[UIView alloc]init];
//    view.frame = CGRectMake(100, 100, 100, 100);
//    view.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:view];
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
}


@end
