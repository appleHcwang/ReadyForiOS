//
//  AppDelegate.m
//  readyforios
//
//  Created by hcwang3 on 2022/1/26.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <IFLYMPaaS/IFLYMPaaS.h>
#import "IFLYMPAppCenterController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    ViewController *v = [ViewController new];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:v];
    self.window.rootViewController = nav;

//

    
//    IFLYMPConfig *config = [[IFLYMPConfig alloc] init];
//     config.enableLog = YES;
//     [IFLYMPaaS startWithConfig:config];
//     [IFLYMPaaS.sharedInstance enableTrackCrash];
//
//    IFLYMPAppCenterController *appCenter = [[IFLYMPAppCenterController alloc] init];
//    [IFLYMPaaS.sharedInstance registerProudctPage:appCenter];
//
//
//    IFLYMPProductMainController *mainController = [[IFLYMPProductMainController alloc] init];
//    self.window.rootViewController = mainController;
//
  
    
    return YES;
}


#pragma mark - UISceneSession lifecycle




@end
