/*
 * NSObject+Property.h
 * 不知名开发者 https://dwz.cn/rC1LGk2f | https://github.com/CoderLN/Runtime-RunLoop
 * 
 * runtime 作用：动态添加属性
 */

#import <Foundation/Foundation.h>

@interface NSObject (Property)

// @property分类:只会生成get,set方法声明,不会生成实现,也不会生成下划线成员属性
@property NSString *name;
@property NSString *height;

@end





/**
 1、runtime 作用：动态添加属性
    场景：给系统的类添加属性的时候，可以使用runtime动态添加属性
    原理：动态添加属性，本质就是将某个属性与类对象产生关联，并不是直接把这个属性的内存空间添加到类存空间。
         实现setter方法，将某个属性跟对象用参数key关联起来 objc_setAssociatedObject
         实现getter方法，将对象中存储的参数key对应属性取出来 objc_getAssociatedObject
    需求：给系统 NSObject 类动态添加属性name字符串 (runtime一般都是针对系统的类)
    实现：给系统 NSObject 添加一个分类，我们知道在分类中是不能够添加属性的，虽然我们用了`@property`，只是生成`set`和`get`方法的声明并没有实现，也没有生成下划线成员变量。但是可以使用runtime动态添加属性，自己实现set/get方法，将属性跟对象用参数key关联起来。
    示例：UITextField设置占位文字颜色placeholderColor
 
 # 设置属性与对象关联
     objc_setAssociatedObject(<#id  _Nonnull object#>：给哪个对象添加属性, <#const void * _Nonnull key#>：属性名称, <#id  _Nullable value#>：属性值, <#objc_AssociationPolicy policy#>：保存策略)
     objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
 
 
 # category中可以添加属性吗？为什么？如果能，怎么实现？
     分类原本是不可以添加属性。
     可以使用@property NSString *name;只是生成set和get方法的声明并没有实现，也没有生成下划线成员变量。
     但是可以使用runtime动态添加属性，自己实现set/get方法，将属性跟对象用参数key关联起来。
 */
