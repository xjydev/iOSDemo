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
@property (nonatomic, strong)UIView *aView;
@property (nonatomic, weak)NSObject *weakObj1;
@property (nonatomic, weak)NSObject *weakObj2;
@end

@implementation XAutoLayoutViewController
- (void)loadView {
    self.view = [[XYView alloc]init];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.aView = [[UIView alloc]init];
    self.aView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.aView];
    NSLog(@"1111111  == %@",self.aView);
    [self.aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view).offset(40);
        make.width.height.equalTo(@100);
    }];
    NSLog(@"1111122  == %@",self.aView);
    XTButton *button = [XTButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
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
    NSLog(@"weak1 == %@ -- %@",self.weakObj1,self.weakObj2);
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.weakObj1 = button1;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 100)];
    self.weakObj2 = view;
    NSLog(@"weak2 == %@ -- %@",self.weakObj1,self.weakObj2);
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event { 
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"1111133  == %@",self.aView);
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"%s",__func__);
    NSLog(@"1111144  == %@",self.aView);
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"1111155  == %@",self.aView);
}
- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"1111166  == %@",self.aView);
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
