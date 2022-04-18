//
//  BlockViewController.m
//  readyforios
//
//  Created by hcwang3 on 2022/4/18.
//

#import "BlockViewController.h"

@interface BlockViewController ()

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"block";
    
    struct Books {
        char title[50];
    };
    
   struct Books Book;
   strcpy(Book.title, "dfdfd");
    struct Books *struct_pointer;
    struct_pointer = &Book;
    NSLog(@"%s",(*struct_pointer).title);
    
    [self testMethods];
    
    // Do any additional setup after loading the view.
}

- (void)testMethods {
    void (^blockA)(int a) = ^(int a) {
        NSLog(@"%d",a);
    };
    if (blockA) {
        blockA(1990);
    }
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
