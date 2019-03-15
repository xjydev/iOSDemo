//
//  ABGuideView.m
//  ABAuthModule
//
//  Created by XiaoDev on 2019/3/4.
//

#import "ABGuideView.h"
#define APPFRAME_HEIGHT         ([UIScreen mainScreen].bounds.size.height)
#define APPFRAME_WIDTH          ([UIScreen mainScreen].bounds.size.width)

@interface ABGuideView ()
@property (nonatomic, assign)NSInteger step;
@property (strong, nonatomic) CAShapeLayer *maskLayer;
@property (nonatomic, strong) UIView *currentView;
@end

@implementation ABGuideView

- (instancetype)init {
    self = [super initWithFrame:CGRectMake(0, 0, APPFRAME_WIDTH, APPFRAME_HEIGHT)];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        self.step = 0 ;
    }
    return self;
}
- (CAShapeLayer *)maskLayer
{
    if (!_maskLayer)
    {
        _maskLayer = [CAShapeLayer layer];
    }
    return _maskLayer;
}
- (void)setStep:(NSInteger)step {
    if (_step >= self.viewsArray.count) {
        [self removeFromSuperview];
        return;
    }
    if (step != _step) {
        _step = step;
        self.currentView = self.viewsArray[_step];
        [self reloadMask];
    }
}
- (void)reloadMask {
    CGPathRef fromPath = self.maskLayer.path;
    /// 更新 maskLayer 的 尺寸
    self.maskLayer.frame = self.bounds;
    self.maskLayer.fillColor = [UIColor blackColor].CGColor;
    CGFloat maskCornerRadius = 5;
    
    CGRect visualRect = [self convertRect:self.currentView.frame toView:self.currentView.superview];
    UIEdgeInsets maskInsets = UIEdgeInsetsMake(-8, -8, -8, -8);
    visualRect.origin.x += maskInsets.left;
    visualRect.origin.y += maskInsets.top;
    visualRect.size.width  -= (maskInsets.left + maskInsets.right);
    visualRect.size.height -= (maskInsets.top + maskInsets.bottom);
    /// 获取可见区域的路径(开始路径)
    UIBezierPath *visualPath = [UIBezierPath bezierPathWithRoundedRect:visualRect cornerRadius:maskCornerRadius];
    UIBezierPath *toPath = [UIBezierPath bezierPathWithRect:self.bounds];
    
    [toPath appendPath:visualPath];
    
    /// 遮罩的路径
    self.maskLayer.path = toPath.CGPath;
    self.maskLayer.fillRule = kCAFillRuleEvenOdd;
    self.layer.mask = self.maskLayer;
    
    /// 开始移动动画
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"path"];
    anim.duration  = 0.3;
    anim.fromValue = (__bridge id _Nullable)(fromPath);
    anim.toValue   = (__bridge id _Nullable)(toPath.CGPath);
    [self.maskLayer addAnimation:anim forKey:NULL];
}
- (void)setImageSArray:(NSArray *)imageSArray {
    _imageSArray = imageSArray;
    [self showImageWithStep:self.step];
}
- (UIImage *)imageWithGuideName:(NSString *)name {
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[self class]]
                                                 pathForResource:@"ABBasicModule"
                                                 ofType:@"bundle"]];
    UIImage * image = [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
    return image;
}
- (BOOL)showImageWithStep:(NSInteger)step {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    if (self.imageSArray.count > step) {//有就显示没有就算了
        NSArray *imArray = self.imageSArray[step];
        for (NSDictionary *dict in imArray) {
            UIImageView *imageView = [[UIImageView alloc]initWithImage:[self imageWithGuideName:[dict objectForKey:@"image"]]];
            switch ([[dict objectForKey:@"site"]integerValue]) {
                case 0:
                {
                    float x = [[dict objectForKey:@"centerx"]floatValue];
                    float y = [[dict objectForKey:@"centery"]floatValue];
                    imageView.frame = CGRectMake(x, y, CGRectGetWidth(imageView.frame), CGRectGetHeight(imageView.frame));
                }
                    break;
                case 1:
                {
                    float x = [[dict objectForKey:@"centerx"]floatValue];
                    float y = [[dict objectForKey:@"centery"]floatValue];
                    imageView.frame = CGRectMake(x,APPFRAME_HEIGHT - y -CGRectGetHeight(imageView.frame) , CGRectGetWidth(imageView.frame), CGRectGetHeight(imageView.frame));
                }
                    break;
                case 2:
                {
                    float x = [[dict objectForKey:@"centerx"]floatValue];
                    float y = [[dict objectForKey:@"centery"]floatValue];
                    imageView.frame = CGRectMake(APPFRAME_WIDTH - x - CGRectGetWidth(imageView.frame), APPFRAME_HEIGHT - y -CGRectGetHeight(imageView.frame), CGRectGetWidth(imageView.frame), CGRectGetHeight(imageView.frame));
                }
                    break;
                case 3:
                {
                    float x = [[dict objectForKey:@"centerx"]floatValue];
                    float y = [[dict objectForKey:@"centery"]floatValue];
                    imageView.frame = CGRectMake(APPFRAME_WIDTH - x - CGRectGetWidth(imageView.frame), y, CGRectGetWidth(imageView.frame), CGRectGetHeight(imageView.frame));
                }
                    break;
                    
                default:
                    break;
            }
//            imageView.center = CGPointMake([[dict objectForKey:@"centerx"]floatValue], [[dict objectForKey:@"centery"]floatValue]);
            [self addSubview:imageView];
        }
        return YES;
    }else {
        [self removeFromSuperview];
        return NO;
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.step ++;
    if (![self showImageWithStep:self.step]) {
        [self removeFromSuperview];
    }
}


- (void)show {
    
}
@end
