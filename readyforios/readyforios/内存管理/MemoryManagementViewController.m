//
//  MemoryManagementViewController.m
//  readyforios
//
//  Created by hcwang3 on 2022/6/6.
//

#import "MemoryManagementViewController.h"

@interface MemoryManagementViewController ()
{
    
}
@property(nonatomic,weak) NSString * test;
@end

@implementation MemoryManagementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.test = @"dfd";
    self.view.backgroundColor = [UIColor whiteColor];
    
   
    dispatch_async(dispatch_get_main_queue(), ^{
     
            for (int i = 0; i < 1000000; i ++) {
                @autoreleasepool {
                    NSString *string = @"Abc";
                    string = [string lowercaseString];
                    // string = [string stringByAppendingString:@"xyz"];
                    string = [string stringByAppendingFormat:@"xyz"];
                    NSLog(@"%d-%@", i, string);
                }
  
            }
        
    });

    [self sss];
    
    // Do any additional setup after loading the view.
}

-(void)sss {
    dispatch_after(3, dispatch_get_main_queue(), ^{
        NSLog(@"%p %@",self.test,self.test);
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
