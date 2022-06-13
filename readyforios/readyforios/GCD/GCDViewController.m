//
//  GCDViewController.m
//  readyforios
//
//  Created by hcwang3 on 2022/3/7.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testXhL];
    // Do any additional setup after loading the view.
}

//gcd的信号量主要有3个函数
/**
 场景使用
 技巧可用于以下场景：
 多个请求结束后统一操作
 多个请求顺序执行
 */
-(void)testXhL {
    //创建一个值为M的信号量
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
      dispatch_group_t group = dispatch_group_create();

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
          NSLog(@"耗时操作继续进行22");
          //如果该信号量的值大于0，则使其信号量的值-1，否则，阻塞线程直到该信号量的值大于0或者达到等待时间。
          dispatch_semaphore_wait(semaphore,DISPATCH_TIME_FOREVER);
      });
    
    
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
        NSLog(@"耗时操作继续进行11");
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    });
      
      dispatch_group_notify(group, dispatch_get_main_queue(), ^{
          NSLog(@"刷新界面等在主线程的操作");
      });
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
