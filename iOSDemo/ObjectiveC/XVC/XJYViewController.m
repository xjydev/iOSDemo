//
//  XJYViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/4/7.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XJYViewController.h"

@interface XJYViewController ()

@end

@implementation XJYViewController
+ (void)load {
    NSLog(@"生命周期 == %s",__func__);
}
+(void)initialize {
    
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    NSLog(@"生命周期 == %s",__func__);
    return self;
}
- (id)init {
    self = [super init];
    NSLog(@"生命周期 == %s",__func__);
    return self;
}
- (void)loadView {
    [super loadView];
    NSLog(@"生命周期 == %s",__func__);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"生命周期 == %s",__func__);
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"生命周期 == %s",__func__);
}
- (void)viewWillLayoutSubviews {
    NSLog(@"生命周期 == %s",__func__);
}
- (void)viewDidLayoutSubviews {
    NSLog(@"生命周期 == %s",__func__);
}
- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"生命周期 == %s",__func__);
}
- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"生命周期 == %s",__func__);
}
- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"生命周期 == %s",__func__);
}
- (void)dealloc {
    NSLog(@"生命周期 == %s",__func__);
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
