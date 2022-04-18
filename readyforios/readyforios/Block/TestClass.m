//
//  TestClass.m
//  readyforios
//
//  Created by hcwang3 on 2022/4/18.
//

#import "TestClass.h"

@implementation TestClass



- (void)testMethods {
    void (^blockA)(int a) = ^(int a) {
        NSLog(@"%d",a);
    };
    if (blockA) {
        blockA(1990);
    }
}

@end
