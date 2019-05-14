//
//  ObjectiveCTableController.m
//  iOSDemo
//
//  Created by XiaoDev on 17/05/2018.
//  Copyright © 2018 Xiaodev. All rights reserved.
//

#import "ObjectiveCTableController.h"
#import "XPropertyViewController.h"
#import "ABCalendarController.h"
#import "ABGuideView.h"
@interface ObjectiveCTableController ()<UINavigationControllerDelegate,UIPopoverPresentationControllerDelegate>
{
  NSArray  *  _mainArray;
}
@property (nonatomic, strong)NSMutableArray *viewsArray;
@end

@implementation ObjectiveCTableController
- (NSMutableArray *)viewsArray {
    if (!_viewsArray) {
        _viewsArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _viewsArray;
}
- (void)viewDidLoad {//
    [super viewDidLoad];
    self.navigationController.delegate = self;
    _mainArray = @[@{@"title":@"属性",@"class":@"XPropertyViewController",@"storyboard":@"0"},
                   @{@"title":@"falsh动画",@"class":@"XFlashViewController",@"storyboard":@"0"},
                   @{@"title":@"蓝牙",@"class":@"XBluetoothViewController",@"storyboard":@"0"},
                   @{@"title":@"Category",@"class":@"XCategoryViewController",@"storyboard":@"0"},        @{@"title":@"Block",@"class":@"XBlockViewController",@"storyboard":@"0"},
                   @{@"title":@"日历",@"class":@"XcalendarViewController",@"storyboard":@"0"},
                   @{@"title":@"UIView",@"class":@"XYViewController",@"storyboard":@"0"},
                   @{@"title":@"UIImage",@"class":@"XimageViewController",@"storyboard":@"0"},
                   @{@"title":@"UITableView",@"class":@"XTableViewController",@"storyboard":@"0"},
                   @{@"title":@"字符串的操作",@"class":@"XStringViewController",@"storyboard":@"1"},
                   @{@"title":@"WebView",@"class":@"XWebViewController",@"storyboard":@"0"},
                   @{@"title":@"URL解析",@"class":@"URLComponentsViewController",@"storyboard":@"0"},
                   @{@"title":@"新手页面引导",@"class":@"XGuideViewController",@"storyboard":@"1"},
                   @{@"title":@"进行时",@"class":@"RuntimeViewController",@"storyboard":@"0"},
                   ];
//
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = YES;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSDictionary *ndict = @{@"a":@"1"};
    NSDictionary *sdic = @{@"s":@(1)};
    NSString *str = [ndict objectForKey:@"a"];
//    [NSNumber numberWithInt:[[ndict objectForKey:@"a"] intValue]];
    NSNumber *num = [sdic objectForKey:@"s"];
//    [NSString stringWithFormat:@"%@",[sdic objectForKey:@"s"]];
    NSLog(@"number === %@",num.stringValue);
    NSLog(@"long === %@",@(num.longLongValue));
    NSLog(@"str == %ld",str.length);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _mainArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"objectccell" forIndexPath:indexPath];
    NSDictionary *dict = _mainArray[indexPath.row];
    cell.textLabel.text = dict[@"title"];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = _mainArray[indexPath.row];
    if ([dict[@"storyboard"]boolValue]) {
        [self performSegueWithIdentifier:dict[@"class"] sender:nil];
    }
    else
    {
         [self pushClass:dict[@"class"]];
    }
   
}
//根据类名，push到制定的类
- (void)pushClass:(NSString *)className{
    Class objectClass = NSClassFromString(className);
    UIViewController * object = [[objectClass alloc]init];
    object.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:object animated:YES];
}
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(nonnull UIViewController *)viewController animated:(BOOL)animated {
    BOOL isShow = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShow animated:YES];
}
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }   
}
-(NSArray *)tableView:(UITableView* )tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewRowAction *deleteRoWAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:NSLocalizedString(@"Delete", nil) handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {//title可自已定义
      
    }];
    //    此处是iOS8.0以后苹果最新推出的api，UITableViewRowAction，Style是划出的标签颜色等状态的定义，这里也可自行定义
    UITableViewRowAction *editRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"转移" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
      
       
    }];
    editRowAction.backgroundColor = [UIColor colorWithRed:0 green:124/255.0 blue:223/255.0 alpha:1];//可以定义RowAction的颜色
    return @[deleteRoWAction,editRowAction];//最后返回这俩个RowAction 的数组
}
- (IBAction)footButtonAction:(id)sender {
    [[ABCalendarController alloc]showSelectedCompletion:^(NSDate *startDate, NSDate *endDate) {
        
    }];
}
- (IBAction)popButtonAction:(UIButton *)sender {
    UIViewController *viewC = [[UIViewController alloc]init];
    viewC.modalPresentationStyle = UIModalPresentationPopover;
    viewC.preferredContentSize = CGSizeMake(80, 150);
    viewC.popoverPresentationController.sourceView = sender;
    viewC.popoverPresentationController.sourceRect =sender.bounds;
    viewC.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionDown;
    viewC.popoverPresentationController.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    viewC.popoverPresentationController.delegate = self;
    
    [self presentViewController:viewC animated:YES completion:^{
        
    }];
}
#pragma mark -- UIPopoverPresentationControllerDelegate
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection {
   return UIModalPresentationNone;
}
- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    return YES;
}
/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
