/*
 * NSObject+Model.m
 *「Public_不知名开发者 | https://github.com/CoderLN | https://www.jianshu.com/u/fd745d76c816」
 *
 * 各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」.
 *
 */

#import "NSObject+Model.h"
#import <objc/message.h>

@implementation NSObject (Model)

// 思路:利用runtime 遍历模型中所有属性,根据模型中属性去字典中取出对应的value给模型属性赋值
+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    // 1.创建对应的对象
    id objc = [[self alloc] init];
    
    // 2.利用runtime给对象中的属性赋值
    // 成员变量个数
    unsigned int count = 0;
    // 获取类中的所有成员变量
    Ivar *ivarList = class_copyIvarList(self, &count);

    // 遍历所有成员变量
    for (int i = 0; i < count; i++) {
        // 根据角标,从数组取出对应的成员变量（Ivar:成员变量,以下划线开头）
        Ivar ivar = ivarList[i];
        
        // 获取成员变量名字
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        // 处理成员变量名,字典中的key(去掉 _ ,从第一个角标开始截取)
        NSString *key = [ivarName substringFromIndex:1];
        
        // 根据成员属性名去字典中查找对应的value
        id value = dict[key];
        
        //【如果模型属性数量大于字典键值对数理,模型属性会被赋值为nil
        // 而报错 (could not set nil as the value for the key age.)
        if (value) {
            // 给模型中属性赋值
            [objc setValue:value forKey:key];
        }
    }
   
    return objc;
}


//----------------------- <#<--- 不知名开发者 --->#> ------------------------//
//
/**
 注解:
 //获取类里面所有方法
 class_copyMethodList(__unsafe_unretained Class cls, unsigned int *outCount)// 本质:创建谁的对象
 
 //获取类里面所有属性
 class_copyPropertyList(__unsafe_unretained Class cls, unsigned int *outCount)
 
 //获取类中的所有成员变量
 class_copyIvarList(Class _Nullable cls:表示获取哪个类中的成员变量, unsigned int * _Nullable outCount:表示这个类有多少成员变量,传入一个Int变量地址,会自动给这个变量赋值)
 返回值Ivar * = 指的是一个ivar数组,会把所有成员属性放在一个数组中,通过返回的数组就能全部获取到
 */
@end
