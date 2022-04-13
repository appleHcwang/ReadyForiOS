#  <#Title#>


1、Swift、OC 如何相互调用? Swift-->OC 、OC -->Swift? 我开发一个Swift的SDK,(API都是Swift的), 内部需要调用到 OC 的库, 要怎么做？
  1.2创建桥接文件
    在Swift工程内想要调用OC是相对比较容易的，只需在桥接文件中导入想要调用的OC类即可。 当在Swift工程中创建完成OC类的时候，系统会提示我们是否创建桥接文件，这个时候一定要选择创建，否者我们自己创建需要设置路径。
  1.3   
     注意：被oc调用的swift类需要继承自NSObject, 比方说如果继承自NSProxy将消息转发到真正的target的代理类，就不能被oc调用,
     原因：在oc中的类是依赖runtime机制的，而runtime机制需要isa指针，只有继承NSObject才能获得isa指针
     xcode默认生成了用于OC调用swift的头文件Test(项目名)-Swift.h，在oc类中#import引用即可

2、dynamic 在swift与OC中的作用


3.解析OC与Swift混编时获取swift类名的坑
如果swift类继承自NSObject的类及其子类，返回的类名：项目工程名.声明的名称
如果swift类未继承NSObject，返回的是类名是：声明的名称
OC类不管在swift还是OC环境中，返回的类名始终是：声明的名称
