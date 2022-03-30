//
//  KVOViewController.h
//  readyforios
//
//  Created by hcwang3 on 2022/3/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class Train;
@interface KVOViewController : UIViewController

@end


@interface Car : NSObject


@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;

@property (nonatomic, strong) Train *train;


@end


@interface Train : NSObject


@property (nonatomic, copy) NSString *jie;


@end




NS_ASSUME_NONNULL_END
