//
//  IFLYMPConstants.h
//  IFLYMPaaS
//
//  Created by admin on 2022/8/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @abstract
 * 网络类型
 *
 * @discussion
 *   IFLYMPNetworkTypeNONE - NULL
 *   IFLYMPNetworkType2G - 2G
 *   IFLYMPNetworkType3G - 3G
 *   IFLYMPNetworkType4G - 4G
 *   IFLYMPNetworkTypeWiFi - WiFi
 *   IFLYMPNetworkTypeALL - ALL
 *   IFLYMPNetworkType5G - 5G
 */
typedef NS_OPTIONS(NSInteger, IFLYMPNetworkType) {
    IFLYMPNetworkTypeNONE         = 0,
    IFLYMPNetworkType2G    = 1 << 0,
    IFLYMPNetworkType3G    = 1 << 1,
    IFLYMPNetworkType4G    = 1 << 2,
    IFLYMPNetworkTypeWiFi  = 1 << 3,
    IFLYMPNetworkTypeALL   = 0xFF,
#ifdef __IPHONE_14_1
    IFLYMPNetworkType5G    = 1 << 4
#endif
};

/**
 * @abstract
 * AutoTrack 中的事件类型
 *
 * @discussion
 *   IFLYMPEventTypeAppStart - AppStart
 *   IFLYMPEventTypeAppEnd - AppEnd
 *   IFLYMPEventTypeAppClick - AppClick
 *   IFLYMPEventTypeAppViewScreen - AppViewScreen
 */
typedef NS_OPTIONS(NSInteger, IFLYMPAutoTrackEventType) {
    IFLYMPEventTypeNone      = 0,
    IFLYMPEventTypeAppStart      = 1 << 0,
    IFLYMPEventTypeAppEnd        = 1 << 1,
    IFLYMPEventTypeAppClick      = 1 << 2,
    IFLYMPEventTypeAppViewScreen = 1 << 3,
};

NS_ASSUME_NONNULL_END
