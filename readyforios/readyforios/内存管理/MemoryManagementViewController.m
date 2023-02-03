//
//  MemoryManagementViewController.m
//  readyforios
//
//  Created by hcwang3 on 2022/6/6.
//

#import "MemoryManagementViewController.h"
#import "TestMessage.h"
@interface MemoryManagementViewController ()
{
    
}
@property(nonatomic,weak) NSString * test;
@property (nonatomic,strong) TestMessage* testObj;

@property (nonatomic,copy)void(^myBlock)(MemoryManagementViewController *v);
@end

@implementation MemoryManagementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.test = @"dfd";
    self.view.backgroundColor = [UIColor whiteColor];
//    [self sss];
    
    self.myBlock = ^(MemoryManagementViewController * v) {
        
        NSLog(@"*****%@",v.test);
    };
    
    int count =10;
    self.myBlock(self);
    
[self logAdrress];
//    NSString *str = @"lu";
//    NSLog(@"内存地址：%p - 指针地址：%p",str, &str);
//
    
    // Do any additional setup after loading the view.
}



-(void)logAdrress {
    
self.testObj = [[TestMessage alloc] init];
//    self.testObj = aa;
    self.testObj = nil;
    NSLog(@"**********测试%@",self.test);
  
    // 打印引用计数
    NSLog(@"retain  count = %ld\n",CFGetRetainCount((__bridge  CFTypeRef)(_testObj)));

    
    NSString *str = @"lu";
    NSLog(@"内存地址：%p - 指针地址：%p",self.testObj, &(_testObj));


    
}

-(void)sss {
    dispatch_after(3, dispatch_get_main_queue(), ^{
        
    });
}

-(NSString *)test {
    return _test;
}

-(void)dealloc {
    
    
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
