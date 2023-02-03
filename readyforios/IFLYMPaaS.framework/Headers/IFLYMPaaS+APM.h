//
//  IFLYMPaaS+APM.h
//  IFLYMPaaS
//
//  Created by admin on 2022/7/29.
//

#if __has_include(<IFLYMPaaS/IFLYMPaaS.h>)
#import <IFLYMPaaS/IFLYMPaaS.h>
#elif __has_include("IFLYMPaaS.h")
#import "IFLYMPaaS.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface IFLYMPaaS (APM)

/// 开启崩溃采集
- (void)enableTrackCrash __attribute__((deprecated("已过时，请参考 enableTrackAPM")));;

/// 开启 APM 数据采集（崩溃、卡顿、卡死）
- (void)enableTrackAPM;

@end

NS_ASSUME_NONNULL_END
