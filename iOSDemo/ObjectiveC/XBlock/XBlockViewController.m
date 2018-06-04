//
//  XBlockViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 17/05/2018.
//  Copyright © 2018 Xiaodev. All rights reserved.
//
//在局部变量前使用下划线下划线block修饰,在声明Block之后、调用Block之前对局部变量进行修改,在调用Block时局部变量值是修改之后的新值
#import "XBlockViewController.h"
typedef void(^eBlock) (NSString *eb);
@interface XBlockViewController ()
@property (nonatomic,copy)void (^block)(NSString * str);
@property (nonatomic,copy)eBlock eblock;
- (void)transferA:(NSString *)a aBlock:(void (^)(NSString *astr))bBlock;
@end

@implementation XBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Block";
    self.view.backgroundColor = [UIColor whiteColor];
   __block int a = 1;
    self.block = ^(NSString *str) {
        NSLog(@"str ==%@",str);
        NSLog(@"b1 a  %d",a);
        a = 2;
    };
    NSLog(@"b2 a  %d",a);
    self.eblock = ^(NSString *eb) {
        
    };
//    __block在MRC下有两个作用
//    1. 允许在Block中访问和修改局部变量
//    2. 禁止Block对所引用的对象进行隐式retain操作
//
//    __block在ARC下只有一个作用
//    1. 允许在Block中访问和修改局部变量
 #pragma mark --   /***MRC情况下***/
    //默认情况下,Block的内存存储在栈中,在Block的内存存储在栈中时,如果在Block中引用了外面的对象,不会对所引用的对象进行任何操作
    //如果对Block进行一次copy操作,那么Block的内存会被移动到堆中,这时需要开发人员对其进行release操作来管理内存
    //如果对Block进行一次copy操作,那么Block的内存会被移动到堆中,在Block的内存存储在堆中时,如果在Block中引用了外面的对象,会对所引用的对象进行一次retain操作,即使在Block自身调用了release操作之后,Block也不会对所引用的对象进行一次release操作,这时会造成内存泄漏。为了不对所引用的对象进行一次retain操作,可以在对象的前面使用下划线下__block来修饰
    

//    Block_copy(_eBlock);
//    Block_release(_eBlock);
    
    //如果对象内部有一个Block属性,而在Block内部又访问了该对象,那么会造成循环引用,解决循环引用的办法是在对象的前面使用下划线下划线block来修饰,以避免Block对对象进行retain操作
    __block XBlockViewController* blockself = self;
    self.eblock = ^(NSString *eb) {
        NSLog(@"%@",blockself);
    };
    
  #pragma mark --  /***ARC**/
    //在ARC默认情况下,Block的内存存储在堆中,如果在Block中引用了外面的对象,会对所引用的对象进行强引用,但是在Block被释放时会自动去掉对该对象的强引用,所以不会造成内存泄漏。ARC会自动进行内存管理,程序员只需要避免循环引用即可
    //如果对象内部有一个Block属性,而在Block内部又访问了该对象,那么会造成循环引用,解决循环引用的办法是使用一个弱引用的指针指向该对象,然后在Block内部使用该弱引用指针来进行操作,这样避免了Block对对象进行强引用
    __weak XBlockViewController* weakself = self;
    self.eblock = ^(NSString *eb) {
        XBlockViewController *myself = weakself;
        if (myself) {
          NSLog(@"%@",weakself);
        }
        
    };
}
#pragma mark --
- (void)transferA:(NSString *)a aBlock:(void (^)(NSString *))bBlock {
   NSString *cst = [self addcBlock:^(NSString *cstr) {
       NSString *ac = [NSString stringWithFormat:@"+%@+",a];
       return ac;
    }];
    bBlock(cst);
   
}

- (NSString *)addcBlock:(NSString *(^)(NSString *cstr))cBlcok{
   NSString *cb = cBlcok(@"2");
//    NSLog(@"add  %@",cb);
    NSString *d = [NSString stringWithFormat:@"===%@===",cb];
    return d;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.block(@"1111111");
//   NSString *a4 = [self addcBlock:^NSString *(NSString *cstr) {
//        return @"444";
//    }];
//    NSLog(@"a4  %@",a4);
    [self transferA:@"444444" aBlock:^(NSString *astr) {
        NSLog(@"astr  %@",astr);
    }];
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
