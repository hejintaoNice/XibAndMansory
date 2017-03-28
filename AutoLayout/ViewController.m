//
//  ViewController.m
//  AutoLayout
//
//  Created by hejintao on 2017/3/28.
//  Copyright © 2017年 hither. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *mansoryContainView;

@property (nonatomic,strong) UIView *view0;
@property (nonatomic,strong) UIView *view1;
@property (nonatomic,strong) UIView *view2;
@property (nonatomic,strong) UIView *view3;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
}

#pragma mark -- xib  设置等宽等高约束
/*
 1.摆好需要设置的按钮 设置第一个左边 上边 以及高度的约束
 2. 第二个设置和第一个的水平约束 ，  第三个设置和 第二个的水平约束  ，  第四个设置与第三个的水平约束 并设置距离右边的约束
 3. 将4个按钮选中  设置他们处在同一水平线
 4. 在xib中从1 向2  拖线  让1 2 等高等宽（按住shift 可以多选） 2 3， 3 4 同样的操作
 5. 最后调整约束 微调
 
 */

#pragma mark -- mansory 设置等高等宽
/*
 1.设置第一的上 下 左 距离容器的约束 ，并设置第一个和第二个的水平约束
 2.设置第二个 与 第一个 出在同一水平线 ，设置宽高与第一个相同，并设置和第三个的水平约束
 3.设置第三个  与  第二个处在同一水平线，设置宽高 与第二个相同，并设置与第四个的水平约束
 4.设置第四个右边与容器的约束，设置与第三个处在同一水平线  设置与第三个 等高 等宽
 */

-(void)configSubViews{
    _view0 = [[UIView alloc]init];
    _view0.backgroundColor = [UIColor redColor];
    [_mansoryContainView addSubview:_view0];
    
    _view1 = [[UIView alloc]init];
    _view1.backgroundColor = [UIColor blueColor];
    [_mansoryContainView addSubview:_view1];
    
    _view2 = [[UIView alloc]init];
    _view2.backgroundColor = [UIColor yellowColor];
    [_mansoryContainView addSubview:_view2];
    
    _view3 = [[UIView alloc]init];
    _view3.backgroundColor = [UIColor greenColor];
    [_mansoryContainView addSubview:_view3];
    
    [self configRestrain];
}

-(void)configRestrain{
    [_view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.equalTo(_mansoryContainView);
        make.right.equalTo(_view1.mas_left);
    }];
    
    [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_view0.mas_centerY);
        make.right.equalTo(_view2.mas_left);
        make.width.height.equalTo(_view0);
    }];
    
    [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_view1.mas_centerY);
        make.right.equalTo(_view3.mas_left);
        make.width.height.equalTo(_view1);
    }];
    
    [_view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_mansoryContainView);
        make.centerY.equalTo(_view2.mas_centerY);
        make.width.height.equalTo(_view2);
    }];
}





@end
