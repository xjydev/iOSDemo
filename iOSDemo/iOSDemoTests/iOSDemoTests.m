//
//  iOSDemoTests.m
//  iOSDemoTests
//
//  Created by XiaoDev on 17/05/2018.
//  Copyright © 2018 Xiaodev. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface iOSDemoTests : XCTestCase

@end

@implementation iOSDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSLog(@"自定义单元测试");
    int a = 0;
    XCTAssert(a == 0,"!a");
}

- (void)testRequest {
    
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        
    }];
}

@end
