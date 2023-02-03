//
//  IFLYMPEventObject.h
//  IFLYMPaaS
//
//  Created by admin on 2022/8/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IFLYMPEventPresetPropsObject : NSObject

@property (nonatomic, copy) NSString *deviceName;
@property (nonatomic, copy) NSString *deviceModel;
@property (nonatomic, assign) NSInteger screenWidth;
@property (nonatomic, assign) NSInteger screenHeight;
@property (nonatomic, copy) NSString *os;
@property (nonatomic, copy) NSString *manufacturer;
@property (nonatomic, copy) NSString *osVersion;
@property (nonatomic, copy) NSString *appId;
@property (nonatomic, copy) NSString *appVersion;

@property (nonatomic, strong) NSMutableDictionary *properties;

@end

@interface IFLYMPEventIdentitiesObject : NSObject

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *deviceId;

@end

@interface IFLYMPEventSDKObject : NSObject

@property (nonatomic, copy) NSString *sdkType;
@property (nonatomic, copy) NSString *sdkVersion;

@end

@interface IFLYMPEventObject : NSObject

/// 事件日志等级（只在本地落库时使用，不会上传到服务端）
@property (nonatomic, assign) NSInteger level;

/// 事件日志类型
@property (nonatomic, copy) NSString *type;

/// 事件名称
@property (nonatomic, copy) NSString *event;

/// 事件日志 ID
@property (nonatomic, assign) uint32_t track_id;

/// 事件触发时的时间戳
@property (nonatomic, assign) NSTimeInterval time;

/// 产品 ID
@property (nonatomic, copy) NSString *productId;

/// SDK  信息
@property (nonatomic, strong) IFLYMPEventSDKObject *sdk;

/// 用户标识信息
@property (nonatomic, strong) IFLYMPEventIdentitiesObject *identities;

/// 预置属性
@property (nonatomic, strong) IFLYMPEventPresetPropsObject *presetProps;

/// 自定义属性
@property (nonatomic, strong) NSMutableDictionary *properties;

- (instancetype)initWithType:(NSString *)type NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

- (NSMutableDictionary *)jsonObject;

/// 添加预置属性
/// @param properties 预置属性
- (void)addPresetProperties:(NSDictionary *)properties;

/// 添加自定义属性
/// @param properties 自定义属性
- (void)addCustomProperties:(NSDictionary *)properties;

@end

NS_ASSUME_NONNULL_END
