//
//  LottieViewController.m
//  iOSDemo
//
//  Created by jingyuan5 on 2020/12/1.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "LottieViewController.h"
#import <SVGAPlayer/SVGAPlayer.h>
#import <SVGAPlayer/SVGA.h>
#import <mach/mach_time.h>
#import "XTools.h"
#import "UIBezierPath+BesselCurve.h"
@interface LottieViewController ()<SVGAPlayerDelegate>
{
    UInt64 _startTime;
    UInt64 _endTime;
}
@property (nonatomic, strong)SVGAPlayer *player;
@property (nonatomic, strong)SVGAParser *parser;

@property (nonatomic, strong)UIView *backView;
@end

@implementation LottieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UILabel *label = [[UILabel alloc]initWithFrame:self.view.bounds];
//    label.numberOfLines = 0;
//    label.font = [UIFont systemFontOfSize:50];
//    label.textColor = [UIColor whiteColor];
//    label.text = @"背景背景背景背景背景背景背景背景背景背景背景背景背景背景背景背景背景背景背景背景背景背景背景景背景背景背景景背景背景背景景背景背景背景景背景背景背景景背景背景背景背景背景背景背景背景背景背景背景背景";
//    [self.view addSubview:label];
//    [self.view addSubview:self.player];
//
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(50, kScreen_Height - 60, 100, 40);
//    button.backgroundColor = [UIColor redColor];
//    [button setTitle:@"本地动画" forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(showLocationAnimation) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
//
//    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    button1.frame = CGRectMake(kScreen_Width - 150, kScreen_Height - 60,100, 40);
//    button1.backgroundColor = [UIColor redColor];
//    [button1 setTitle:@"网络动画" forState:UIControlStateNormal];
//    [button1 addTarget:self action:@selector(showAnimation) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button1];
//    NSLog(@"----------%@",[self stringWithNum:123]);
//    NSLog(@"----------%@",[self stringWithNum:12334]);
//    NSLog(@"----------%@",[self stringWithNum:1234566]);
//    NSLog(@"----------%@",[self stringWithNum:14235678]);
//    NSLog(@"----------%@",[self stringWithNum:123235345]);
//    NSLog(@"----------%@",[self stringWithNum:1233454656]);
//    NSLog(@"----------%@",[self stringWithNum:123434667533]);
//    NSLog(@"----------%@",[self stringWithNum:1234346675342345]);
    
    [self showbize];
}
- (void)showbize {
    self.backView = [[UIView alloc]initWithFrame:CGRectMake(100, 50, 100, 400)];
    self.backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.backView];
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(50, 400)];
    CGFloat sp = 40.0f;
    CGFloat spy = 60.0f;
    NSValue *point1 = [NSValue valueWithCGPoint:CGPointMake(50+ sp,400 - spy*1)];
    NSValue *point2 = [NSValue valueWithCGPoint:CGPointMake(50- sp,400 - spy*2)];
    NSValue *point3 = [NSValue valueWithCGPoint:CGPointMake(50+ sp,400 - spy*3)];
    NSValue *point4 = [NSValue valueWithCGPoint:CGPointMake(50- sp,400 - spy*4)];
    NSValue *point5 = [NSValue valueWithCGPoint:CGPointMake(50+ sp,400 - spy*5)];
    NSValue *point6 = [NSValue valueWithCGPoint:CGPointMake(50- sp,400 - spy*6)];
    bezierPath.contractionFactor = -0.8;
    NSMutableArray *arr = [NSMutableArray arrayWithArray:@[point1,point2,point3,point4,point5,point6]];
    [bezierPath addBezierThroughPoints:arr];
    //一个曲线
    //路径样式
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bezierPath.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor; //填充色<默认黑色>
    shapeLayer.strokeColor = [UIColor redColor].CGColor; //线色
    shapeLayer.lineWidth = 2;
    [self.backView.layer addSublayer:shapeLayer];
    for (NSValue *V in arr) {
        [self setViewWithValue:V];
    }
}
- (void)setViewWithValue:(NSValue *)value {
    CGPoint point = value.CGPointValue;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(point.x, point.y, 2, 2)];
    view.backgroundColor = [UIColor blueColor];
    [self.backView addSubview:view];
}
- (NSString *)stringWithNum:(NSInteger)num {
    if (num < 10000) {//万以下
        return [NSString stringWithFormat:@"%@",@(num)];
    }
    else if (num < 1000000) {//百万以下
        return [NSString stringWithFormat:@"%.1f万",num/10000.0];
    }
    else if (num < 100000000) {//亿以下
        return [NSString stringWithFormat:@"%.0f万",num/10000.0];
    }
    else if (num < 10000000000) {//百亿以下
        return [NSString stringWithFormat:@"%.1f亿",num/100000000.0];
    }
    else if (num < 999999999999) {//9千亿以下
        return [NSString stringWithFormat:@"%.0f亿",num/100000000.0];
    }
    else {
        return @"9999+亿";
    }
}
- (SVGAPlayer *)player{
    if (!_player) {
        _player = [[SVGAPlayer alloc]init];
        _player.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Width);
        _player.loops = 1;
        _player.clearsAfterStop = YES;
        _player.delegate = self;
    }
    return _player;
}
- (void)viewDidLayoutSubviews {
    _player.center = self.view.center;
}
- (SVGAParser *)parser {
    if (!_parser) {
        _parser = [[SVGAParser alloc] init];
    }
    return _parser;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    _startTime = mach_absolute_time();
//    [self showLocationAnimation];
//    [self showAnimation];
//    UITouch *touch = touches.allObjects.lastObject;
//    if (touch) {
//        CGPoint point = [ui]
//    }
    [self showLikeviewWithPoint:CGPointMake(200, 500)];
}
- (void)showLikeviewWithPoint:(CGPoint)point {
    UIView *likeView = [[UIView alloc]initWithFrame:CGRectMake(point.x, point.y, 40, 40)];
    likeView.backgroundColor = [UIColor redColor];
    [self.view addSubview:likeView];
    [self animationWithView:likeView fromSelf:self];
}
- (void)animationWithView:(UIView *)likeView fromSelf:(BOOL)isSelf{
    CGFloat boomAlpha = 1.0;
   
    likeView.alpha = boomAlpha;
    CGFloat zoomBottom = 400;
    CGFloat zoomTop = 0;
    CGFloat zoomLeft = 100;
    CGFloat zoomRight = 300;
    
    CGFloat randomCenterX = zoomRight - zoomLeft == 0 ? zoomLeft : ((random()%(long)(zoomRight - zoomLeft)) + zoomLeft);
    CGFloat randomCenterY = zoomBottom - zoomTop == 0 ? zoomTop : ((random()%(long)(zoomBottom - zoomTop)) + zoomTop);
    
   
    
//    CAKeyframeAnimation *fadeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
//    fadeAnimation.repeatCount = 1;
//    fadeAnimation.duration = 3.0;
//    fadeAnimation.values = @[[NSNumber numberWithFloat:boomAlpha], [NSNumber numberWithFloat:boomAlpha], [NSNumber numberWithFloat:0]];
//    fadeAnimation.keyTimes = @[[NSNumber numberWithFloat:0], [NSNumber numberWithFloat:0.36f], [NSNumber numberWithFloat:1]];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    [path moveToPoint:CGPointMake(200, 500)];
    [path addArcWithCenter:CGPointMake(200, 400) radius:100 startAngle:0 endAngle:180 clockwise:YES];
//    [path addQuadCurveToPoint:CGPointMake(200, 400) controlPoint:CGPointMake(100, 100)];
//    [path addQuadCurveToPoint:CGPointMake(250, 200) controlPoint:CGPointMake(200, 100)];
    
    CAKeyframeAnimation *fadeOutAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    fadeOutAnimation.repeatCount = 1;
    fadeOutAnimation.path = path.CGPath;
    fadeOutAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
//    CAKeyframeAnimation *zoomAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
//    zoomAnimation.repeatCount = 1;
//    zoomAnimation.duration = 3.0;
//    zoomAnimation.values = @[[NSNumber numberWithFloat:0.18], [NSNumber numberWithFloat:1.f], [NSNumber numberWithFloat:0.36f]];
//    zoomAnimation.keyTimes = @[[NSNumber numberWithFloat:0], [NSNumber numberWithFloat:0.36f], [NSNumber numberWithFloat:1]];
    
    
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.delegate = self;
    animationGroup.beginTime = CACurrentMediaTime();
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    animationGroup.duration = 1.0;
    animationGroup.animations = @[ fadeOutAnimation];//zoomAnimation, fadeAnimation,
    [animationGroup setValue:likeView forKey:@"likeview"];
    
    [likeView.layer addAnimation:animationGroup forKey:@"fade"];
}
- (void)showLocationAnimation {
    
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"la" ofType:@"svga"];
//    [self.parser parseWithURL:[NSURL fileURLWithPath:path] completionBlock:^(SVGAVideoEntity * _Nullable videoItem) {
//        NSLog(@"start ---------");
//        self.player.videoItem = videoItem;
//        [self.player startAnimation];
//    } failureBlock:^(NSError * _Nonnull error) {
//        NSLog(@"Error: %@",error);
//    }];
//    [self.parser parseWithNamed:@"la.svga" inBundle:nil completionBlock:^(SVGAVideoEntity * _Nonnull videoItem) {
//        NSLog(@"start ---------");
//        self.player.videoItem = videoItem;
//        [self.player startAnimation];
//    } failureBlock:^(NSError * _Nonnull error) {
//        NSLog(@"Error: %@",error);
//    }];
}
- (void)showAnimation {
    static int a = 0;
    NSArray *items = @[
                       @"https://github.com/yyued/SVGA-Samples/blob/master/EmptyState.svga?raw=true",
                       @"https://github.com/yyued/SVGA-Samples/blob/master/HamburgerArrow.svga?raw=true",
                       @"https://github.com/yyued/SVGA-Samples/blob/master/PinJump.svga?raw=true",
                       @"https://github.com/svga/SVGA-Samples/raw/master/Rocket.svga",
                       @"https://github.com/yyued/SVGA-Samples/blob/master/TwitterHeart.svga?raw=true",
                       @"https://github.com/yyued/SVGA-Samples/blob/master/Walkthrough.svga?raw=true",
                       @"https://github.com/yyued/SVGA-Samples/blob/master/angel.svga?raw=true",
                       @"https://github.com/yyued/SVGA-Samples/blob/master/halloween.svga?raw=true",
                       @"https://github.com/yyued/SVGA-Samples/blob/master/kingset.svga?raw=true",
                       @"https://github.com/yyued/SVGA-Samples/blob/master/posche.svga?raw=true",
                       @"https://github.com/yyued/SVGA-Samples/blob/master/rose.svga?raw=true",
                       @"http://weiyinyue.music.sina.com.cn/weibo_media_admin/file/medialive/testeffect.svga"
                       ];
   
//    parser.enabledMemoryCache = YES;
    //items[a % items.count]
    [self.parser parseWithURL:[NSURL URLWithString:items.lastObject]
         completionBlock:^(SVGAVideoEntity * _Nullable videoItem) {
             [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
             if (videoItem != nil) {
                 self.player.videoItem = videoItem;
                 NSMutableParagraphStyle *para = [[NSMutableParagraphStyle alloc] init];
                 [para setLineBreakMode:NSLineBreakByTruncatingTail];
                 [para setAlignment:NSTextAlignmentCenter];
                 NSAttributedString *str = [[NSAttributedString alloc]
                                            initWithString:@"Hello, World! Hello, World!"
                                            attributes:@{
                                                NSFontAttributeName: [UIFont systemFontOfSize:28],
                                                NSForegroundColorAttributeName: [UIColor whiteColor],
                                                NSParagraphStyleAttributeName: para,
                                            }];
                 [self.player setAttributedText:str forKey:@"banner"];

                 [self.player startAnimation];
                 
//                 [self.aPlayer startAnimationWithRange:NSMakeRange(10, 25) reverse:YES];
             }
    } failureBlock:^(NSError * _Nullable error) {
        
    }];
    a++;
}
#pragma - mark SVGAPlayer Delegate
- (void)svgaPlayerDidAnimatedToPercentage:(CGFloat)percentage {
    if (percentage < 0.02) {
        _endTime = mach_absolute_time();
        NSLog(@"t ==== %llu",_endTime - _startTime);
    }
    NSLog(@"p == %@",@(percentage));
}
- (void)svgaPlayerDidAnimatedToFrame:(NSInteger)frame {
    NSLog(@"f == %@",@(frame));
}
- (void)svgaPlayerDidFinishedAnimation:(SVGAPlayer *)player {
   
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
