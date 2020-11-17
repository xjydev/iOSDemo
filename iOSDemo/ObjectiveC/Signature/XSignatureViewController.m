//
//  XSignatureViewController.m
//  iOSDemo
//
//  Created by jingyuan5 on 2020/8/31.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XSignatureViewController.h"
#import <LZUberSignature/UBSignatureDrawingViewController.h>
#import "XTools.h"
@interface XSignatureViewController ()<UBSignatureDrawingViewControllerDelegate>
{
    UIImageView *_sigImageView ;
}
@property (nonatomic, strong)UBSignatureDrawingViewController *signatureViewController;
@end

@implementation XSignatureViewController
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"root == %@",[UIApplication sharedApplication].keyWindow.rootViewController);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.signatureViewController = [[UBSignatureDrawingViewController alloc]initWithImage:nil];
    self.signatureViewController.delegate = self;
    [self addChildViewController:self.signatureViewController];
    [self.view addSubview:self.signatureViewController.view];
    
    UIBarButtonItem *bar1 = [[UIBarButtonItem alloc]initWithTitle:@"重新" style:UIBarButtonItemStyleDone target:self action:@selector(barButtonItem1Action)];
    UIBarButtonItem *bar2 = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonItem2Action)];

    self.navigationItem.rightBarButtonItems = @[bar1,bar2];
    _sigImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, kScreen_Height - 100, 80, 100)];
    [self.view addSubview:_sigImageView];
}

- (void)barButtonItem1Action {
    [self.signatureViewController reset];
}
- (void)barButtonItem2Action {
    UIImage *image = [self.signatureViewController fullSignatureImage];
    [_sigImageView setImage:image];
    
}
- (void)signatureDrawingViewController:(UBSignatureDrawingViewController *)signatureDrawingViewController isEmptyDidChange:(BOOL)isEmpty {
    
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
