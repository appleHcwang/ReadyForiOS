//
//  IFLYMPaaS+Public.h
//  IFLYMPaaS
//
//  Created by qiang on 2022/7/27.
//

#import <Foundation/Foundation.h>

@class IFLYMPConfig;

NS_ASSUME_NONNULL_BEGIN

@interface IFLYMPaaS : NSObject

+ (IFLYMPaaS *)sharedInstance;

/// 通过参数配置，开启讯飞移动开发平台 SDK
/// @param config 参数配置
+ (void)startWithConfig:(IFLYMPConfig *)config NS_SWIFT_NAME(start(config:));

/// 当前 SDK 版本
- (NSString *)sdkVersion;

/// 登录
/// @param loginId 业务 ID
- (void)login:(NSString *)loginId;

/// 退出登录
- (void)logout;

/// 当前登录的业务 ID
- (NSString *)loginId;

@end

NS_ASSUME_NONNULL_END
