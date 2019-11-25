//
//  XTransferViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2019/7/17.
//  Copyright © 2019 Xiaodev. All rights reserved.
//

#import "XTransferViewController.h"
#import "XWebViewController.h"
@interface XTransferViewController ()<UIPopoverPresentationControllerDelegate>

@end

@implementation XTransferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)button1:(UIButton *)sender {
    XWebViewController *VC = [[XWebViewController alloc]init];
    VC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    VC.popoverPresentationController.backgroundColor = [UIColor clearColor];
    VC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:VC animated:YES completion:^{
        
    }];

}
- (IBAction)button2:(UIButton *)sender {
    XWebViewController *VC = [[XWebViewController alloc]init];
    VC.modalPresentationStyle = UIModalPresentationFormSheet;
    VC.preferredContentSize = CGSizeMake(200, 200);
    VC.popoverPresentationController.backgroundColor = [UIColor clearColor];
    VC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:VC animated:YES completion:^{
        
    }];
}
- (IBAction)button3:(UIButton *)sender {
    XWebViewController *VC = [[XWebViewController alloc]init];
    VC.popoverPresentationController.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];;
    VC.modalPresentationStyle = UIModalPresentationPopover;
    VC.preferredContentSize = CGSizeMake(80, 150);
    VC.popoverPresentationController.sourceView = sender;
    VC.popoverPresentationController.sourceRect =sender.bounds;
    VC.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionDown;
    
    VC.popoverPresentationController.delegate = self;
    [self presentViewController:VC animated:YES completion:^{
        
    }];
}
- (IBAction)button4:(UIButton *)sender {
    UIViewController* modalController = [[UIViewController alloc]init];
    modalController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    modalController.modalPresentationStyle =  UIModalPresentationFormSheet;
    
    CGPoint frameSize = CGPointMake([[UIScreen mainScreen] bounds].size.width*0.95f, [[UIScreen mainScreen] bounds].size.height*0.95f);
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    // Resizing for iOS 8
    modalController.preferredContentSize = CGSizeMake(frameSize.x, frameSize.y);
    // Resizing for <= iOS 7
    modalController.view.superview.frame = CGRectMake((screenWidth - frameSize.x)/2, (screenHeight - frameSize.y)/2, frameSize.x, frameSize.y);
    
    UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [vc presentViewController:modalController animated:YES completion:nil];
}
#pragma mark -- UIPopoverPresentationControllerDelegate
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection {
    return UIModalPresentationNone;
}
- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
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
