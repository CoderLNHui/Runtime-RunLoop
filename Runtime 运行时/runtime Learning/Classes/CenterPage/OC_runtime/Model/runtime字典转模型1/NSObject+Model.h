/*
 * NSObject+Model.h
 *「Public_不知名开发者 | https://github.com/CoderLN | https://www.jianshu.com/u/fd745d76c816」
 *
 * 各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」.
 *
 * Runtime 字典转模型；modelWithDict:
 */

#import <Foundation/Foundation.h>

@interface NSObject (Model)
// 字典转模型
+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end


// NOTE：抽取注解
/**
 获取类里面所有方法
 class_copyMethodList(__unsafe_unretained Class cls, unsigned int *outCount)// 本质:创建谁的对象
 
 获取类里面所有属性
 class_copyPropertyList(__unsafe_unretained Class cls, unsigned int *outCount)
 
 获取类中的所有成员变量
     class_copyIvarList(Class _Nullable cls：表示获取哪个类中的成员变量, unsigned int * _Nullable outCount：表示这个类有多少成员变量，传入一个Int变量地址，会自动给这个变量赋值)
     返回值Ivar * = 指的是一个ivar数组，会把所有成员属性放在一个数组中，通过返回的数组就能全部获取到
 */

