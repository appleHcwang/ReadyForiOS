//
//  IFLYMPProductMainController.h
//  IFLYMPaaS
//
//  Created by admin on yuqiang2022/8/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IFLYMPProductMainController : UIViewController

- (void)hiddenTabBar:(BOOL)hidden;

@end

#pragma mark - UIViewController+IFLYMPProduct
@interface UIViewController (IFLYMPProduct)

- (IFLYMPProductMainController *)iflymp_productMainController;

@end

NS_ASSUME_NONNULL_END
