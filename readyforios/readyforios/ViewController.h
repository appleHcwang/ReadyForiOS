//
//  ViewController.h
//  readyforios
//
//  Created by hcwang3 on 2022/1/26.
//

#import <UIKit/UIKit.h>


typedef void( ^ ResponseSuccess)(id response);
typedef void( ^ ResponseFail)(NSError *error);
@interface ViewController : UIViewController

@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) UITableView * tableView;
-(void)posttUrlsuccess:(ResponseSuccess)success fail:(ResponseFail)fail;
@end

