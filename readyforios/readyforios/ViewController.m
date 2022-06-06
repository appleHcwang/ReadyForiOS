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
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"fsfs";
    IFLYCollTypeSelectView * view = [[IFLYCollTypeSelectView alloc] initWithFrame:self.view.bounds];
    view.dataArr = @[];
//    [view setDataSourceWithArr:@[@"1",@"2",@"3",@"5"]];
    [self.view addSubview:view];
    
    TestSwift *ss = [[TestSwift alloc] init];
    ss.now = @"fdfd";
    

//    self.dataArray = [NSMutableArray arrayWithObjects:@"RunloopViewController",@"RuntimeViewController",@"KVOViewController",@"KVCViewController",@"readyforios.SwiftViewController",@"BlockViewController",@"MemoryManagementViewController",nil];
//    /******类方法调用******/
////    [[TestMessage class] performSelector:@selector(testClassFunction)];
////    CALayer *aa = [[CALayer alloc] init];
//    // Do any additional setup after loading the view.

//    TestView * testV = [[TestView alloc] init];
//    testV.frame = CGRectMake(100, 100, 200, 200);
//    testV.backgroundColor = [UIColor redColor];
//    [self.view addSubview:testV];
//
//
//    UIView * greenV = [[UIView alloc] init];
//    greenV.frame = CGRectMake(0, 0, 50, 50);
//    greenV.backgroundColor = [UIColor greenColor];
//    [testV addSubview:greenV];
//
//    UIView * yellowV = [[UIView alloc] init];
//    yellowV.frame = CGRectMake(50, 50, 50, 50);
//    yellowV.backgroundColor = [UIColor yellowColor];
//    [testV addSubview:yellowV];
////
//    [self creatTableView];
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
    
    NSArray * a = [NSArray arrayWithObjects:[SwiftViewController optionalTypeWithA:@"11" b:@"sds"], nil];
    
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

    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    Class aa =  NSClassFromString(self.dataArray[indexPath.row]);
    
 
    [self.navigationController pushViewController:[[NSClassFromString(self.dataArray[indexPath.row]) alloc] init] animated:YES];
 
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70;
}


 


 
@end
