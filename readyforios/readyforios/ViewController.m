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
#import "readyforios-Swift.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
}
@property (nonatomic,strong) TestMessage* test;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"fsfs";
      
  //reversedString
    
    NSLog(@"%@",[SwiftCode reversedString:@"Hello"]);
 
    self.dataArray = [NSMutableArray arrayWithObjects:@"RunloopViewController",@"RuntimeViewController",@"KVOViewController",@"KVCViewController",@"readyforios.IFLYCollLabelSetVC",@"BlockViewController",@"MemoryManagementViewController",@"GCDViewController",@"readyforios.JSAndSwift",@"webViewViewController",nil];
//    /******类方法调用******/

   [self creatTableView];
//    dispatch_async(dispatch_get_main_queue(), ^{
////        for (int i = 0; i < 10000000000; i++) {
////           NSLog(@"___%d",i);
////        }
//        NSLog(@"AAAAAAAAA");
//    });
//
//
//
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"BBBBBBB");
//    });
//    NSLog(@"CCCCCCCCCCC");
    
 
    
    
}

- (void)creatTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifierString = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
    }
 
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.adjustsFontForContentSizeCategory = YES;

    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    Class aa =  NSClassFromString(self.dataArray[indexPath.row]);
    
    UIViewController * vc = [[NSClassFromString(self.dataArray[indexPath.row]) alloc] init];
    
    
    
    [self.navigationController pushViewController:vc animated:YES];
 
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70;
}


 

-(void)posttUrlsuccess:(ResponseSuccess)success fail:(ResponseFail)fail {
    
    if (success) {
        success(@"cccccc");
    }
    
    if (fail) {
        fail(NSError.new);
    }
    
    
}
 
@end
