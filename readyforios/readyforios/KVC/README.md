#  <#Title#>

1、找set<key>、_set<Key>的方法，如果有，调用找到的方法 并结束。
2、如果没找到，就去找accessInstanceVariablesDirectly这个方法，如果这个方法返回YES，就可以进行下一步，如果返回NO，就抛出异常（步骤4）。
3、在2满足的情况下 ,按照这个顺序_<key>，_is<Key>，<key>，is<Key>找成员变量，并将value赋值给这个成员变量。
4、如果上面的步骤都失败了，调用setValue:forUndefinedKey:抛出异常。


相关api
/默认返回YES，表示如果没有找到Set<Key>方法的话，会按照_key，_iskey，key，iskey的顺序搜索成员，设置成NO就不这样搜索
+ (BOOL)accessInstanceVariablesDirectly;

//KVC提供属性值正确性验证的API，它可以用来检查set的值是否正确、为不正确的值做一个替换值或者拒绝设置新值并返回错误原因。
- (BOOL)validateValue:(inout id __nullable * __nonnull)ioValue forKey:(NSString *)inKey error:(out NSError **)outError;

//这是集合操作的API，里面还有一系列这样的API，如果属性是一个NSMutableArray，那么可以用这个方法来返回。
- (NSMutableArray *)mutableArrayValueForKey:(NSString *)key;

//如果Key不存在，且KVC无法搜索到任何和Key有关的字段或者属性，则会调用这个方法，默认是抛出异常。
- (nullable id)valueForUndefinedKey:(NSString *)key;

//和上一个方法一样，但这个方法是设值。
- (void)setValue:(nullable id)value forUndefinedKey:(NSString *)key;

//如果你在SetValue方法时面给Value传nil，则会调用这个方法
- (void)setNilValueForKey:(NSString *)key;

//输入一组key,返回该组key对应的Value，再转成字典返回，用于将Model转到字典。
- (NSDictionary<NSString *, id> *)dictionaryWithValuesForKeys:(NSArray<NSString *> *)keys;


KVC取值原理分析
我们从官方文档中可以得知，当我们通过setValue:forKey:来设置值的时候，步骤如下
步骤一：首先找这三种setter:方法，分别是：set<Key>->_set<Key>->setIs<Key>，其中<Key>是成员变量的名字，且首字母大写，比如本文中的name，顺序就是setName->_setName->setIsName。当找到这三种setter中任意一个时，则进行赋值，如果没有找到则进入步骤二.
步骤二：判断+ (BOOL)accessInstanceVariablesDirectly函数是否返回YES，如果返回YES，则按照 _key->_iskey->key->iskey的顺序搜索成员，找到任意一个则进行赋值，否则进入步骤三；如果返回NO，则直接进入步骤三。
步骤三：如果setter方法 或者 实例变量都没有找到，系统会执行该对象的setValue：forUndefinedKey:函数，默认抛出异常，所以我们使用KVC进行解析模型数据时，要实现setValue：forUndefinedKey:函数，否则会崩溃。
设值总结


KVC取值原理分析
当我们调用valueForKey：时，内部操作流程如下：
步骤一：调用getter方法，调用顺序是：get<Key> -> <key> -> is<Key> -> _<key>，以name为例，getName -> name -> isName -> _name,如果找到，则直接返回对应的值（可能是对象），如果找不到则进入步骤二
步骤二：判断+ (BOOL)accessInstanceVariablesDirectly函数是否返回YES，如果为YES，则访问成员变量，顺序为：_<key>->_is<Key>-><key>-> is<Key>，以name为例则是_name->_isName->name-> isName，找到则返回对应的值（可能是对象），找不到则进入步骤三；如果返回的是NO，则截止进入步骤三。
步骤三：均找不到，则调用valueForUndefinedKey：抛出异常。
取值总结：
 
