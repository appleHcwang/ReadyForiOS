//
//  IFLYMPAppCenterController.m
//  readyforios
//
//  Created by hcwang3 on 2022/9/30.
//

#import "IFLYMPAppCenterController.h"
#import <IFLYMPaaS/IFLYMPaaS.h>

@interface IFLYMPAppCenterController ()<IFLYMPProductProtocol>


 

@end

@implementation IFLYMPAppCenterController



#pragma mark - IFLYMPProductProtocol
- (NSString *)iflymp_productNavigationId {
    return @"47635c749b3962a03cb5a227c267a6bf";
}
 
- (void)iflymp_productDidFeatchData:(IFLYMPProductNavData *)schemeModel model:(IFLYMPProductNavModel *)navModel {
    // SDK 获取到数据后的回调
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
