//
//  ABGuideView.h
//  ABAuthModule
//
//  Created by XiaoDev on 2019/3/4.
//页面内，新手指引。

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ABGuideView : UIView
@property (nonatomic, strong)NSArray *viewsArray;
/**
 @{@"image":@"",@"centerx":@"",@"centery":@"",@"site":@""}
 @"site" 0左上，1左下，2右下、3右上
 */
@property (nonatomic, strong)NSArray *imageSArray;
@property (nonatomic, assign)NSInteger a;
@property (nonatomic, assign)NSInteger b;

- (void)show;
@end

NS_ASSUME_NONNULL_END
