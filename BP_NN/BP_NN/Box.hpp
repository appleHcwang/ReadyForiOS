//
//  Box.hpp
//  BP_NN
//
//  Created by 王汉春 on 2022/6/6.
//

#ifndef Box_hpp
#define Box_hpp

#pragma once
#include <stdio.h>

 
class Box
{
    
public:
    double length;   // 盒子的长度
    double breadth;  // 盒子的宽度
    double height;   // 盒子的高度
    // 成员函数声明
         double get(void);
         void set( double len, double bre, double hei );
};




#endif /* Box_hpp */
