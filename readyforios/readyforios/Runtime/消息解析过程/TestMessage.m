//
//  TestMessage.m
//  readyforios
//
//  Created by hcwang3 on 2022/1/26.
//

#import "TestMessage.h"

@implementation TestMessage
/*
 * 消息发送后，经过一系列查找都没结果时，会进入动态方法决议
 *
 *
 */

+(BOOL)resolveClassMethod:(SEL)sel {
    
    
    return [super resolveClassMethod:sel];
}

+(BOOL)resolveInstanceMethod:(SEL)sel {
    
   
    return [super resolveInstanceMethod:sel];
}

@end
