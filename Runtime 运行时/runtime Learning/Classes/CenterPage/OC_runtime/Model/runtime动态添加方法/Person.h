/*
 * Person.h
 *「Public_不知名开发者 | https://github.com/CoderLN | https://www.jianshu.com/u/fd745d76c816」
 *
 * 各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」.
 *
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
