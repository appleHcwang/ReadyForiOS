//
//  KVOViewController.m
//  readyforios
//
//  Created by hcwang3 on 2022/3/30.
//

#import "KVOViewController.h"
@interface KVOViewController ()
{
    
}

@property (nonatomic, strong) Car *car;
@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"KVO";
    _car = [[Car alloc] init];
    _car.train = [Train new];
    // 注册 self 也就是 controller 为自己的观察者
//    [_car addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
//    [_car addObserver:self forKeyPath:@"train.jie" options:(NSKeyValueObservingOptionNew)  context:nil];
    
    //多属性
    [_car addObserver:self forKeyPath:@"firstName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [_car addObserver:self forKeyPath:@"lastName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//     _car.name = @"哈哈";
    
//    [_car willChangeValueForKey:@"name"];
//    _car.name = @"哈哈";
//    // name的值改变完成
//    [_car didChangeValueForKey:@"name"];
    
//    _car.train.jie = @"200m";
    
    
    _car.firstName = @"fd";
    
    _car.lastName = @"fdd";
}

// 响应方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@ - %@ - %@",keyPath,object,change);
    
    /*
     typedef NS_ENUM(NSUInteger, NSKeyValueChange) {
         NSKeyValueChangeSetting = 1,//设值
         NSKeyValueChangeInsertion = 2,//插入
         NSKeyValueChangeRemoval = 3,//移除
         NSKeyValueChangeReplacement = 4,//替换
     };
     */
}

// 移除观察者
- (void)dealloc{
    [_car removeObserver:self forKeyPath:@"name"];
}

/*
#pragma mark - Navigation
*/

@end


@interface Car()


@end

@implementation Car

+ (NSSet<NSString *> *)keyPathsForValuesAffectingName{
    NSSet *keyPaths = [NSSet setWithArray:@[@"firstName",@"lastName"]];
    return keyPaths;
}

+(BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
    if([key isEqualToString:@"name"]){
        NSLog(@"关闭了自动触发");
        return NO;
    }
    return YES;
}

@end


@interface Train()


@end

@implementation Train



@end


