#  <#Title#>

1. 为什么要设计metaclass小结
回到一开始那个问题，为什么要设计MetaClass，去掉把类方法放到类里面行不行？
我的理解是，可以，但不Smalltalk。这样的设计是C++那种自上而下的设计方式，类方法也是类的一种特征描述。而Smalltalk的精髓正在于消息传递，复用消息传递才是根本目的，而MetaClass只不过是因此需要的一个工具罢了

