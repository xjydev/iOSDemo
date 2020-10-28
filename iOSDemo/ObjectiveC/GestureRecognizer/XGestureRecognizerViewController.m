//
//  XGestureRecognizerViewController.m
//  iOSDemo
//
//  Created by jingyuan5 on 2020/10/23.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XGestureRecognizerViewController.h"
#import "XTools.h"
#import "XGSubViewController.h"

@interface XGestureRecognizerViewController ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong)XGSubViewController *moreviewLiveVC;
@property (nonatomic, strong)UIScreenEdgePanGestureRecognizer *edgePan;
@property (nonatomic, strong)UIPanGestureRecognizer *closePan;
@end

@implementation XGestureRecognizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, kScreen_Width, kScreen_Height - 100)];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*2, self.view.bounds.size.height);
    scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollView];
    
    [self.view addGestureRecognizer:self.edgePan];
    
   
}
- (UIScreenEdgePanGestureRecognizer *)edgePan {
    if (!_edgePan) {
        _edgePan = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(edgePan:)];
        _edgePan.edges = UIRectEdgeRight;
        _edgePan.delegate = self;
    }
    return _edgePan;
}
- (UIPanGestureRecognizer *)closePan {
    if (!_closePan) {
        _closePan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(closePanGesture:)];
    }
    return _closePan;
}
- (void)addsubVC {
    self.moreviewLiveVC = [[XGSubViewController alloc]init];
    [self addChildViewController:self.moreviewLiveVC];
    self.moreviewLiveVC.view.transform = CGAffineTransformMakeTranslation(self.view.bounds.size.width, 0);
    [self.view addSubview:self.moreviewLiveVC.view];
}
- (void)edgePan:(UIScreenEdgePanGestureRecognizer *)pan {
    
    float offsetX = [pan translationInView:pan.view].x;
    NSLog(@"panstate == %@ ---- %@",@(pan.state),@(offsetX));
    if (pan.state == UIGestureRecognizerStateBegan) {
        [self addsubVC];
    }
    else if (pan.state == UIGestureRecognizerStateChanged) {
        self.moreviewLiveVC.view.transform = CGAffineTransformMakeTranslation(MAX(kScreen_Width + offsetX, 0), 0);
    }
    else if (pan.state == UIGestureRecognizerStateEnded ||pan.state == UIGestureRecognizerStateCancelled || pan.state == UIGestureRecognizerStateFailed) {
        if (offsetX < -(kScreen_Width - 30) *0.4 ) {
            [self openMoreLivewVC];
        }
        else {
            [self closeMoreLiveVC];
        }
    }
}
- (void)openMoreLivewVC {
    [UIView animateWithDuration:0.25 animations:^{
        self.moreviewLiveVC.view.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
        [self.view removeGestureRecognizer:self.edgePan];
        [self.view addGestureRecognizer:self.closePan];
    }];
}
- (void)closeMoreLiveVC {
    [UIView animateWithDuration:0.25 animations:^{
        self.moreviewLiveVC.view.transform = CGAffineTransformMakeTranslation(self.view.frame.size.width, 0);
    } completion:^(BOOL finished) {
        [self.view addGestureRecognizer:self.edgePan];
        [self.view removeGestureRecognizer:self.closePan];
    }];
}

- (void)closePanGesture:(UIPanGestureRecognizer *)pan {
    float offsetX = [pan translationInView:pan.view].x;
    if (offsetX < 0) {
        return;
    }
    if (pan.state == UIGestureRecognizerStateChanged && offsetX >= 0 ) {
        
        self.moreviewLiveVC.view.transform = CGAffineTransformMakeTranslation( offsetX, 0);
    }
    else
        if (pan.state == UIGestureRecognizerStateEnded ||pan.state == UIGestureRecognizerStateCancelled || pan.state == UIGestureRecognizerStateFailed) {
            if (offsetX < (kScreen_Width - 30) *0.4 ) {
                [self openMoreLivewVC];
            }
            else {
                [self closeMoreLiveVC];
            }
        }
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
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
