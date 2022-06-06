//
//  Box.cpp
//  BP_NN
//
//  Created by 王汉春 on 2022/6/6.
//

#include "Box.hpp"
#include <iostream>
using namespace std;
 
// 成员函数定义
double Box::get(void)
{
    return length * breadth * height;
}
 
void Box::set( double len, double bre, double hei)
{
    length = len;
    breadth = bre;
    height = hei;
}
