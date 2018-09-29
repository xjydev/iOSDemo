//
//  ABCalendarController.m
//  iOSDemo
//
//  Created by XiaoDev on 2018/8/10.
//  Copyright © 2018 Xiaodev. All rights reserved.
//

#import "ABCalendarController.h"
#pragma mark -- model
@interface ABCalendarModel:NSObject
@property (nonatomic, copy)NSString *yearMonthStr;
@property (nonatomic, assign)NSInteger firstDay;//第一天的位置
@property (nonatomic, assign)NSInteger allDay;//一个月的全部天数+第一天前面的天数。

@end
@implementation ABCalendarModel

@end

#pragma mark -- cell
@interface ABCalendarCell :UICollectionViewCell
@property (nonatomic, strong)UILabel *contentLabel;
@end
@implementation ABCalendarCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(2, 2, frame.size.width - 4, frame.size.height - 4)];
        self.contentLabel.backgroundColor = [UIColor whiteColor];
        self.contentLabel.font = [UIFont systemFontOfSize:14];
        self.contentLabel.text = @"26";
        self.contentLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.contentLabel];
    }
    return self;
}

@end

#pragma mark Controller
@interface ABCalendarController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, copy) CalendarSelectedCompletion selectedCompletionHandler;
@property (nonatomic, strong) UIView  *backView;
@property (nonatomic, strong) UICollectionView  *calendarCollectonView;

@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UILabel  *titleLabel;
@property (nonatomic, strong) UIButton *confirmButton;
@property (nonatomic, strong) UIView   *weekView;

@property (nonatomic, strong) NSMutableArray *monthArray;
@end

@implementation ABCalendarController
- (BOOL)showSelectedCompletion:(CalendarSelectedCompletion)selectedCompletion {
    self.selectedCompletionHandler = selectedCompletion;
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    self.popoverPresentationController.backgroundColor = [UIColor clearColor];
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:self animated:YES completion:^{
        
    }];
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    [self.view addSubview:self.backView];
    [self.backView addSubview:self.cancelButton];
    [self.backView addSubview:self.titleLabel];
    [self.backView addSubview:self.confirmButton];
    [self.backView addSubview:self.weekView];
    [self.backView addSubview:self.calendarCollectonView];
}
- (void)getAllMonthArray {
    NSDate *date = [NSDate date];
}
- (NSMutableArray *)monthArray {
    if (!_monthArray) {
        _monthArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _monthArray;
}
- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.bounds) - 400, CGRectGetWidth(self.view.bounds), 400)];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}
- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _cancelButton.frame = CGRectMake(0, 0, 60, 50);
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}
- (void)cancelButtonAction:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 0, CGRectGetWidth(self.backView.bounds)-120, 50)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"选择日期";
    }
    return _titleLabel;
}
- (UIButton *)confirmButton {
    if (!_confirmButton) {
        _confirmButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _confirmButton.frame = CGRectMake(CGRectGetWidth(self.backView.bounds) - 60, 0, 60, 50);
        [_confirmButton setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmButton addTarget:self action:@selector(confirmButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmButton;
}
- (void)confirmButtonAction:(UIButton *)button {
    
}
- (UIView *)weekView {
    if (!_weekView) {
        float width = CGRectGetWidth(self.backView.bounds);
        _weekView = [[UIView alloc]initWithFrame:CGRectMake(0, 50, width, 30)];
        _weekView.backgroundColor = [UIColor whiteColor];
        NSArray *weekArray =@[@"一",@"二",@"三",@"四",@"五",@"六",@"日"];
        
        for (NSInteger i = 0;i<weekArray.count;i++) {
            NSString *wStr = weekArray[i];
            UILabel *wLabel = [[UILabel alloc]initWithFrame:CGRectMake(i*width/7, 0, width/7, 30)];
            wLabel.text = wStr;
            wLabel.font = [UIFont systemFontOfSize:14];
            wLabel.textAlignment = NSTextAlignmentCenter;
            [_weekView addSubview:wLabel];
        }
    }
    return _weekView;
}
- (UICollectionView *)calendarCollectonView {
    if (!_calendarCollectonView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(CGRectGetWidth(self.backView.bounds)/7, 40);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _calendarCollectonView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 80, CGRectGetWidth(self.backView.bounds), CGRectGetHeight(self.backView.bounds) - 80) collectionViewLayout:layout];
        _calendarCollectonView.delegate = self;
        _calendarCollectonView.dataSource = self;
        [_calendarCollectonView registerClass:[ABCalendarCell class] forCellWithReuseIdentifier:@"abcalendarcellid"];
        
    }
    return _calendarCollectonView;
}
//点击空白处返回
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
#pragma mark-- delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 10;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 42;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ABCalendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"abcalendarcellid" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
    
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
