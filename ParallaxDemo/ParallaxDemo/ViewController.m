//
//  ViewController.m
//  ParallaxDemo
//
//  Created by 千锋 on 15/12/28.
//  Copyright © 2015年 Yhphone. All rights reserved.
//

#import "ViewController.h"
#import "ParallaxCellTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)NSMutableArray * imgNameArr;

@end

@implementation ViewController

/*懒加载*/
-(NSMutableArray *)imgNameArr{
    
    if (_imgNameArr == nil) {
        _imgNameArr = @[].mutableCopy;
        for (int ind = 0; ind < 14; ind++) {
            NSString * imgName = [NSString stringWithFormat:@"image%03d.jpg",ind];
            [_imgNameArr addObject:imgName];
            
        }
    }
    return _imgNameArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource & UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.imgNameArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ParallaxCellTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ParallaxCell"];
    
    cell.imageName = self.imgNameArr[indexPath.row];
    return cell;
}

//只要tableView滑动 cell就滑动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //需要让cell跟着滑动
    NSArray * cells = [self.tableView visibleCells];
    
    for (ParallaxCellTableViewCell * cell in cells) {
        [cell scrollImageInTableview:self.tableView inView:self.view];
    }
}


@end
