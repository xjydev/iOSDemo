//
//  XTableViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2018/9/29.
//  Copyright © 2018 Xiaodev. All rights reserved.
//

#import "XTableViewController.h"

@interface XTableViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    int   _reuseNumber;
}
@property (nonatomic, strong)UITableView *tableView;
@end

@implementation XTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _reuseNumber = 0;
    self.title = @"xtableView列表";
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 80.0f;
    [self.view addSubview:self.tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tablecellid"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"tablecellid"];
        _reuseNumber ++;
        if (cell.detailTextLabel.text.length == 0) {
         cell.detailTextLabel.text = [NSString stringWithFormat:@"复用 %d",_reuseNumber];
        }
    }
    cell.textLabel.text = [NSString stringWithFormat:@"复用cell 共%@个",@(tableView.visibleCells.count)];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
