//
//  IFLYMPProductProtocol.h
//  IFLYMPaaS
//
//  Created by admin on yuqiang2022/8/17.
//

#import <Foundation/Foundation.h>
#import "IFLYMPProductNavModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol IFLYMPProductProtocol <NSObject>

/// 导航栏 ID，用来和服务端数据关联
- (NSString *)iflymp_productNavigationId;

/// 获取到服务端数据后的回调
/// @param schemeModel 方案信息
/// @param navModel 导航栏信息
- (void)iflymp_productDidFeatchData:(IFLYMPProductNavData *)schemeModel model:(IFLYMPProductNavModel *)navModel;

@end

NS_ASSUME_NONNULL_END
