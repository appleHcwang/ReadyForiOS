//
//  ViewController.m
//  readyforios
//
//  Created by hcwang3 on 2022/1/26.
//

#import "ViewController.h"
#import "TestMessage.h"
#import <objc/runtime.h>

#import "TestView.h"

@interface ViewController ()
{
    
}
@property (nonatomic,strong) TestMessage* test;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /******类方法调用******/
//    [[TestMessage class] performSelector:@selector(testClassFunction)];
//    CALayer *aa = [[CALayer alloc] init];
    // Do any additional setup after loading the view.
    
    TestView * testV = [[TestView alloc] init];
    testV.frame = CGRectMake(100, 100, 200, 200);
    testV.backgroundColor = [UIColor redColor];
    [self.view addSubview:testV];
    
    
    UIView * greenV = [[UIView alloc] init];
    greenV.frame = CGRectMake(0, 0, 50, 50);
    greenV.backgroundColor = [UIColor greenColor];
    [testV addSubview:greenV];
    
    
    UIView * yellowV = [[UIView alloc] init];
    yellowV.frame = CGRectMake(50, 50, 50, 50);
    yellowV.backgroundColor = [UIColor yellowColor];
    [testV addSubview:yellowV];
    [self testdfd];
        
    
}

-(void)testdfd {
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
          dispatch_group_t group = dispatch_group_create();
          dispatch_group_async(group, dispatch_queue_create("com.dispatch.test", DISPATCH_QUEUE_CONCURRENT), ^{
              NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
              NSURLSessionDownloadTask *task = [[NSURLSession sharedSession] downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                  // 请求完成，可以通知界面刷新界面等操作
                  NSLog(@"第一步网络请求完成");
                  // 使信号的信号量+1，这里的信号量本来为0，+1信号量为1(绿灯)
                  dispatch_semaphore_signal(semaphore);
              }];
              [task resume];
              // 以下还要进行一些其他的耗时操作
              NSLog(@"耗时操作继续进行");
              dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
          });
    
    
          dispatch_group_async(group, dispatch_queue_create("com.dispatch.test", DISPATCH_QUEUE_CONCURRENT), ^{
              NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://www.github.com"]];
              NSURLSessionDownloadTask *task = [[NSURLSession sharedSession] downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                  // 请求完成，可以通知界面刷新界面等操作
                  NSLog(@"第二步网络请求完成");
                  // 使信号的信号量+1，这里的信号量本来为0，+1信号量为1(绿灯)
                  dispatch_semaphore_signal(semaphore);
              }];
              [task resume];
              // 以下还要进行一些其他的耗时操作
              NSLog(@"耗时操作继续进行");
              dispatch_semaphore_wait(semaphore,DISPATCH_TIME_FOREVER);
          });
          
    
          dispatch_group_notify(group, dispatch_get_main_queue(), ^{
              NSLog(@"刷新界面等在主线程的操作");
          });
}


 
@end
