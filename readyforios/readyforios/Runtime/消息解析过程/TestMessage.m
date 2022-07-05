//
//  TestMessage.m
//  readyforios
//
//  Created by hcwang3 on 2022/1/26.
//

#import "TestMessage.h"
#import <objc/runtime.h>
@implementation TestMessage
/*
 * 消息发送后，经过一系列查找都没结果时，会进入动态方法决议
 *对象在接收到未知的消息时，首先会调用所属类的方法+resolveInstanceMethod:(实例方法)或者+resolveClassMethod:(类方法)。在这个方法中，我们有机会为该未知消息新增一个”处理方法””。不过使用该方法的前提是我们已经实现了该”处理方法”，只需要在运行时通过class_addMethod函数动态添加到类里面就可以了。如下代码所示：
 *
 */

+(BOOL)resolveClassMethod:(SEL)sel {
    
    NSString * selStr = NSStringFromSelector(sel);
    if ([selStr isEqualToString:@"drink"]) {
        class_addMethod(self.class, @selector(drink), (IMP)functionForMethod1, "@:");
    }
    
    
    return [super resolveClassMethod:sel];
}

+(BOOL)resolveInstanceMethod:(SEL)sel {
//    NSString * selStr = NSStringFromSelector(sel);
//    if ([selStr isEqualToString:@"eat"]) {
//        class_addMethod(self.class, @selector(eat), (IMP)functionForMethod1, "@:");
//    }
    
   
    return [super resolveInstanceMethod:sel];
}

void functionForMethod1(id self, SEL _cmd) {
   NSLog(@"%@, %p", self, _cmd);
}

/*
 ***备用接收者
 如果在上一步无法处理消息，则Runtime会继续调以下方法：-
 第二步:Fast forwarding 快速转发阶段 （后面阶段都针对对象来处理，不考虑类方法）
 */
- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"forwardingTargetForSelector");
    NSString *selectorString = NSStringFromSelector(aSelector);
    // 将消息转发给_helper来处理
    if ([selectorString isEqualToString:@"eat"]) {
        return [[help alloc] init];
    }
    return [super forwardingTargetForSelector:aSelector];
}

/**
 *Normal forwarding 常规转发阶段
 *第三步：Normal forwarding 常规转发阶段
 如果第2步返回self或者nil,则说明没有可以响应的目标 则进入第三步。
 第三步的消息转发机制本质上跟第二步是一样的都是切换接受消息的对象，但是第三步切换响应目标更复杂一些，第二步里面只需返回一个可以响应的对象就可以了，第三步还需要手动将响应方法切换给备用响应对象。
 第三步有2个步骤：
 *
 *
 * 在第(1)步中，返回SEL方法的签名，返回的签名是根据方法的参数来封装的。
 1.手动创建签名 但是尽量少使用 因为容易创建错误 可以按照这个规则来创建
 https://blog.csdn.net/ssirreplaceable/article/details/53376915
 根据OBJC的编码类别进行编写后面的char （但是容易写错误，所以建议使用下面的方法）
 NSMethodSignature *sign = [NSMethodSignature signatureWithObjCTypes:"v@:"];
 //写法例子
 //例子"v@:@"
 //v@:@ v:返回值类型void;@ id类型,执行sel的对象;：SEL;@参数
 //例子"@@:"
 //@:返回值类型id;@id类型,执行sel的对象;：SEL
 2.自动创建签名
 BackupTestMessage * backUp = [BackupTestMessage new];
 NSMethodSignature * sign = [backUp methodSignatureForSelector:aSelector];
 使用对象本身的methodSignatureForSelector自动获取该SEL对应类别的签名

 */
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    //如果返回为nil则进行手动创建签名
   if ([super methodSignatureForSelector:aSelector]==nil) {
        NSMethodSignature * sign = [NSMethodSignature signatureWithObjCTypes:"v@:"];
        return sign;
    }
    return [super methodSignatureForSelector:aSelector];
}

//上方的第(1)步中如果调用返回有签名 则进入消息转发最后一步
-(void)forwardInvocation:(NSInvocation *)anInvocation{
    //创建备用对象
    help * backUp = [help new];
    SEL sel = anInvocation.selector;
    //判断备用对象是否可以响应传递进来等待响应的SEL
    if ([backUp respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:backUp];
    }else{
       // 如果备用对象不能响应 则抛出异常
        [self doesNotRecognizeSelector:sel];
    }
}

@end

@implementation help

-(void)eat {
    NSLog(@"吃eat");
}
@end


