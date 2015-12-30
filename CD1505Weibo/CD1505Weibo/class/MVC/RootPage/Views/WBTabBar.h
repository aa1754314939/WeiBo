//
//  WBTabBar.h
//  CD1505Weibo
//
//  Created by 千锋 on 15/12/29.
//  Copyright © 2015年 Yhphone. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PassBlocck)(NSInteger index);

typedef void(^PlubBtnPressedBlock)();

@protocol WBTabBarDelegate <NSObject>

-(void)passIndex:(NSInteger )index;

@end

@interface WBTabBar : UIView
/**
 *  用来传递 title 的信息
 */
@property(nonatomic,strong)UITabBarItem * tabBarItem;

@property (nonatomic, weak) id<WBTabBarDelegate> delegate;
/**传出*/
@property(nonatomic,copy)PassBlocck passBlock;

@property(nonatomic,copy)PlubBtnPressedBlock plubBlock;

@end
