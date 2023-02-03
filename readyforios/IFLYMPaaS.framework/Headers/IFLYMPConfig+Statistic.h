//
//  IFLYMPConfig+Statistic.h
//  IFLYMPaaS
//
//  Created by admin on 2022/8/6.
//

#import "IFLYMPConfig.h"
#import "IFLYMPConstants.h"

NS_ASSUME_NONNULL_BEGIN

@interface IFLYMPConfig ()

/**
 * @property
 *
 * @abstract
 * 两次数据发送的最小时间间隔，单位秒
 *
 * @discussion
 * 默认值为 15 秒， 在每次调用 track 接口的时候，
 * 都会检查如下条件，以判断是否向服务器上传数据:
 * 1. 是否 WiFi/3G/4G/5G 网络
 * 2. 是否满足以下数据发送条件之一:
 *   1) 与上次发送的时间间隔是否大于 flushInterval
 *   2) 本地缓存日志数目是否达到 flushBulkSize
 * 如果满足这两个条件之一，则向服务器发送一次数据；如果都不满足，则把数据加入到队列中，等待下次检查时把整个队列的内容一并发送。
 * 需要注意的是，为了避免占用过多存储，队列最多只缓存 10000 条数据。
 */
@property (nonatomic) NSInteger flushInterval;

/**
 * @property
 *
 * @abstract
 * 本地缓存的最大事件数目，当累积日志量达到阈值时发送数据
 *
 * @discussion
 * 默认值为 100，在每次调用 track 等接口的时候，都会检查如下条件，以判断是否向服务器上传数据:
 * 1. 是否 WiFi/3G/4G/5G 网络
 * 2. 是否满足以下数据发送条件之一:
 *   1) 与上次发送的时间间隔是否大于 flushInterval
 *   2) 本地缓存日志数目是否达到 flushBulkSize
 * 如果同时满足这两个条件，则向服务器发送一次数据；如果不满足，则把数据加入到队列中，等待下次检查时把整个队列的内容一并发送。
 * 需要注意的是，为了避免占用过多存储，队列最多只缓存 10000 条数据。
 */
@property (nonatomic) NSInteger flushBulkSize;

/**
 * @abstract
 * 设置 flush 时网络发送策略
 *
 * @discussion
 * 默认 3G、4G、WI-FI 环境下都会尝试 flush
 */
@property (nonatomic) IFLYMPNetworkType flushNetworkPolicy;

@end

NS_ASSUME_NONNULL_END
