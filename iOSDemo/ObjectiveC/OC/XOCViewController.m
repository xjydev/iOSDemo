//
//  XOCViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/13.
//  Copyright © 2020 Xiaodev. All rights reserved.
//
#import <objc/runtime.h>
#import "XOCViewController.h"
#import "XFatherObj.h"
#import "XSonObj.h"
#import "XDaughterObj.h"
#import "XSonObj+cate.h"
#import "XWifeObj.h"
#import <AVKit/AVKit.h>
#import <VideoToolbox/VideoToolbox.h>
@interface XOCViewController ()
@property (nonatomic, copy)NSString *astr1;
@property (nonatomic, copy)NSString *astr2;

@property (nonatomic, copy)NSArray *arry1;
@property (nonatomic, copy)NSArray *arry2;
@end

@implementation XOCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
  
//    XFatherObj *father = [XFatherObj alloc];
    
    XSonObj *son= [[XSonObj alloc]init];
    [NSHashTable weakObjectsHashTable];
    
    [son learn];
    XDaughterObj *daughter = [[XDaughterObj alloc]init];
    [daughter learn];
    [XWifeObj name];
    XFatherObj *father2 = [[XFatherObj alloc]init];
    
//    [self autoreleaseAction];
    NSLog(@"2222222=====");
    [self getClassList];
    
#pragma mark --浅拷贝深拷贝。
    NSString *astr = @"123456";
    NSMutableString *mstr = [NSMutableString stringWithFormat:@"4567"];
    self.astr1 = astr;
    self.astr2 = mstr;
    NSLog(@"address\n%p\n%p\n%p\n%p",astr,mstr,_astr1,_astr2);
    
    NSMutableArray *arr = [NSMutableArray arrayWithArray:@[@(1),@(2)]];
    NSArray *arr1 = @[@"1"];
    self.arry1 = arr;
    self.arry2 = arr1;
    NSLog(@"\n%p\n%p\n%p\n%p\n",arr,arr1,self.arry1,self.arry2);
    
}
- (void)autoreleaseAction {
    NSLog(@"autorelease ==================");
    @autoreleasepool {
        XSonObj *son= [[XSonObj alloc]init];
        [son learn];
        @autoreleasepool {
            XDaughterObj *daughter = [[XDaughterObj alloc]init];
//            [daughter learn];
            NSLog(@"release 1111");
        }
        NSLog(@"release 2222");
    }
    NSLog(@"autorelease ========== end");
}
- (void)getClassList {
    NSLog(@"class list ==================");
    unsigned int ivarCount = 0;
    Ivar *ivarList = class_copyIvarList([XSonObj class], &ivarCount);
    for (unsigned int i = 0; i<ivarCount; i++) {
        Ivar ivar = ivarList[i];
        const char *ivarName = ivar_getName(ivar);
        NSLog(@"ivar == %@",[NSString stringWithUTF8String:ivarName]);
        //为变量赋值
//        if ([[NSString stringWithUTF8String:ivarName] isEqualToString:@"_name"]) {
//            object_setIvar(d, ivar, @"xiao");
//            NSLog(@"d.name == %@",d.name);
//        }
    }
    
    #pragma mark -- 获取属性列表
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList([XSonObj class], &count);
    for (unsigned int i = 0; i<count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"propertyName===%@",[NSString stringWithUTF8String:propertyName]);
        
    }
    unsigned int methCount = 0;
      Method *methList = class_copyMethodList([XSonObj class], &methCount);
      for (unsigned int i = 0 ; i<methCount; i++) {
          Method meth = methList[i];
          NSLog(@"meth == %@",NSStringFromSelector(method_getName(meth)));
      }
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
