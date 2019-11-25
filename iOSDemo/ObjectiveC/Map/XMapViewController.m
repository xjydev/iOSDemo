//
//  XMapViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2019/9/11.
//  Copyright © 2019 Xiaodev. All rights reserved.
//

#import "XMapViewController.h"
#import <BaiduMapAPI_Map/BMKMapView.h>
@interface XMapViewController ()<BMKMapViewDelegate>
@property (nonatomic, strong)BMKMapView *mapView;
@end

@implementation XMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.prefersLargeTitles = NO;
    self.mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
    [self.mapView setMapType:BMKMapTypeStandard];
    self.mapView.compassPosition = CGPointMake(100, 100);
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.mapView viewWillAppear];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.mapView viewWillDisappear];
    [BMKMapView enableCustomMapStyle:NO];
}
- (void)mapViewDidFinishLoading:(BMKMapView *)mapView{
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
