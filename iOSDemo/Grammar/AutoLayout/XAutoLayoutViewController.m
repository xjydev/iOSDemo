//
//  XAutoLayoutViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/4/4.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XAutoLayoutViewController.h"
#import <Masonry/Masonry.h>
#import "XTButton.h"
#import "XYView.h"
@interface XAutoLayoutViewController ()
{
}
@end

@implementation XAutoLayoutViewController
- (void)loadView {
    self.view = [[XYView alloc]init];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    XTButton *button = [XTButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    NSLog(@"1111111");
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view).offset(100);
        make.width.height.equalTo(@100);
    }];
    
}
- (void)buttonAction:(UIButton *)button {
    //实现Autolayout下的动画效果。
    if (button.bounds.size.width == 100) {
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.view).offset(200);
            make.width.height.equalTo(@50);
        }];
    }
    else {
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.view).offset(200);
            make.width.height.equalTo(@100);
        }];
    }
    
    [UIView animateWithDuration:3 animations:^{
        [self.view setNeedsLayout];
//        [self.view layoutIfNeeded];
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"%s",__func__);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
