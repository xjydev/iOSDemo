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
    NSString *s1 = @"123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890";
    NSString *s2 = @"123456789012345678901234567890123446789012345678901234567890123456789012345678901235567890123456789012345678901234567890";
    NSLog(@"\n %lu\n %lu",s1.hash,s2.hash);
//    NSCache
}

- (void)testRequest {
    
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        
    }];
}

@end
