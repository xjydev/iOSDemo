//
//  XGSubViewController.m
//  iOSDemo
//
//  Created by jingyuan5 on 2020/10/26.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XGSubViewController.h"

@interface XGSubViewController ()

@end

@implementation XGSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
}
- (void)dealloc {
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
