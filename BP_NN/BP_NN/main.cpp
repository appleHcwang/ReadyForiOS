//
//  main.cpp
//  BP_NN
//
//  Created by 王汉春 on 2022/6/6.
//

#include <iostream>
#include "Box.hpp"

using namespace std;

//常量定义
#define LENGTH 10
#define NEWLINE "\n"

const int LH = 10;


//函数声明
void dataType();
void bianLiangSm();
void jubuQuanJu();

// 变量声明
extern int a, b;
//extern int c;
int g = 20;


int countt = 10 ;
extern void write_extern();
 

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    cout << LENGTH << NEWLINE <<LH;

    countt = 5;
    write_extern();
    
    
    
     jubuQuanJu();
//    bianLiangSm();
//    dataType();
      
    return 0;
}

/*
 *局部变量 和 全局变量
 */

void jubuQuanJu() {
    int g = 10;
    cout << g;
    
    
}


/**
 *变量声明
 */

void bianLiangSm() {
    int a,b;
    int c;
    a = 10;
    b = 20;
    c = a + b;
    
    cout <<"\n" << c << "\n" ;
    
    
}

/**
 *数据类型
 */
void dataType() {
       cout << "type: \t\t" << "************size**************"<< endl;
        cout << "bool: \t\t" << "所占字节数：" << sizeof(bool);
        cout << "\t最大值：" << (numeric_limits<bool>::max)();
        cout << "\t\t最小值：" << (numeric_limits<bool>::min)() << endl;
        cout << "char: \t\t" << "所占字节数：" << sizeof(char);
        cout << "\t最大值：" << (numeric_limits<char>::max)();
        cout << "\t\t最小值：" << (numeric_limits<char>::min)() << endl;
        cout << "signed char: \t" << "所占字节数：" << sizeof(signed char);
        cout << "\t最大值：" << (numeric_limits<signed char>::max)();
        cout << "\t\t最小值：" << (numeric_limits<signed char>::min)() << endl;
        cout << "unsigned char: \t" << "所占字节数：" << sizeof(unsigned char);
        cout << "\t最大值：" << (numeric_limits<unsigned char>::max)();
        cout << "\t\t最小值：" << (numeric_limits<unsigned char>::min)() << endl;
        cout << "wchar_t: \t" << "所占字节数：" << sizeof(wchar_t);
        cout << "\t最大值：" << (numeric_limits<wchar_t>::max)();
        cout << "\t\t最小值：" << (numeric_limits<wchar_t>::min)() << endl;
        cout << "short: \t\t" << "所占字节数：" << sizeof(short);
        cout << "\t最大值：" << (numeric_limits<short>::max)();
        cout << "\t\t最小值：" << (numeric_limits<short>::min)() << endl;
        cout << "int: \t\t" << "所占字节数：" << sizeof(int);
        cout << "\t最大值：" << (numeric_limits<int>::max)();
        cout << "\t最小值：" << (numeric_limits<int>::min)() << endl;
        cout << "unsigned: \t" << "所占字节数：" << sizeof(unsigned);
        cout << "\t最大值：" << (numeric_limits<unsigned>::max)();
        cout << "\t最小值：" << (numeric_limits<unsigned>::min)() << endl;
        cout << "long: \t\t" << "所占字节数：" << sizeof(long);
        cout << "\t最大值：" << (numeric_limits<long>::max)();
        cout << "\t最小值：" << (numeric_limits<long>::min)() << endl;
        cout << "unsigned long: \t" << "所占字节数：" << sizeof(unsigned long);
        cout << "\t最大值：" << (numeric_limits<unsigned long>::max)();
        cout << "\t最小值：" << (numeric_limits<unsigned long>::min)() << endl;
        cout << "double: \t" << "所占字节数：" << sizeof(double);
        cout << "\t最大值：" << (numeric_limits<double>::max)();
        cout << "\t最小值：" << (numeric_limits<double>::min)() << endl;
        cout << "long double: \t" << "所占字节数：" << sizeof(long double);
        cout << "\t最大值：" << (numeric_limits<long double>::max)();
        cout << "\t最小值：" << (numeric_limits<long double>::min)() << endl;
        cout << "float: \t\t" << "所占字节数：" << sizeof(float);
        cout << "\t最大值：" << (numeric_limits<float>::max)();
        cout << "\t最小值：" << (numeric_limits<float>::min)() << endl;
        cout << "size_t: \t" << "所占字节数：" << sizeof(size_t);
        cout << "\t最大值：" << (numeric_limits<size_t>::max)();
        cout << "\t最小值：" << (numeric_limits<size_t>::min)() << endl;
        cout << "string: \t" << "所占字节数：" << sizeof(string) << endl;
        // << "\t最大值：" << (numeric_limits<string>::max)() << "\t最小值：" << (numeric_limits<string>::min)() << endl;
        cout << "type: \t\t" << "************size**************"<< endl;
    
    
}
//下一行 using namespace std; 告诉编译器使用 std 命名空间。命名空间是 C++ 中一个相对新的概念。
//下一行 // main() 是程序开始执行的地方 是一个单行注释。单行注释以 // 开头，在行末结束。
//下一行 int main() 是主函数，程序从这里开始执行。
//下一行 cout << "Hello World"; 会在屏幕上显示消息 "Hello World"。
//下一行 return 0; 终止 main( )函数，并向调用进程返回值 0。
