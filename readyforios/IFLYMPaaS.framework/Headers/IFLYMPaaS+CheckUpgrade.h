//
//  IFLYMPaaS+CheckUpgrade.h
//  IFLYMPaaS
//
//  Created by qiang on 2022/7/27.
//

#if __has_include(<IFLYMPaaS/IFLYMPaaS.h>)
#import <IFLYMPaaS/IFLYMPaaS.h>
#elif __has_include("IFLYMPaaS.h")
#import "IFLYMPaaS.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface IFLYMPaaS (CheckUpgrade)

/**
 主动检查是否有更新。
 不会自动弹框提示，一般用于自定义UI、检查是否有更新、提醒红点等情况
 
 @param complete 成功回调，返回升级信息字典
 @param failure  失败回调
 */
- (void)checkUpgradeWith:(void(^)(NSDictionary * _Nullable upgradeInfos))complete
                 failure:(void(^)(NSError * _Nullable error))failure;

@end

NS_ASSUME_NONNULL_END
