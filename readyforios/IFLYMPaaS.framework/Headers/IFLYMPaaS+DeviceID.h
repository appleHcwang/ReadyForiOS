//
//  IFLYMPaaS+DeviceID.h
//  IFLYMPaaS
//
//  Created by admin on yuqiang2022/8/15.
//

#if __has_include(<IFLYMPaaS/IFLYMPaaS.h>)
#import <IFLYMPaaS/IFLYMPaaS.h>
#elif __has_include("IFLYMPaaS.h")
#import "IFLYMPaaS.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface IFLYMPaaS (DeviceID)

/// 设备 ID （仅在移动开发平台使用）
- (NSString *)deviceId;

@end

NS_ASSUME_NONNULL_END
