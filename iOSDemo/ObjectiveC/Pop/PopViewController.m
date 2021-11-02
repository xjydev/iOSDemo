//
//  PopViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2021/10/8.
//  Copyright © 2021 Xiaodev. All rights reserved.
//

#import "PopViewController.h"
#import <Masonry/Masonry.h>
@interface PopViewController ()
@property (nonatomic, strong)UIView *backView;
@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [self.view addSubview:self.backView];
}
- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, self.view.bounds.size.height - 200)];
        _backView.backgroundColor = [UIColor redColor];
    }
    return _backView;
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
