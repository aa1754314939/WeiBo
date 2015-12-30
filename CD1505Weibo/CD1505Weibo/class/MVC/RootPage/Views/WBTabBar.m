//
//  WBTabBar.m
//  CD1505Weibo
//
//  Created by 千锋 on 15/12/29.
//  Copyright © 2015年 Yhphone. All rights reserved.
//

#import "WBTabBar.h"
#import "WBTabBarButton.h"

@interface WBTabBar()
/**
 *  按钮数组
 */
@property(nonatomic,strong)NSMutableArray * buttonArray;

@property(nonatomic,strong)WBTabBarButton * seletButton;

@property(nonatomic,strong)UIButton *plusBtn;

@end

@implementation WBTabBar

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        //创建一个按钮 设置一次性的属性
        UIButton * plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:plusBtn];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusBtn addTarget:self action:@selector(plubBtnBlock:) forControlEvents:UIControlEventTouchDown];
        self.plusBtn = plusBtn;
    }
    return self;
}

-(NSMutableArray *)buttonArray{
    
    if (_buttonArray == nil) {
        _buttonArray = [[NSMutableArray alloc]init];
    }
    return _buttonArray;
}

-(void)setTabBarItem:(UITabBarItem *)tabBarItem{
    
    //获取到标题 title 图片等信息
    
    WBTabBarButton * button = [WBTabBarButton buttonWithType:UIButtonTypeCustom];
    button.tabBarItem = tabBarItem;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
    [self.buttonArray addObject:button];
    if (self.buttonArray.count == 1) {
        button.selected = YES;
        _seletButton = button;
    }
    
    
    
    //button.imageEdgeInsets = UIEdgeInsetsMake(0, 30, 20, 10);
}

-(void)layoutSubviews{
    [super layoutSubviews];
    //布局
    
    CGFloat btnW = CGRectGetWidth(self.frame)/((CGFloat)self.buttonArray.count + 1);
    //CGFloat plusW = self.plusBtn.currentBackgroundImage.size.width;
    //CGFloat plusH = self.plusBtn.currentBackgroundImage.size.height;
    self.plusBtn.frame = CGRectMake(0, 0, 50, 40);
    self.plusBtn.center = CGPointMake(CGRectGetWidth(self.frame)*0.5, CGRectGetHeight(self.frame)*0.5-5);
    for (int index = 0; index < self.buttonArray.count; index++) {
        
        WBTabBarButton *btn = self.buttonArray[index];
        CGFloat bX;
        if (index > 1) {
            bX = (index+1) * btnW;
        }else{
            bX = index * btnW;
        }
        
        CGFloat bY = 0;
        CGFloat bWidth = btnW;
        CGFloat bheight = CGRectGetHeight(self.frame);
        btn.frame = CGRectMake(bX, bY, bWidth, bheight);
    }
    
}
#pragma mark - 按钮点击
-(void)buttonPressed:(WBTabBarButton *)sender{
    
    //1.
//    for (WBTabBarButton * btn in self.buttonArray) {
//        btn.selected = NO;
//    }
//    sender.selected = !sender.selected;
    //2.
    _seletButton.selected = NO;
    sender.selected = YES;
    _seletButton = sender;
    NSInteger index = [self.buttonArray indexOfObject:sender];
//    if ([_delegate respondsToSelector:@selector(passIndex:)]) {
//        [_delegate passIndex:index];
//    }
    
    if (_passBlock) {
        _passBlock(index);
    }
}

-(void)plubBtnBlock:(UIButton *)sender{
    
    if (_plubBlock) {
        _plubBlock();
    }
}



@end
