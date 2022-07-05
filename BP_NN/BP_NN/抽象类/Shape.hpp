//
//  Shape.hpp
//  BP_NN
//
//  Created by hcwang3 on 2022/6/15.
//

#ifndef Shape_hpp
#define Shape_hpp

#include <stdio.h>
using namespace std;

// 基类
class Shape
{
public:
    // 提供接口框架的纯虚函数
    virtual int getArea() = 0;
    void setWidth(int w)
    {
        width = w;
    }
    void setHeight(int h)
    {
        height = h;
    }
protected:
    int width;
    int height;
};
 

#endif /* Shape_hpp */
