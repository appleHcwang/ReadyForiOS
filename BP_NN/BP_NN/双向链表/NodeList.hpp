//
//  NodeList.hpp
//  BP_NN
//
//  Created by hcwang3 on 2022/6/9.
//

#ifndef NodeList_hpp
#define NodeList_hpp

#include <stdio.h>


template<class T>
class Node {
public:
    Node() {}
    Node *pre;
    Node *next;
    // 由于data属性是私有的
    // 所以采用get和set对data进行处理
    void setData(T data) ;
    T getData() ;
private:
    T data;
};




#endif /* NodeList_hpp */
