//
//  IFLYMPaaS+Product.h
//  IFLYMPaaS
//
//  Created by admin on yuqiang2022/8/17.
//

#if __has_include(<IFLYMPaaS/IFLYMPaaS.h>)
#import <IFLYMPaaS/IFLYMPaaS.h>
#elif __has_include("IFLYMPaaS.h")
#import "IFLYMPaaS.h"
#endif
#import <UIKit/UIKit.h>
#import "IFLYMPProductProtocol.h"
#import "IFLYMPProductMainController.h"

NS_ASSUME_NONNULL_BEGIN

@interface IFLYMPaaS (Product)

/// 注册产品导航栏关联的页面
/// @param viewController 页面实例对象
- (void)registerProudctPage:(UIViewController <IFLYMPProductProtocol>*)viewController;

/// 获取产品方案
/// @param success 成功回调（主线程）
/// @param failure 失败回调（主线程）
- (void)requestProductSchemeWithSuccess:(void(^)(NSDictionary * _Nullable data))success
                                failure:(void(^)(NSError *_Nullable error))failure;

/// 获取应用列表
/// @param schemeId 方案 ID
/// @param success 成功回调（主线程）
/// @param failure 失败回调（主线程）
- (void)requestProductAppstWithSchemeId:(NSString *)schemeId
                                success:(void(^)(NSDictionary * _Nullable data))success
                                failure:(void(^)(NSError *_Nullable error))failure;

@end

NS_ASSUME_NONNULL_END
