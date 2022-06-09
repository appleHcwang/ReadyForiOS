

#1 规则
内存管理
1.在iOS中，使用 “引用计数” 来管理OC对象的内存
新创建的OC对象，引用计数是1；
调用retain会让OC对象的引用计数+1，调用release会让OC对象的引用计数-1
当引用计数减为0，OC对象就会销毁，释放占用的内存空间
当调用 alloc、new、copy、mutableCopy 方法返回了一个对象,
，在不需要这个对象时，要调用release或者aoturelease释放

#2 引用计数怎么存储
- 可以直接存储在isa指针中
- 如果不够存储的话，会存储在SideTable结构体的refcnts散列表中

struct SideTable {
    spinlock_t stock;
    RefcountMap refcnts; // 存放着对象引用计数的散列表
    weak_table_t weak_table;
}

#3 ARC具体为引用计数做了哪些工作？
 - 编译阶段自动添加代码

   ARC是LLVM编译器和Runtime系统相互协作的一个结果
- 编译器帮我们实现内存管理相关的代码
- Runtime在程序运行过程中处理弱引用

#4 weak指针实现原理，SideTable的结构是什么样？
1、常用知识点：
- 所引用对象的计数器不会+1，并在引用对象被释放的时候自动被设置为nil
- 通常用于解决循环引用问题

2、weak指针实现原理
- Runtime维护了一个weak表，用于存储指向某个对象的所有weak指针。
- weak表其实就是一个哈希表，key：对象的内存地址；value：指向该对象的所有弱引用的指针
- 当对象销毁的时候，通过对象的地址值，取出对象的弱引用表，将表里面的弱引用清除

3、为什么弱引用不会导致循环引用？
- 没有增加引用计数   

4、SideTable的结构是什么样的?
 struct SideTable {
   // 保证原子操作的自旋锁
    spinlock_t slock;
    // 引用计数的 hash 表
    RefcountMap refcnts;
    // weak 引用全局 hash 表
    weak_table_t weak_table;
}

#5. 自动释放池相关


