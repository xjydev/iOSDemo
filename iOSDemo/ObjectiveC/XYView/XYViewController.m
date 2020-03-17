//
//  XYViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 06/06/2018.
//  Copyright © 2018 Xiaodev. All rights reserved.
//https://www.jianshu.com/p/44a5b59e7e85
//无法交互的情况
//1.userInteractionEnabled= NO 如果父视图不能与用户交互, 那么所有子控件也不能与用户交互
//2.hidden= YES
//3.alpha= 0.0 ~ 0.01
//4.子视图的位置超出了父视图的有效范围, 那么子视图超出部分无法与用户交互的
//5.UIImageView的userInteractionEnabled默认是NO，因此UIImageView以及它的子控件默认是不能接收触摸事件的




#import "XYViewController.h"
#import "XYView.h"
#import "XPropertyViewController.h"
@interface XYViewController ()
{
    UIView *_boundView;
    UIView *_frameView;
}
@property (nonatomic, copy)NSString *str;
@end

@implementation XYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UIView";
    self.view.backgroundColor = [UIColor whiteColor];
    XYView *view = [[XYView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    _boundView = [[UIView alloc]initWithFrame:CGRectMake(0, 200, 100, 100)];
    _frameView = [[UIView alloc]initWithFrame:CGRectMake(150, 200, 100, 100)];
    _boundView.backgroundColor = [UIColor redColor];
    _frameView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_boundView];
    [self.view addSubview:_frameView];
    self.str = @"222222";
    extern int sta2;//可以引用
//    extern int sta;//使用static定义的不可以引用。
    NSLog(@"extern== %d",sta2);//extern 3
    NSLog(@"externstr == %@",ExternStr);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];//视图中的所有对象
    CGPoint supPoint = [touch locationInView:self.view];
    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    if (CGRectContainsPoint(_boundView.frame, supPoint)) {
        [UIView animateWithDuration:0.5 animations:^{
            self->_boundView.bounds = CGRectMake(0, 0, 50, 50);
        }];
    }
    else if (CGRectContainsPoint(_frameView.frame, supPoint)){
        [UIView animateWithDuration:0.5 animations:^{
//            _frameView.frame = CGRectMake(150, 200, 50, 50);
        }];
    }
    else if (CGRectContainsPoint(CGRectMake(0, 0, 200, 200), supPoint)) {//是否某个区域包含一个点
        NSLog(@"containspoint");
    }
    else
    {
      NSLog(@"dontcontainspoint");
    }
   
    
    
}
- (void)notify {
}
//一根或者多根手指在view上移动（随着手指的移动，会持续调用该方法）
-(void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    
}

//一根或者多根手指离开view（手指抬起）
-(void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
    
}

//某个系统事件(例如电话呼入)打断触摸过程
-(void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
    NSLog(@"delloc ===== view ");
     [[NSNotificationCenter defaultCenter]removeObserver:self];
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
