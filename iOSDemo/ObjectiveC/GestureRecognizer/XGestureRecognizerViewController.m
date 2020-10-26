//
//  XGestureRecognizerViewController.m
//  iOSDemo
//
//  Created by jingyuan5 on 2020/10/23.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XGestureRecognizerViewController.h"
#import "XTools.h"

@interface XGestureRecognizerViewController ()<UIGestureRecognizerDelegate>

@end

@implementation XGestureRecognizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, kScreen_Width, kScreen_Height - 100)];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*2, self.view.bounds.size.height);
    scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollView];
    UIScreenEdgePanGestureRecognizer *edgePan = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(edgePan:)];
    edgePan.edges = UIRectEdgeRight;
    edgePan.delegate = self;
    [self.view addGestureRecognizer:edgePan];
}
- (void)edgePan:(UIScreenEdgePanGestureRecognizer *)pan {
    NSLog(@"panstate == %@",@(pan.state));
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
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
