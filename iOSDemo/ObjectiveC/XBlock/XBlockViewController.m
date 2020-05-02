//
//  XBlockViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 17/05/2018.
//  Copyright © 2018 Xiaodev. All rights reserved.
//
//在局部变量前使用下划线下划线block修饰,在声明Block之后、调用Block之前对局部变量进行修改,在调用Block时局部变量值是修改之后的新值
#import "XBlockViewController.h"
#import "XShareInstance.h"
#import "XTools.h"
typedef void(^eBlock) (NSString *eb);
@interface XBlockViewController ()
{
    id _observe;
    NSInteger _num;
    NSObject *_nObj;
}
@property (nonatomic, assign)NSTimeInterval time;
@property (nonatomic, copy)NSString *astr;
@property (nonatomic,copy)void (^block)(NSString * str);
@property (nonatomic,copy)eBlock eblock;
@property (nonatomic, strong)dispatch_queue_t queue;
- (void)transferA:(NSString *)a aBlock:(void (^)(NSString *astr))bBlock;

@end

@implementation XBlockViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"任务  == 2"); // 任务2
    });
    NSLog(@"3");
    self.title = @"Block";
    self.astr = @"dele";
    self.view.backgroundColor = [UIColor whiteColor];
   __block int a = 1;
    self.block = ^(NSString *str) {
        NSLog(@"str ==%@",str);
        NSLog(@"b1 a  %d",a);
        a = 2;
//        NSLog(@"%@",self.astr);
    };
    NSLog(@"b2 a  %d",a);
    self.eblock = ^(NSString *eb) {
        
    };
    
    self.time = 2;
    [UIView animateWithDuration:self.time animations:^{
        NSLog(@"animate == %@",self.astr);
    }];
    
    [self transferA:self.astr aBlock:^(NSString *astr) {
//        NSLog(@"animate == %@",self.astr);
    }];
//    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);
    self.queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(self.queue, ^{
     NSLog(@"gcd == %@",self.astr);
    });
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
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notify ) name:@"1111" object:nil];
//       [[NSNotificationCenter defaultCenter]removeObserver:self];
    __weak typeof(self) weakSelf = self;
    _observe = [[NSNotificationCenter defaultCenter]addObserverForName:@"2222" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
           NSLog(@"=== %@",weakSelf.astr);//循环引用
       }];
//    [[NSNotificationCenter defaultCenter]removeObserver:observe];
    [[XShareInstance share]instanceBlock:^(NSString * _Nonnull str) {
         NSLog(@"=== %@",weakSelf.astr);
    }];
    NSLog(@"shere1 == %@",[XShareInstance share]);
    [[XShareInstance share]instanceDealloc];
    NSLog(@"shere2 == %@",[XShareInstance share]);
    void(^block)(void) = ^{
       NSLog(@"Hello, World!");
        self.astr = @"1111";
    };
    _num = 10;
    [[XShareInstance share]instanceWithStr:self.astr Block:^(NSString * _Nonnull str) {//如果blockcopy了会对内部对象强引用。
//        NSLog(@"%@",str);
        NSLog(@"===%@",@(self->_num));
    }];
//    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
////      NSLog(@"=== %@",self.astr);//循环引用
//    }];
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(notify) userInfo:nil repeats:YES];
    [self deadLockThree];
    
    int i = 10;
    static int m = 100;
    NSMutableArray *mArray = [NSMutableArray arrayWithObjects:@"1",@"2", nil];
    void (^blk)(void) = ^{
    NSLog(@"In block, i = %d", i);
    NSLog(@"In block, m = %d", m);
        [mArray addObject:@"4"];
        for (NSString *str in mArray) {
            NSLog(@"In block, str = %@", str);
        }
        
    };
    i = 20;
    m = 200;
    [mArray addObject:@"3"];
    blk();
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 120, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
}
- (void)buttonAction:(UIButton *)button {
   __block XBlockObj *ob = [[XBlockObj alloc]init];
    ob.block = ^(NSString * _Nonnull b) {
        ob = nil;
    };
    [ob blockMethod];
}
- (void)deadLockThree {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"1"); // 任务1
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"2"); // 任务2
        });
        NSLog(@"3"); // 任务3
    });
    NSLog(@"4"); // 任务4

}

- (void)notify {
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
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"2222" object:nil];
    [[XShareInstance share]instanceDealloc];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:_observe];
    NSLog(@"block dealloc =========");
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
