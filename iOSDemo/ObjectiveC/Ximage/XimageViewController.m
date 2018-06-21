//
//  XimageViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2018/6/11.
//  Copyright © 2018 Xiaodev. All rights reserved.
//

#import "XimageViewController.h"
#import <Accelerate/Accelerate.h>
#import "XTools.h"
@interface XimageViewController ()
{
    UIImageView *_imageView3;
}
/**
 要刮的底图.
 */
@property (nonatomic, strong) UIImage *image;
/**
 涂层图片.
 */
@property (nonatomic, strong) UIImage *surfaceImage;
@property (nonatomic, strong) UIImageView *surfaceImageView;

@property (nonatomic, strong) CALayer *imageLayer;

@property (nonatomic, strong) CAShapeLayer *shapeLayer;
//设置手指的涂抹路径
@property (nonatomic, assign) CGMutablePathRef path;

@end

@implementation XimageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UIImage 处理";
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"im"]];
    imageView.frame = CGRectMake(0, 80, 100, 100);
    [self.view addSubview:imageView];
     
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 180, 100, 100)];
    [self.view addSubview:imageView2];
    [imageView2 setImage:[self coreBlurImage:imageView.image withBlurNumber:0.8]];
    
    _imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 180, 100, 100)];
    [_imageView3 setImage:[self boxblurImage:imageView.image withBlurNumber:1.0]];
    [self.view addSubview:_imageView3];
    
    UIImageView *imageView4 = [[UIImageView alloc]initWithFrame:CGRectMake(120, 80, 100, 100)];
    [imageView4 setImage:imageView.image];
    [self.view addSubview:imageView4];
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:effect];
    effectView.frame = imageView4.bounds ;
    [imageView4 addSubview:effectView];
    
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(30, kScreen_Height - 60, kScreen_Width-60, 30)];
    slider.maximumValue = 1.0;
    slider.minimumValue = 0.0;
    [slider addTarget:self action:@selector(sliderChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    self.surfaceImageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 280, 250, 250)];
    self.surfaceImageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.surfaceImageView ];
    
    
    self.surfaceImage = [self mosaicImage:[UIImage imageNamed:@"im"] level:1];
    self.surfaceImageView.image = self.surfaceImage;
    self.image = [UIImage imageNamed:@"im"] ;
    self.imageLayer.contents = (__bridge id _Nullable)(self.image.CGImage);
    
    self.imageLayer = [CALayer layer];
    self.imageLayer.frame = self.surfaceImageView.frame;
    [self.view.layer addSublayer:self.imageLayer];
    
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = self.surfaceImageView.frame;
    self.shapeLayer.lineCap = kCALineCapRound;
    self.shapeLayer.lineJoin = kCALineJoinRound;
    self.shapeLayer.lineWidth = 20.f;
    self.shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    self.shapeLayer.fillColor = nil;//此处设置颜色有异常效果，可以自己试试

    [self.view.layer addSublayer:self.shapeLayer];
    self.imageLayer.mask = self.shapeLayer;
    
    self.path = CGPathCreateMutable();
    
    
}
- (void)sliderChange:(UISlider *)slider {
    [_imageView3 setImage:[self boxblurImage:[UIImage imageNamed:@"im"] withBlurNumber:slider.value]];
}
-(UIImage *)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage= [CIImage imageWithCGImage:image.CGImage];
    //设置filter
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey]; [filter setValue:@(blur) forKey: @"inputRadius"];
    //模糊图片
    CIImage *result=[filter valueForKey:kCIOutputImageKey];
    CGImageRef outImage=[context createCGImage:result fromRect:[result extent]];
    UIImage *blurImage=[UIImage imageWithCGImage:outImage];
    CGImageRelease(outImage);
    return blurImage;
}
-(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur
{
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 200);//这个200的值关乎模糊程度
    boxSize = boxSize - (boxSize % 2) + 1;
    CGImageRef img = image.CGImage;
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    //从CGImage中获取数据
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    //设置从CGImage获取对象的属性
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate( outBuffer.data, outBuffer.width, outBuffer.height, 8, outBuffer.rowBytes, colorSpace, kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    //clean up CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    CFRelease(inBitmapData);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    return returnImage;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    CGPathMoveToPoint(self.path, NULL, point.x, point.y);
    CGMutablePathRef path = CGPathCreateMutableCopy(self.path);
    self.shapeLayer.path = path;
    CGPathRelease(path);
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    CGPathAddLineToPoint(self.path, NULL, point.x, point.y);
    CGMutablePathRef path = CGPathCreateMutableCopy(self.path);
    self.shapeLayer.path = path;
    CGPathRelease(path);
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
}
/**图片马赛克*/
- (UIImage *)mosaicImage:(UIImage *)image level:(NSInteger)level{
    
    if(!image){
        return nil;
    }
    
    CGImageRef imageRef = image.CGImage;
    NSUInteger imageW = CGImageGetWidth(imageRef);
    NSUInteger imageH = CGImageGetHeight(imageRef);
    //创建颜色空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char *rawData = (unsigned char *)calloc(imageH*imageW*4, sizeof(unsigned char));
    CGContextRef contextRef = CGBitmapContextCreate(rawData, imageW, imageH, 8, imageW*4, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGContextDrawImage(contextRef, CGRectMake(0, 0, imageW, imageH), imageRef);
    
    unsigned char *bitMapData = CGBitmapContextGetData(contextRef);
    NSUInteger currentIndex,preCurrentIndex;
    NSUInteger sizeLevel = level == 0 ? MIN(imageW, imageH)/20.0 : level;
    //像素点默认是4个通道
    unsigned char *pixels[4] = {0};
    for (int i = 0; i < imageH; i++) {
        for (int j = 0; j < imageW; j++) {
            currentIndex = imageW*i + j;
            NSUInteger red = rawData[currentIndex*4];
            NSUInteger green = rawData[currentIndex*4+1];
            NSUInteger blue = rawData[currentIndex*4+2];
            NSUInteger alpha = rawData[currentIndex*4+3];
            if (red+green+blue == 0 && (alpha/255.0 <= 0.5)) {
                rawData[currentIndex*4] = 255;
                rawData[currentIndex*4+1] = 255;
                rawData[currentIndex*4+2] = 255;
                rawData[currentIndex*4+3] = 0;
                continue;
            }
            /*
             memcpy指的是c和c++使用的内存拷贝函数，memcpy函数的功能是从源src所指的内存地址的起始位置开始拷贝n个字节到目标dest所指的内存地址的起始位置中。
             strcpy和memcpy主要有以下3方面的区别。
             1、复制的内容不同。strcpy只能复制字符串，而memcpy可以复制任意内容，例如字符数组、整型、结构体、类等。
             2、复制的方法不同。strcpy不需要指定长度，它遇到被复制字符的串结束符"\0"才结束，所以容易溢出。memcpy则是根据其第3个参数决定复制的长度。
             3、用途不同。通常在复制字符串时用strcpy，而需要复制其他类型数据时则一般用memcpy
             */
            if (i % sizeLevel == 0) {
                if (j % sizeLevel == 0) {
                    memcpy(pixels, bitMapData+4*currentIndex, 4);
                }else{
                    //将上一个像素点的值赋给第二个
                    memcpy(bitMapData+4*currentIndex, pixels, 4);
                }
            }else{
                preCurrentIndex = (i-1)*imageW+j;
                memcpy(bitMapData+4*currentIndex, bitMapData+4*preCurrentIndex, 4);
            }
        }
    }
    //获取图片数据集合
    NSUInteger size = imageW*imageH*4;
    CGDataProviderRef providerRef = CGDataProviderCreateWithData(NULL, bitMapData, size, NULL);
    //创建马赛克图片，根据变换过的bitMapData像素来创建图片
    CGImageRef mosaicImageRef = CGImageCreate(imageW, imageH, 8, 4*8, imageW*4, colorSpace, kCGBitmapByteOrderDefault, providerRef, NULL, NO, kCGRenderingIntentDefault);//Creates a bitmap image from data supplied by a data provider.
    //创建输出马赛克图片
    CGContextRef outContextRef = CGBitmapContextCreate(bitMapData, imageW, imageH, 8, imageW*4, colorSpace, kCGImageAlphaPremultipliedLast);
    //绘制图片
    CGContextDrawImage(outContextRef, CGRectMake(0, 0, imageW, imageH), mosaicImageRef);
    
    CGImageRef resultImageRef = CGBitmapContextCreateImage(contextRef);
    UIImage *mosaicImage = [UIImage imageWithCGImage:resultImageRef];
    //释放内存
    CGImageRelease(resultImageRef);
    CGImageRelease(mosaicImageRef);
    CGColorSpaceRelease(colorSpace);
    CGDataProviderRelease(providerRef);
    CGContextRelease(outContextRef);
    return mosaicImage;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
