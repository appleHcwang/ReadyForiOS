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


4. 类(class) 和 结构体(struct) 有什么区别?
在 Swift 中,class 是引用类型(指针类型), struct 是值类型


5.var 和 let的使用

var声明的是变量，可以修改值(调用对象的set方法)，举例说明
let声明的是常量，不可以修改值(不可调用对象的set方法)，举例说明
 var varA = 42
 varA = 43
 print(varA)//输出43 
 
let varC = 36
 //varC = 46 报错，因为let申明的就是常量，不能修改值
 print(varC)
 

6. ?的使用，如果对象没有赋值，默认为nil，举例说明  ??就是如果对象为nil，则使用后面的值代替，但是原变量不修改

var myString:String
print(myString)  //报错，因为myString没有赋值
 
var myString:String?
print(myString)  //输出：nil
 
var myString:String? = "myString"
 print(myString)  //输出：myString
 
var myString:String?
var myString1 = myString ?? "BBBB";
print("myString1:\(myString1)    myString: \(myString)") // 输出：myString1:BBBB    myString: nil
7.！的使用，如果对象没有赋值，直接使用，会报错，可以使用！

var myString:String!
print(myString) //输出：nil
 
var myString:String!
myString = "myString"
print(myString) //输出：myString



8 .？和！的区别，你会发现！和？在没有赋值的情况下打印出来的值都是nil，
如果使用？声明的变量不赋值，直接调用对象的方法不执行，
而使用！声明的变量不赋值，直接调用对象的方法运行会报错
var btn1: UIButton!
btn1.frame = CGRect.init(x: 10, y: 10, width: 10, height: 120);//报错
var btn1: UIButton?
btn1?.frame = CGRect.init(x: 10, y: 10, width: 10, height: 120);//没有报错，这里不执行  btn1?这个问号必须加上，不然编译之前就报错了 
问号？
a.声明时添加？，告诉编译器这个是Optional的，如果声明时没有手动初始化，就自动初始化为nil
b.在对变量值操作前添加？，判断如果变量时nil，则不响应后面的方法。

叹号！
a.声明时添加！，告诉编译器这个是Optional的，并且之后对该变量操作的时候，都隐式的在操作前添加！
b.在对变量操作前添加！，表示默认为非nil，直接解包进行处理

9.set和get的重写

swift和OC很大的一个不同，就是swift并不能和OC一样，直接重写setter和getter，但swift提供了属性监视和计算属性

先说计算属性，swift无法重写getter和setter方法，只能去利用计算属性去操作其他的属性。

结论就是：

willSet是值将要改变时触发，存在一个newValue的变量。didSet是值已经改变触发，存在一个oldValue的变量。

willSet、didSet 和 get、set这两套方法只能二选一，全部实现会报错。所以当想要在get方法里要干事时，就只能用get set方法。而且set方法和willset好像是一样的，都有newValue变量。

所以如果你想在set和get里做一些操作，在swift中，得额外声明一个计算属性，重写它的set和get方法， 然后通过调用计算属性，来达到操作原属性的目的，但直接重写原属性的willSet，看起来更方便



