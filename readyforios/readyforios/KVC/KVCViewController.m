//
//  KVCViewController.m
//  readyforios
//
//  Created by hcwang3 on 2022/3/31.
//


#import "KVCViewController.h"


@interface PersonKVC()
{
    @public
//    NSString    *jeName;
    NSString    *isName;
    
}
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger age;

@end

@implementation PersonKVC

//2、如果没找到，就去找accessInstanceVariablesDirectly这个方法，如果这个方法返回YES，就可以进行下一步，如果返回NO，就抛出异常
+ (BOOL)accessInstanceVariablesDirectly {
    return YES;
}

-(NSString *)name{
    return _name;
}
@end

////////////////////////// ///////////////////////// 类分割线  /////////////////////////
//#import "PersonKVC+JE.h"
@interface PersonKVC (JE)
{
    
}
@property (nonatomic, strong) NSString *jeName;

@end


@implementation  PersonKVC(JE)


//set方法1


//set<Key>->_set<Key>->setIs<Key>
-(void)setIsJeName:(NSString *)jeName {
    NSLog(@"%s - %@",__func__,jeName);
}
//_key->_iskey->key->iskey
//set方法2

//set方法3  ---------  这个方法官方文档上面没有提，但是确实是调用了
//- (void)setIsName:(NSString *)name{
//    NSLog(@"%s - %@",__func__,name);
//}



//-(NSString *)getJeName {
//
//    return @"getJeName";
//}

//-(NSString *)jeName {
//
//    return @"JeName";
//}
//
//-(NSString *)isJeName {
//
//    return @"isJeName";
//}


-(NSString *)_jeName {
    
    return @"_JeName";
}

@end

////////////////////// /////////////////////////  类分割线   /////////////////////////

@interface KVCViewController ()

@end

@implementation KVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"KVC";
    
    // 对其内容进行赋值
    PersonKVC *p = [PersonKVC new];
    
    [p setValue:@"nameValue" forKey:@"name"];
    //[p setValue:@"nameValue" forKey:@"_name"];
    [p setValue:@"jeNameValue" forKey:@"jeName"];
    [p setValue:@4 forKey:@"age"];
    /*
     2022-03-31 19:57:32.142998+0800 readyforios[98301:7389001] name = nameValue,  jeName = jeNameValue  age = 4
     */
    NSLog(@"name = %@, %@ age = %@",p.name,[p valueForKey:@"jeName"],@(p.age));

    max(100, 100);
    // Do any additional setup after loading the view.
}

 
int max (int num1, int num2) {
    int result;
    
    if (num1 > num2) result = num1;
    else result = num2;
    
    struct person {
        int age;
    } ;
    
   struct person p ;
    p.age = 10;
    
    typedef  struct student {
        int age;
    } stu;
    stu s ;
    s.age = 11;
   
    
    return result;
}

@end


