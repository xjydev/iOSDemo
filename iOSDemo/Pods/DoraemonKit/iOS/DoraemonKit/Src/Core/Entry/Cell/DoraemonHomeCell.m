//
//  DoraemonHomeCell.m
//  DoraemonKit
//
//  Created by dengyouhua on 2019/9/4.
//

#import "DoraemonHomeCell.h"
#import "DoraemonDefine.h"

@interface DoraemonHomeCell()

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *name;

@end

@implementation DoraemonHomeCell

- (UIImageView *)icon {
    if (!_icon) {
        CGFloat size = 34;
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake((self.doraemon_width - size) / 2.0, 4, size, size)];
    }
    
    return _icon;
}

- (UILabel *)name {
    if (!_name) {
        CGFloat height = 16;
        _name = [[UILabel alloc] initWithFrame:CGRectMake(0, self.doraemon_height - height - 4, self.doraemon_width, height)];
        _name.textAlignment = NSTextAlignmentCenter;
        _name.font = [UIFont systemFontOfSize:kDoraemonSizeFrom750_Landscape(24)];
        _name.adjustsFontSizeToFitWidth = YES;
        if (@available(iOS 13.0, *)) {
            _name.textColor = [UIColor labelColor];
        }
    }
    
    return _name;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        if (@available(iOS 13.0, *)) {
            self.backgroundColor = [UIColor systemBackgroundColor];
        } else {
            self.backgroundColor = [UIColor whiteColor];
        } 
        [self addSubview:self.icon];
        [self addSubview:self.name];
    }
    return self;
}

- (void)update:(NSString *)image name:(NSString *)name {
    self.icon.image = [UIImage doraemon_imageNamed:image];
    self.name.text = name;
}

@end
