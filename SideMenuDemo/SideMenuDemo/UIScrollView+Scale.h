//
//  UIScrollView+Scale.h
//  SideMenuDemo
//
//  Created by 千锋 on 15/12/28.
//  Copyright © 2015年 Yhphone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScaleView : UIImageView

@property(nonatomic,weak)UIScrollView * scrollView;

@end

@interface UIScrollView (Scale)

@property(nonatomic,weak)ScaleView * scaleView;

/*添加可拉伸图片*/
-(void)addScaleImageViewWithImage:(UIImage *)image;

-(void)removeScaleImageView;

@end
