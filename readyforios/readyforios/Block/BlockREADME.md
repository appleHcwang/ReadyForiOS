#  <#Title#>
//https://juejin.cn/post/6844904040954871815
block本质上是一个OC对象，它内部也有isa指针，这个对象封装了函数调用地址以及函数调用环境(函数参数、返回值、捕获的外部变量等)。当我们定义一个block，在编译后它的底层存储结构是怎样的呢？

底层就是一个结构体

struct __main_block_impl_0 {
  struct __block_impl impl;
  struct __main_block_desc_0 * Desc;
}


strcut __block_impl {
  void *isa;
  int Flags;
  int Reserved;
  void *FuncPtr;
}
