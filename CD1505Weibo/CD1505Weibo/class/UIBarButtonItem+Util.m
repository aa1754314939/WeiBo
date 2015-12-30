
//
//  UIBarButtonItem+Util.m
//  CD1505Weibo
//
//  Created by 千锋 on 15/12/30.
//  Copyright © 2015年 Yhphone. All rights reserved.
//

#import "UIBarButtonItem+Util.h"

@implementation UIBarButtonItem (Util)

+(UIBarButtonItem *)generateBarButtonItemWithNormalImageName:(NSString *)norImgName HighlightedImageName:(NSString *)hlImgName{
    
    //1.创建一个按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:norImgName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:hlImgName] forState:UIControlStateHighlighted];
    CGSize size = btn.currentImage.size;
    btn.frame = CGRectMake(0, 0, size.width, size.height);
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    return item;
}

@end
