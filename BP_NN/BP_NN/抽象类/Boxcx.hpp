//
//  Boxcx.hpp
//  BP_NN
//
//  Created by hcwang3 on 2022/6/15.
//

#ifndef Boxcx_hpp
#define Boxcx_hpp

#include <stdio.h>

class Boxcx {
    
//C++ 接口是使用抽象类来实现的，抽象类与数据抽象互不混淆，数据抽象是一个把实现细节与相关的数据分离开的概念    
//    如果类中至少有一个函数被声明为纯虚函数，则这个类就是抽象类。纯虚函数是通过在声明中使用 "= 0" 来指定的，
public:
    //纯虚函数
    virtual double getVolume() = 0;
private:
    double length;      // 长度
    double breadth;     // 宽度
    double height;      // 高度
};

#endif /* Boxcx_hpp */
