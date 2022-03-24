//
//  main.m
//  KCObjcBuild
//
//  Created by cooci on 2021/1/5.


// KC 重磅提示 调试工程很重要 源码直观就是爽
// ⚠️编译调试不能过: 请你检查以下几小点⚠️
// ①: enable hardened runtime -> NO
// ②: build phase -> denpendenice -> objc
// 爽了之后,还来一个 👍

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
//#import "objc.h"os
//#import "ObjectiveC.runtime.h"
@interface SHKTest : NSObject
{
    @public
    int age;
    int age1;
}
- (void)shktest;
- (void)shktest1;
@end
@implementation SHKTest
- (void)shktest
{
//    NSLog(@"=========");
}
- (void)shktest1{NSLog(@"=========");}
+ (void)load
{
//    NSLog(@"=========");
}

+ (void)initialize
{
//    NSLog(@"=========");
}

- (void)dealloc
{
    NSLog(@"=========dealloc");

}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        NSString *str = @"jack";
//        NSUInteger hashCode = str.hash;
//        NSLog(@"str:--------:%zd",str.hash);
//
//
//        SHKTest *test = [[SHKTest alloc] init];
//        NSUInteger hashCode1 = test.hash;
//
//        [test shktest];
//        [test shktest];
//        SHKTest *test1 = test;
//        SHKTest *test2 = test;
//
//        NSLog(@"=========");
//        NSLog(@"=========:%p",test);
//        Class cls  = test.class;
//        cls->test();
//        int size =   class_getInstanceSize(cls);
//        struct objc_class *cls1 =  (__bridge struct objc_class *)cls;
//        NSLog(@"=========");
//        cls1.test;
//
//        unsigned int methodCount =0;
//        Method* methodList = class_copyMethodList([cls class],&methodCount);
//
        SHKTest *object = [SHKTest alloc];
        id __weak objc = object;
        NSLog(@"=========");

        
    }
    return 0;
}
