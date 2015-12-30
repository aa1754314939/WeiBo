//
//  ParallaxCellTableViewCell.h
//  ParallaxDemo
//
//  Created by 千锋 on 15/12/28.
//  Copyright © 2015年 Yhphone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParallaxCellTableViewCell : UITableViewCell
//添加属性
@property(nonatomic,copy)NSString * imageName;

-(void)scrollImageInTableview:(UITableView *)tableView inView:(UIView *)view;

@end
