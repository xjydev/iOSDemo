//
//  XYCalendarView.m
//  iOSDemo
//
//  Created by XiaoDev on 04/06/2018.
//  Copyright © 2018 Xiaodev. All rights reserved.
//

#import "XYCalendarView.h"
#import "LXCalender.h"
#import "UIColor+Expanded.h"
#import "XTools.h"
@interface XYCalendarView ()
@property (nonatomic,strong)LXCalendarView *calenderView;
@end

@implementation XYCalendarView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        self.calenderView =[[LXCalendarView alloc]initWithFrame:CGRectMake(20, 0, kScreen_Width - 40, 0)];
        
        self.calenderView.currentMonthTitleColor =[UIColor hexStringToColor:@"2c2c2c"];
        self.calenderView.lastMonthTitleColor =[UIColor hexStringToColor:@"8a8a8a"];
        self.calenderView.nextMonthTitleColor =[UIColor hexStringToColor:@"8a8a8a"];
        
        self.calenderView.isHaveAnimation = YES;
        
        self.calenderView.isCanScroll = YES;
        self.calenderView.isShowLastAndNextBtn = YES;
        
        self.calenderView.todayTitleColor =[UIColor greenColor];
        
        self.calenderView.selectBackColor =[UIColor redColor];
        
        self.calenderView.isShowLastAndNextDate = NO;
        
        [self.calenderView dealData];
        
        self.calenderView.backgroundColor =[UIColor whiteColor];
        [self addSubview:self.calenderView];
        
        self.calenderView.selectBlock = ^(NSInteger year, NSInteger month, NSInteger day) {
            NSLog(@"%ld年 - %ld月 - %ld日",year,month,day);
        };
    }
    return self;
}



@end
