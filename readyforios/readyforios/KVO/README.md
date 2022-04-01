#  <#Title#>

KVO简述
定义：KVO的全称 Key-Value Observing，俗称“键值监听”，可以用于监听某个对象属性值的改变。

带着问题探索
1.iOS用什么方式实现对一个对象的KVO？（KVO的本质是什么？）
答，当一个对象使用了KVO监听，iOS系统会修改这个对象的isa指针， 改为指向一个全新的通过Runtime动态创建的子类，子类拥有自己的set方法实现， set方法实现内部会按顺序调用willChangeValueForKey方法、原来的setter方法实现、 didChangeValueForKey方法，而didChangeValueForKey方法内部 又会调用监听器的observeValueForKeyPath:ofObject:change:context:监听方法。

 
2.如何手动触发KVO
答， 被监听的属性的值被修改时，就会自动触发KVO。
如果想要手动触发KVO，则需要我们自己重写+(BOOL)automaticallyNotifiesObserversForKey:(NSString *)key来禁用自动监听，然后再调用willChangeValueForKey和
didChangeValueForKey方法即可在不改变属性值的情况下手动触发KVO
，并且这两个方法缺一不可。

简书 : https://www.jianshu.com/p/7092e66ea8a3
