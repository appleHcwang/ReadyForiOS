//
//  Rectangle.hpp
//  BP_NN
//
//  Created by hcwang3 on 2022/6/15.
//

#ifndef Rectangle_hpp
#define Rectangle_hpp

#include <stdio.h>
#include "Shape.hpp"
// 派生类
class Rectangle: public Shape
{
public:
   int getArea()
   {
      return (width * height);
   }
};



#endif /* Rectangle_hpp */
