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
    [self.view addSubview:self.player];
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
    
//    [self showbize];
}
- (void)showbize {
    self.backView = [[UIView alloc]initWithFrame:CGRectMake(100, 150, 100, 400)];
    self.backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.backView];
    UIView *cView = [[UIView alloc]initWithFrame: CGRectMake(30, 400, 30, 30)];
    cView.backgroundColor = [UIColor redColor];
    [self.backView addSubview:cView];
    cView.transform = CGAffineTransformMakeScale(0.18, 0.18);
    [UIView animateWithDuration:0.5 animations:^{
        cView.center = CGPointMake(30, 340);
        cView.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        path.lineCapStyle = kCGLineCapRound;
        path.lineJoinStyle = kCGLineJoinRound;
        [path moveToPoint:cView.center];
        CGFloat startOff = arc4random_uniform(40);
//        [path addLineToPoint:CGPointMake(randomCenterX, randomCenterY)];
        CGFloat randomCenterX = self.backView.frame.size.width/2.0 - 20 +  startOff;
        CGFloat randomCenterY = self.backView.frame.size.height  - 60 - startOff/2.0;
        
        CGFloat offx = arc4random_uniform(40);
        CGPoint endPoint = CGPointMake(cView.center.x + (20 - offx), 20);
        NSInteger j = arc4random_uniform(2);
        NSInteger travelDirection = 1- (2*j);//随机放向 -1 OR 1
        NSInteger x1 = randomCenterX + travelDirection*(arc4random_uniform(20) + 50);
        NSInteger y1 = randomCenterY - 80 + travelDirection*arc4random_uniform(20);
        NSInteger x2 = randomCenterX - travelDirection*(arc4random_uniform(20) + 50);
        NSInteger y2 = randomCenterY - 120 + travelDirection*arc4random_uniform(20);
        CGPoint controlPoint1 = CGPointMake(x1, y1);//control根据自己动画想要的效果做灵活的调整
        CGPoint controlPoint2 = CGPointMake(x2, y2);
        [path addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
        CAKeyframeAnimation *fadeOutAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        fadeOutAnimation.repeatCount = 1;
        fadeOutAnimation.path = path.CGPath;
        fadeOutAnimation.calculationMode = kCAAnimationPaced;
        fadeOutAnimation.duration =3.0;
        [cView.layer addAnimation:fadeOutAnimation forKey:@"fade"];
    }];
    
    
    
    //一个曲线
    //路径样式
   
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
        _player.frame = CGRectMake(50, 50, 200, 200);
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
//    [self showLikeviewWithPoint:CGPointMake(200, 500)];
//    [self showbize];
    [self showLocationAnimation];
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
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"la" ofType:@"svga"];
    [self.parser parseWithURL:[NSURL fileURLWithPath:path] completionBlock:^(SVGAVideoEntity * _Nullable videoItem) {
        NSLog(@"start ---------");
        self.player.videoItem = videoItem;
        [self.player startAnimation];
    } failureBlock:^(NSError * _Nonnull error) {
        NSLog(@"Error: %@",error);
    }];
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
