//
//  AppDelegate.m
//  readyforios
//
//  Created by hcwang3 on 2022/1/26.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    ViewController *v = [ViewController new];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:v];
    self.window.rootViewController = nav;
    
 

    

    
    return YES;
}


#pragma mark - UISceneSession lifecycle




@end
