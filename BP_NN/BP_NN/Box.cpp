//
//  Box.cpp
//  BP_NN
//
//  Created by 王汉春 on 2022/6/6.
//

#include "Box.hpp"
#include <iostream>
using namespace std;
 
/*
extern 存储类
extern 存储类用于提供一个全局变量的引用，全局变量对所有的程序文件都是可见的。当您使用 'extern' 时，对于无法初始化的变量，会把变量名指向一个之前定义过的存储位置。

当您有多个文件且定义了一个可以在其他文件中使用的全局变量或函数时，可以在其他文件中使用 extern 来得到已定义的变量或函数的引用。可以这么理解，extern 是用来在另一个文件中声明一个全局变量或函数。
 */
extern int countt;
// 成员函数定义
double Box::get(void) {
    return length * breadth * height;
}
 
void Box::set( double len, double bre, double hei) {
    length = len;
    breadth = bre;
    height = hei;
}


void  write_extern(void)
{
   std::cout << "Count is " << countt << std::endl;
}
