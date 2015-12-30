//
//  TitleButton.m
//  CD1505Weibo
//
//  Created by 千锋 on 15/12/30.
//  Copyright © 2015年 Yhphone. All rights reserved.
//

#import "TitleButton.h"

@implementation TitleButton

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        _titleRadio = 0.9;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeLeft|UIViewContentModeScaleAspectFit;
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat imgX = _titleRadio * CGRectGetWidth(contentRect);
    CGFloat imgY = 0;
    CGFloat imgW = (1 - _titleRadio) * CGRectGetWidth(contentRect);
    CGFloat imgH = CGRectGetHeight(contentRect);
    
    return CGRectMake(imgX, imgY, imgW, imgH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    CGFloat tX = 0;
    CGFloat tY = 0;
    CGFloat tW = CGRectGetWidth(contentRect) * _titleRadio;
    CGFloat tH = CGRectGetHeight(contentRect);
    return CGRectMake(tX, tY, tW, tH);
}

@end
