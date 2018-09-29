//
//  XcalendarViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 04/06/2018.
//  Copyright © 2018 Xiaodev. All rights reserved.
//

#import "XcalendarViewController.h"
#import "XYCalendarView.h"
#import "ABCalendarController.h"
@interface XcalendarViewController ()

@end

@implementation XcalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"日历";
    self.view.backgroundColor = [UIColor whiteColor];
    XYCalendarView *calendarView = [[XYCalendarView alloc]initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 350)];
    [self.view addSubview:calendarView];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 440, 200, 80);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"日历" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(calendarButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)calendarButtonAction {
    [[ABCalendarController alloc]showSelectedCompletion:^(NSDate *startDate, NSDate *endDate) {
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
