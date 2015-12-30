//
//  WBTabBarButton.m
//  CD1505Weibo
//
//  Created by 千锋 on 15/12/29.
//  Copyright © 2015年 Yhphone. All rights reserved.
//

#import "WBTabBarButton.h"

@implementation WBTabBarButton

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        _ratio = 0.6;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return self;
}

/*生成按钮内部图片的位置 contentRect按钮自身的frame*/
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat imgX = 0;
    CGFloat imgY = 0;
    CGFloat imgWidth = CGRectGetWidth(contentRect);
    CGFloat imgHeight = CGRectGetHeight(contentRect) * _ratio;
    return CGRectMake(imgX, imgY, imgWidth, imgHeight);
}

/*生成按钮内部title的位置*/
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    CGFloat titleX = 0;
    CGFloat titleY = CGRectGetHeight(contentRect) * _ratio;
    CGFloat titleWidth = CGRectGetWidth(contentRect);
    CGFloat titleHeight = CGRectGetHeight(contentRect) * (1 - _ratio);
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}

-(void)setRatio:(CGFloat)ratio{
    
    if (ratio<0||ratio>1) {
        
        NSException * excep = [NSException exceptionWithName:@"异常提示" reason:@"参数范围不在0～1之间" userInfo:nil];
        @throw excep;
    }else{
        
        _ratio = ratio;
    }
}

-(void)setTabBarItem:(UITabBarItem *)tabBarItem{
    
    [self setTitle:tabBarItem.title forState:UIControlStateNormal];
    [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [self setImage:tabBarItem.image forState:UIControlStateNormal];
    [self setImage:tabBarItem.selectedImage forState:UIControlStateHighlighted];
    [self setImage:tabBarItem.selectedImage forState:UIControlStateSelected];
}

-(void)setHighlighted:(BOOL)highlighted{
    
}

@end
