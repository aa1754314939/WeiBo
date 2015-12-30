//
//  WBTabBarButton.h
//  CD1505Weibo
//
//  Created by 千锋 on 15/12/29.
//  Copyright © 2015年 Yhphone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBTabBarButton : UIButton
/*是图片高度占整个按钮的比例 0~1 默认0.6*/
@property (nonatomic, assign) CGFloat ratio;

@property (nonatomic, strong) UITabBarItem *tabBarItem;

@end
