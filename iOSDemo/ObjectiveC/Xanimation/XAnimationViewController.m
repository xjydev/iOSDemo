//
//  XAnimationViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/19.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XAnimationViewController.h"
#import "XTools.h"
@interface XAnimationViewController ()<CAAnimationDelegate>
@property (nonatomic , strong)UIButton *currentButton;
@end

@implementation XAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createButtons];
}
- (void)createButtons {
    for (int i = 0; i<9; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(50+i%3*100,kScreen_Height - 300 +i/3*100, 80, 80);
        button.tag = i+300;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor redColor];
        [button setTitle:[NSString stringWithFormat:@"%@",@(i)] forState:UIControlStateNormal];
        [self.view addSubview:button];
    }
}
- (void)buttonAction:(UIButton *)button {
    self.currentButton = button;
    switch (button.tag - 300) {
        case 0:
        {
//            CABasicAnimation *animation = [CABasicAnimation animation];
//            animation.keyPath = @"backgroundColor";
//            实例化同时指定动画类型
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
            //步骤2：设定动画属性
            animation.autoreverses = NO;
            animation.duration = 0.25;
            animation.repeatCount = 1;
            animation.removedOnCompletion = YES;
            animation.fillMode = kCAFillModeBoth;
            animation.delegate = self;
            UIColor *randomColor = [UIColor blueColor];
            if (button.backgroundColor != [UIColor redColor] ) {
                randomColor = [UIColor redColor];
            }
            animation.toValue = (__bridge id _Nullable)(randomColor.CGColor);
            //步骤3：添加动画到图层
            [button.layer addAnimation:animation forKey:@"keyPath_backgroundColor"];
        }
            break;
        case 1:{
            CAKeyframeAnimation *framA = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(50, 100)];
            NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(320 -50, 100)];
            NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(320 -50, 320- 100)];
            NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(50, 320 -100)];
            NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(50, 100)];
            framA.values = @[value1,value2,value3,value4,value5];
            framA.repeatCount = 2;
//            framA.keyTimes = @[@(2),@(1),@(3),@(1),];
            framA.duration = 4;
            framA.autoreverses = NO;
            framA.removedOnCompletion = YES;
            framA.timingFunctions  = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
            [button.layer addAnimation:framA forKey:nil];
        }
            break;
        case 2:{
            UIBezierPath *bezierPath  = [[UIBezierPath alloc] init];
            [bezierPath moveToPoint:CGPointMake(50, 200)];
            [bezierPath addCurveToPoint:CGPointMake(320 - 50, 200) controlPoint1:CGPointMake(150, 50) controlPoint2:CGPointMake(320 - 150, 250)];
            CAKeyframeAnimation *ani1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            ani1.duration = 2;
            ani1.path = bezierPath.CGPath;
            ani1.rotationMode = kCAAnimationRotateAuto;
            [button.layer addAnimation:ani1 forKey:nil];
            
        }
            break;
        case 3:{
            [button.layer removeAnimationForKey:@"grounkey"];
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
            //步骤2：设定动画属性
//            animation.autoreverses = NO;
            animation.duration = 2;
//            animation.repeatCount = 1;
//            animation.removedOnCompletion = NO;
//            animation.fillMode = kCAFillModeBoth;
//            animation.delegate = self;
            UIColor *randomColor = [UIColor blueColor];
//            if (button.backgroundColor != [UIColor redColor] ) {
//                randomColor = [UIColor redColor];
//            }
            animation.toValue = (__bridge id _Nullable)(randomColor.CGColor);
            
            CAKeyframeAnimation *framA = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(40, 100)];
            NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(self.view.bounds.size.width -40, 100)];
            framA.values = @[value1,value2];
//            framA.repeatCount = 1;
            //                        framA.keyTimes = @[@(2),@(1)];
            framA.duration = 2;
//            framA.autoreverses = NO;
//            framA.removedOnCompletion = YES;
            framA.timingFunctions  = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                       ];
            CAAnimationGroup*group = [CAAnimationGroup animation];
            group.animations = @[animation,framA];
            group.duration = 3;
            [button.layer addAnimation:group forKey:@"grounkey"];
        }
            break;
        case 4:{
            float time1 = 0.6;
            float time2 = 1.2;
            CAKeyframeAnimation *animationPath = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//            animationPath.fromValue = [NSValue valueWithCGPoint:button.center];
//            animationPath.toValue = [NSValue valueWithCGPoint:CGPointMake(button.center.x, kScreen_Height - 400)];
            animationPath.values = @[[NSValue valueWithCGPoint:button.center],[NSValue valueWithCGPoint:CGPointMake(100, 400)]];
            animationPath.duration = time1;
            animationPath.calculationMode = kCAAnimationPaced;
            
            CAKeyframeAnimation *animationPath1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//            animationPath1.fromValue = [NSValue valueWithCGPoint:CGPointMake(button.center.x , kScreen_Height - 400)];
//            animationPath1.toValue = [NSValue valueWithCGPoint:CGPointMake(button.center.x , 100)];
            animationPath1.values = @[[NSValue valueWithCGPoint:CGPointMake(100 , 400)],[NSValue valueWithCGPoint:CGPointMake(button.center.x , 100)]];
            animationPath1.duration = time2;
            animationPath1.beginTime = time1;
            animationPath1.calculationMode = kCAAnimationPaced;
            
            CAKeyframeAnimation *zoomAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
            zoomAnimation.repeatCount = 1;
            zoomAnimation.values = @[[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:1.5],[NSNumber numberWithFloat:0.5]];
            zoomAnimation.keyTimes = @[[NSNumber numberWithFloat:0],[NSNumber numberWithFloat:time1-0.2],[NSNumber numberWithFloat:time2+0.2]];
            
            CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
            opacityAnimation.repeatCount = 1;
            opacityAnimation.values = @[[NSNumber numberWithFloat:0.2],[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:0.0]];
            opacityAnimation.keyTimes = @[[NSNumber numberWithFloat:0],[NSNumber numberWithFloat:time1],[NSNumber numberWithFloat:time2]];
            
            CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
            animationGroup.removedOnCompletion = NO;
            animationGroup.duration = time1 + time2;
            animationGroup.animations = @[animationPath,animationPath1,zoomAnimation,opacityAnimation];
            [button.layer addAnimation:animationGroup forKey:nil];
            
            
        }
            break;
        case 5:{
            CABasicAnimation *ani1 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
            
        }
            break;
        case 6:{
            CABasicAnimation *ani1 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
            
        }
            break;
        case 7:{
            CABasicAnimation *ani1 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
            
        }
            break;
        case 8:{
            CABasicAnimation *ani1 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
            
        }
            break;
            
        default:
            break;
    }
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (self.currentButton.tag == 300) {
        CABasicAnimation* bAnim = (CABasicAnimation *)anim;
           [CATransaction begin];
           [CATransaction setDisableActions:YES];
           self.currentButton.layer.backgroundColor = (__bridge CGColorRef)bAnim.toValue;
           [CATransaction commit];
    }
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
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
