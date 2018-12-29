/*
 * Person.h
 * Public|JShu_不知名开发者 https://github.com/CoderLN
 * Runtime 动态添加方法；[person performSelector:@selector(run:) withObject:@10]
 */

#import <Foundation/Foundation.h>

@interface Person : NSObject

@end


// NOTE：抽取注解
/**
 动态添加方法
 class_addMethod(<#Class  _Nullable __unsafe_unretained cls#>：给哪个类添加方法, <#SEL  _Nonnull name#>：添加哪个方法，即添加方法的方法编号, <#IMP  _Nonnull imp#>：(IMP)myAddingFunction，IMP是一个函数指针，这里表示指定具体方法的实现myAddFunction, <#const char * _Nullable types#>：方法编码类型，(返回值+参数类型) v:void @:对象->self :表示SEL->_cmd；0代表没有参数)
 */
