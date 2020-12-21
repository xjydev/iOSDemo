//
//  XRainViewController.m
//  iOSDemo
//
//  Created by jingyuan5 on 2020/12/4.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XRainViewController.h"
#import "XTools.h"
@interface XRainViewController ()

@property (nonatomic, strong) CAEmitterLayer *rainLayer;
@property (nonatomic, strong)CAEmitterCell *snowCell;
@property (nonatomic, assign)NSInteger rainCount;
@property (nonatomic, strong) UIView *backView;
@end

@implementation XRainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self rainAction];
    self.rainCount = 0;
    [self customRain];
    [self.view addSubview:self.backView];
}
- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, kScreen_Width, 300)];
        _backView.backgroundColor = [UIColor redColor];
        _backView.layer.masksToBounds = YES;
    }
    return _backView;
}
- (void)customRain {
    
    [NSTimer scheduledTimerWithTimeInterval:0.2 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self startRain];
        self.rainCount ++;
        if (self.rainCount >= 10) {
            [timer invalidate];
            self.rainCount = 0;
        }
    }];
    
}
- (void)startRain {
    NSInteger num = arc4random()%4+1;
    for (int i = 0; i< num; i++) {
        UIImage *image =[UIImage imageNamed:@"happy"];
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(-40, -40, 40, 40);
        layer.contents = (__bridge id)image.CGImage;
        [self.backView.layer addSublayer:layer];
        CGFloat startX = arc4random()%((int)kScreen_Width);
        CGFloat endX =startX + arc4random()%((int)kScreen_Width)-kScreen_Width/2;
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
        anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(startX, -20)];
        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(endX, kScreen_Height - 40)];
        anim.duration = 4.0;
        anim.removedOnCompletion = YES;
        [layer addAnimation:anim forKey:@"12"];
    }
}
- (void)rainAction {
    
//    1.设置 CAEmitterLayer
    self.rainLayer = [CAEmitterLayer layer];
    self.rainLayer.frame = self.view.bounds;
//    2.在背景图上添加粒子图层
    [self.view.layer addSublayer:self.rainLayer];
    
//    3.发射形状--线性
    self.rainLayer.emitterShape = kCAEmitterLayerLine;
    self.rainLayer.emitterMode = kCAEmitterLayerSurface;
    self.rainLayer.emitterSize = self.view.frame.size;
    self.rainLayer.emitterPosition = CGPointMake(self.view.frame.size.width * 0.5, 0);
    self.rainLayer.lifetime = 10.0f;
//    4.配置 cell
    self.snowCell = [CAEmitterCell emitterCell];
    self.snowCell.contents = (id)[[UIImage imageNamed:@"happy"] CGImage];
    self.snowCell.birthRate = 3.0;
    self.snowCell.lifetime = 30.0;
    self.snowCell.speed =1.0;
    self.snowCell.velocity = -10.f;
    self.snowCell.velocityRange = 10.f;
    self.snowCell.yAcceleration = 50;
    self.snowCell.emissionRange = 30;
    self.snowCell.scale = 0.5;
    self.snowCell.scaleRange = 0.2f;
    
//    CAEmitterCell *kaixinguoCell = [CAEmitterCell emitterCell];
//    kaixinguoCell.contents = (id)[[UIImage imageNamed:@"cake"] CGImage];
//    kaixinguoCell.birthRate = 1.0;
//    kaixinguoCell.lifetime = 30;
//    kaixinguoCell.speed = 2;
//    kaixinguoCell.velocity = 30.f;
//    kaixinguoCell.velocityRange = 10.f;
//    kaixinguoCell.yAcceleration = 20;
//    kaixinguoCell.scale = 0.5;
//    kaixinguoCell.scaleRange = 0.2f;
//
//    CAEmitterCell *niuyouguoCell = [CAEmitterCell emitterCell];
//    niuyouguoCell.contents = (id)[[UIImage imageNamed:@"small"] CGImage];
//    niuyouguoCell.birthRate = 1.0;
//    niuyouguoCell.lifetime = 30;
//    niuyouguoCell.speed = 2;
//    niuyouguoCell.velocity = 10.f;
//    niuyouguoCell.velocityRange = 10.f;
//    niuyouguoCell.yAcceleration = 60;
//    niuyouguoCell.scale = 1;
//    niuyouguoCell.scaleRange = 0.f;
    
    self.rainLayer.emitterCells = @[self.snowCell];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self customRain];
//    [self.rainLayer removeFromSuperlayer];
//    [self.rainLayer.emitterCells enumerateObjectsUsingBlock:^(CAEmitterCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        obj.birthRate = 1.0;
//    }];
//    [self.rainLayer setValue:@0 forKeyPath:@"emitterCells.explosion.birthRate"];

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
