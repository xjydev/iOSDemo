//
//  XGuideViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2019/3/20.
//  Copyright © 2019 Xiaodev. All rights reserved.
//

#import "XGuideViewController.h"
#import "ABGuideView.h"
@interface XGuideViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UIView *subView1;

@end

@implementation XGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"引导";
   ABGuideView *v = [[ABGuideView alloc]init];
    v.viewsArray = @[self.button1,self.view1,self.label1,self.subView1];
    [v show];
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
