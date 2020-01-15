//
//  XGuideViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2019/3/20.
//  Copyright © 2019 Xiaodev. All rights reserved.
//

#import "XGuideViewController.h"
#import "ABGuideView.h"
//arc4random() > random() > rand()
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
//    _button1 addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
}
- (IBAction)buttonAction:(id)sender {
    NSLog(@"%d %ld %d",arc4random()%100,random()%100,rand()%100);
    
}
// 47 83 7
// 32 86 49
// 56 77 73
//91 15 58
//26 93 30
//42 35 72
//33 86 44
//25 92 78



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
