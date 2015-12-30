//
//  UIScrollView+Scale.m
//  SideMenuDemo
//
//  Created by 千锋 on 15/12/28.
//  Copyright © 2015年 Yhphone. All rights reserved.
//

#import "UIScrollView+Scale.h"
//在类别里定义属性要用到运行时
#import <objc/runtime.h>

static const NSString * kScaleView = @"kScaleView";

static NSString * kContentOffset = @"contentOffset";

#define Height 200

@implementation ScaleView

//setscrollView的方法
-(void)setScrollView:(UIScrollView *)scrollView{
    
    [_scrollView removeObserver:self forKeyPath:kContentOffset];
    //观察位置到变化
    //KVO 观察者模式
    _scrollView = scrollView;
    [_scrollView addObserver:self forKeyPath:kContentOffset options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    //刷新当前视图的大小
    //注册当前视图需要更新，在下一个消息循环的时候就会调用
    [self setNeedsLayout];
}

/**
 *  布局子控件
 */

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    if (_scrollView.contentOffset.y < 0) {
        
        CGFloat offset = _scrollView.contentOffset.y;
        self.frame = CGRectMake(offset, offset, CGRectGetWidth(_scrollView.frame) - (offset)*2, -offset + Height) ;
    }else{
        CGFloat offset = _scrollView.contentOffset.y;
        self.frame = CGRectMake(0, 0, CGRectGetWidth(_scrollView.frame) - (offset)*2, -offset + Height) ;
    }
}

-(void)dealloc{
    
    [_scrollView removeObserver:self forKeyPath:kContentOffset];
}

-(void)removeFromSuperview{
    
    [_scrollView removeObserver:self forKeyPath:kContentOffset];
}

@end

@implementation UIScrollView (Scale)

//setter 方法
-(void)setScaleView:(ScaleView *)scaleView{
    
    //用运行时给UIScrollView绑定一个属性
    objc_setAssociatedObject(self, &kScaleView, scaleView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
//getter 方法
-(ScaleView *)scaleView{
    
    return objc_getAssociatedObject(self, &kScaleView);
}

-(void)addScaleImageViewWithImage:(UIImage *)image{
    
    //创建一个ScaleView
    ScaleView * scaleView = [[ScaleView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), Height)];
    scaleView.image = image;
    scaleView.scrollView = self;
    [self addSubview:scaleView];
    [self sendSubviewToBack:scaleView];
    self.scaleView = scaleView;
}

-(void)removeScaleImageView{
    
    [self.scaleView removeFromSuperview];
    self.scaleView = nil;
}

@end
