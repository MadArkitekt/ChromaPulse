//
//  DPARippleTests.m
//  DigitalPondTests
//
//  Created by Ed Salter on 1/16/19.
//  Copyright © 2019 techED. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DPARipple.h"

@interface DPARippleTest : XCTestCase

@property (nonatomic) DPARipple *ripple;

@end

@implementation DPARippleTest

- (void)setUp {
    self.ripple = [[DPARipple alloc] initWithFrame:CGRectZero];
}

- (void)tearDown {
    self.ripple = nil;
}

- (void)testRipple {
    XCTAssertNotNil(self.ripple);
}
//
//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
