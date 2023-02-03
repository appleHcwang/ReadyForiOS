//
//  MyThread.m
//  readyforios
//
//  Created by hcwang3 on 2023/2/3.
//

#import "MyThread.h"

@implementation MyThread



//监测线程销毁
-(void)dealloc{

NSLog(@"%s",__func__);

}

@end
