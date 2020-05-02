//
//  GrammarTableViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/15.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "GrammarTableViewController.h"
#import "iOSDemo-Swift.h" 
@interface GrammarTableViewController ()
@property (nonatomic, strong)NSArray *mainArray;
@end

@implementation GrammarTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //XCPUImageControllerXAutoLayoutViewController
    self.mainArray = @[@{@"title":@"算法",@"class":@"AlgorithmicViewController",@"storyboard":@"0"},@{@"title":@"图片处理",@"class":@"XCPUImageController",@"storyboard":@"0"},
    @{@"title":@"AutoLayout",@"class":@"XAutoLayoutViewController",@"storyboard":@"0"},@{@"title":@"ReactiveCocoa",@"class":@"XRCViewController",@"storyboard":@"0"}];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mainArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"acellid" forIndexPath:indexPath]; 
    NSDictionary *dict = self.mainArray[indexPath.row];
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
         [self pushClass:dict[@"class"]title:dict[@"title"]];
    }
   
}
//根据类名，push到制定的类
- (void)pushClass:(NSString *)className title:(NSString *)title{
    Class objectClass = NSClassFromString(className);
    if (objectClass == nil) {
        NSString *name = [NSString stringWithFormat:@"iOSDemo.%@",className];
        objectClass = NSClassFromString(name);
    }
    UIViewController * object = [[objectClass alloc]init];
    object.title = title;
    object.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:object animated:YES];
}
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(nonnull UIViewController *)viewController animated:(BOOL)animated {
    BOOL isShow = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShow animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
