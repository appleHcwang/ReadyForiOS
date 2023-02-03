//
//  IFLYMPaaS.h
//  IFLYMPaaS
//
//  Created by qiang on 2022/7/22.
//

#import <Foundation/Foundation.h>
#import "IFLYMPConfig.h"
#import "IFLYMPaaS+Public.h"

#pragma mark - IFLYMPaaS
#if __has_include("IFLYMPaaS+CheckUpgrade.h")
#import "IFLYMPaaS+CheckUpgrade.h"
#endif

#if __has_include("IFLYMPaaS+Statistic.h")
#import "IFLYMPaaS+Statistic.h"
#endif

#if __has_include("IFLYMPaaS+DeviceID.h")
#import "IFLYMPaaS+DeviceID.h"
#endif

#if __has_include("IFLYMPaaS+APM.h")
#import "IFLYMPaaS+APM.h"
#endif

#if __has_include("IFLYMPaaS+Product.h")
#import "IFLYMPaaS+Product.h"
#endif

#pragma mark - IFLYMPConfig
#if __has_include("IFLYMPConfig+Statistic.h")
#import "IFLYMPConfig+Statistic.h"
#endif

//#if __has_include("IFLYMPConfig+Behavior.h")
//#import "IFLYMPConfig+Behavior.h"
//#endif

