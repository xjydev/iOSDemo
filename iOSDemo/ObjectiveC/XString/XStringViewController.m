//
//  XStringViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2018/11/19.
//  Copyright © 2018 Xiaodev. All rights reserved.
//

#import "XStringViewController.h"

@interface XStringViewController ()
@property (weak, nonatomic) IBOutlet UITextField *stringField;

@end

@implementation XStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"字符串操作";
    self.view.backgroundColor = [UIColor whiteColor];
    
}
- (IBAction)startAction:(id)sender {
    NSLog(@"%@\n空格==%@\n星星==%@\n",self.stringField.text,[self showPlainText:YES text:self.stringField.text],[self showPlainText:NO text:self.stringField.text]);
}
//
- (NSString *)showPlainText:(BOOL)show text:(NSString *)text {
//    if (text.length == 0) {
//        return nil;
//    }
//    NSMutableString *mstr = [NSMutableString stringWithString:text];
//    if (show) {//如果显示就添加空格和#号
//        NSInteger count = 1;
//        while (count < mstr.length) {
//            if (count % 5 == 0) {//每第五个添加一个空格
//                [mstr insertString:@" " atIndex:count];
//            }
//            count ++;
//        }
//        return [NSString stringWithFormat:@"%@ #", mstr];
//    }
//    else//如果不显示就显示*号
//    {
//        NSInteger count = 0;
//        while (count < mstr.length) {
//            if (count % 5 == 0&& count!=0) {//每第五个添加一个空格
//                [mstr insertString:@" " atIndex:count];
//            } else {
//                [mstr replaceCharactersInRange:NSMakeRange(count, 1) withString:@"*"];
//            }
//            count ++;
//        }
//        return mstr;
//    }
    NSInteger length = text.length;
    NSInteger cycleCount = length / 5 + length;//加上空格后字符串长度
    NSInteger count = 1;
    NSMutableString *mstr = [NSMutableString stringWithCapacity:cycleCount];
    
    if (show) {//如果显示就添加空格和#号
        
        NSInteger copyCount = 0;
        while (mstr.length < cycleCount) {
            if (count % 5 == 0) {
                [mstr appendFormat:@" "];
            } else {
                [mstr appendString:[text substringWithRange:NSMakeRange(copyCount, 1)]];
                copyCount ++;
            }
            count ++;
        }
        
        return [NSString stringWithFormat:@"%@ #", mstr];
    }
    
    //如果不显示就
    while (mstr.length < cycleCount) {
        if (count % 5 == 0) {
            [mstr appendFormat:@" "];
        } else {
            [mstr appendFormat:@"*"];
        }
        count ++;
    }
    return mstr;
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
