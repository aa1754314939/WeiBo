//
//  ParallaxCellTableViewCell.m
//  ParallaxDemo
//
//  Created by 千锋 on 15/12/28.
//  Copyright © 2015年 Yhphone. All rights reserved.
//

#import "ParallaxCellTableViewCell.h"

@interface ParallaxCellTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *parallaxImageIView;

@end

@implementation ParallaxCellTableViewCell

-(void)setImageName:(NSString *)imageName{
    
    self.parallaxImageIView.image = [UIImage imageNamed:imageName];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)scrollImageInTableview:(UITableView *)tableView inView:(UIView *)view{
    
    //1.获取cell的在vc.view的 相对frame
    CGRect inSuperViewRect = [tableView convertRect:self.frame toView:view];
    //2.获取cell的起始位置到中线的距离
    CGFloat disFromCenterY = CGRectGetMidY(view.frame)-CGRectGetMinY(inSuperViewRect);
    //3.获取ImageView的高度和 cell高度的差值
    CGFloat diff = CGRectGetHeight(self.parallaxImageIView.frame) - CGRectGetHeight(self.frame);
    //4.获取移动多少
    CGFloat moveDis = disFromCenterY/CGRectGetHeight(view.frame) * diff;
    
    //5.让图片的frame移动距离
    CGRect scrollRect = self.parallaxImageIView.frame;
    scrollRect.origin.y = -(diff/2.0) + moveDis;
    self.parallaxImageIView.frame = scrollRect;
}


@end
