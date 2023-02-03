//
//  IFLYMPProductNavModel.h
//  IFLYMPaaS
//
//  Created by admin on yuqiang2022/8/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    IFLYMPProductNavAppTypeH5 = 1,
    IFLYMPProductNavAppTypeMiniProgram,
    IFLYMPProductNavAppTypeIOS,
    IFLYMPProductNavAppTypeAndroid,
} IFLYMPProductNavAppType;

typedef enum : NSUInteger {
    IFLYMPProductNavAppSourceCustom,
    IFLYMPProductNavAppSourceStore,
} IFLYMPProductNavAppSource;

@interface IFLYMPProductNavApplication : NSObject

/// 应用 id
@property (nonatomic, copy) NSString *Id;

/// 应用名称
@property (nonatomic, copy) NSString *name;

/// 应用类型 1-H5应用 2-小程序 3-IOS应用 4-Android应用
@property (nonatomic, assign) IFLYMPProductNavAppType type;

/// 应用来源 1-自建应用 2-应用市场
@property (nonatomic, assign) IFLYMPProductNavAppSource source;

/// 应用描述
@property (nonatomic, copy) NSString *desc;

/// 是否是常用应用 true 是 false 否
@property (nonatomic, assign) BOOL isCommon;

/// 应用 url，应用类型为 H5 应用时有值
@property (nonatomic, copy) NSString *url;

/// 应用图标
@property (nonatomic, copy) NSString *icon;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

typedef enum : NSUInteger {
    IFLYMPProductNavAssociateTypeURL = 1,
    IFLYMPProductNavAssociateTypeCompment,
    IFLYMPProductNavAssociateTypeApp,
} IFLYMPProductNavAssociateType;

@interface IFLYMPProductNavModel : NSObject

/// 导航栏 ID
@property (nonatomic, copy) NSString *ID;

/// 导航栏名称
@property (nonatomic, copy) NSString *name;

/// 关联类型
@property (nonatomic, assign) IFLYMPProductNavAssociateType type;

/// 关联类型为 2 时有值，1 代表 应用中心模版
@property (nonatomic, assign) NSInteger componentType;

/// 关联类型为 2 时有值，应用模板 id
@property (nonatomic, copy) NSString *componentId;

/// 关联类型为 3 时有值，应用 id
@property (nonatomic, copy) NSString *appId;

/// 关联类型为 3 时有值
@property (nonatomic, strong) IFLYMPProductNavApplication *application;

/// 关联类型为 1 时有值
@property (nonatomic, copy) NSString *url;

/// 未选中字体颜色，格式为：#1f75cb
@property (nonatomic, copy) NSString *unselectedFontColor;

/// 已选中字体颜色 ，格式为：#1f75cb
@property (nonatomic, copy) NSString *selectedFontColor;

/// 未选中按钮样式 ，格式为：http://xxxx
@property (nonatomic, copy) NSString *unselectedIcon;

/// 已选中按钮样式 ，格式为：http://xxxx
@property (nonatomic, copy) NSString *selectedIcon;

@end

@interface IFLYMPProductNavData : NSObject

/// 产品方案名称
@property (nonatomic, copy) NSString *name;

/// 产品方案 ID
@property (nonatomic, copy) NSString *Id;

/// 产品方案描述
@property (nonatomic, copy) NSString *desc;

/// 导航栏列表，已经按照先后顺序进行排序
@property (nonatomic, strong) NSArray <IFLYMPProductNavModel *>*navList;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
