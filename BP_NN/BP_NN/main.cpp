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
void arrayy();
void pointZhiZhen();
void yinYong();

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
//    countt = 5;
//    write_extern();
    
    
    pointZhiZhen();
    yinYong();
//    arrayy();
//    jubuQuanJu();
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
 数组
 */
void arrayy(){
//    在 C++ 中要声明一个数组，需要指定元素的类型和元素的数量，如下所示：
    int n[10];
    for (int i = 0; i < 10; i++) {
        n[i] = i + 100;
    }
    double balance[5] = {1000.0, 2.0, 3.4, 7.0, 50.0};
    
}


/**
 *指针
 *
 */
//什么是指针？
//指针是一个变量，其值为另一个变量的地址，即，内存位置的直接地址。就像其他变量或常量一样，您必须在使用指针存储其他变量地址之前，对其进行声明。指针变量声明的一般形式为：
void pointZhiZhen(){
    int  var = 20;   // 实际变量的声明
    int  *ip;        // 指针变量的声明
    ip = &var;       // 在指针变量中存储 var 的地址
    cout << "Value of var variable: ";
    cout << var << endl;
    
    // 输出在指针变量中存储的地址
    cout << "Address stored in ip variable: ";
    cout << ip << endl;
    
    // 访问指针中地址的值
    cout << "Value of *ip variable: ";
    cout << *ip << endl;
}

/**
 * 引用
 */
//引用变量是一个别名, 也就是说, 它是某个已存在变量的另一个名字. 一旦把引用初始化为某个变量, 就可以使用该引用名称或变量名称来指向变量
//C++ 引用 vs 指针
//引用很容易与指针混淆，它们之间有三个主要的不同：
//
//不存在空引用。引用必须连接到一块合法的内存。
//一旦引用被初始化为一个对象，就不能被指向到另一个对象。指针可以在任何时候指向到另一个对象。
//引用必须在创建时被初始化。指针可以在任何时间被初始化
void yinYong() {
    int m = 55;
    int& r = m;
    int n = 111;
    r = n;
    
    cout << "ww" << r <<"\n" << m;
    cout << "-----" << &r << &n << &m;
    
   
    
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
