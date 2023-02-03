//
//  IFLYMPaaS+Statistic.h
//  IFLYMPaaS
//
//  Created by admin on 2022/7/29.
//

#if __has_include(<IFLYMPaaS/IFLYMPaaS.h>)
#import <IFLYMPaaS/IFLYMPaaS.h>
#elif __has_include("IFLYMPaaS.h")
#import "IFLYMPaaS.h"
#endif
#import "IFLYMPEventObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface IFLYMPaaS (Statistic)

/// 采集事件
/// @param object 事件内容对象
- (void)trackEventObject:(IFLYMPEventObject *)object;

/// 采集自定义事件
/// @param event 事件名称
/// @param properties 事件属性
- (void)trackEvent:(NSString *)event properties:(NSDictionary *)properties;

/// 事件上报
- (void)flush;

@end

NS_ASSUME_NONNULL_END
