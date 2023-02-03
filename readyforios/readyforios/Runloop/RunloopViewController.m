//
//  RunloopViewController.m
//  readyforios
//
//  Created by hcwang3 on 2022/3/9.
//

#import "RunloopViewController.h"

@interface RunloopViewController ()
{
    
}
@end

@implementation RunloopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"runloop";
    
//    CFRunLoopRef runLoopRef = CFRunLoopGetMain();
//    CFArrayRef modes =  CFRunLoopCopyAllModes(runLoopRef);
//    NSLog(@"MainRunLoop中的modes:%@",modes);
//    NSLog(@"MainRunLoop对象：%@",runLoopRef);
    
    NSLog(@"%s",__func__);
    NSLog(@"111");
    NSString *animal = [[NSString alloc] init] ;
    NSLog(@"222");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%s",__func__);
}
 
 
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

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
