/*
 * File:  NSObject+Mod.m
 *
 * Public - CoderLN / https://githubidea.github.io / https://github.com/CoderLN
 * 🏃🏻‍♂️ ◕该模块将系统化学习，后续替换、补充文章内容 ~
 *
 *【Runtime 字典转模型】
 */

#import "NSObject+Mod.h"
#import <objc/message.h>
@implementation NSObject (Mod)


// 思路：利用runtime 遍历模型中所有属性，根据模型中属性,去字典中取出对应的value给模型属性赋值
+ (instancetype)modelWithDict2:(NSDictionary *)dict
{
    // 1.创建对应的对象
    id objc = [[self alloc] init];
    
    // 2.利用runtime给对象中的属性赋值
    /**
     获取类中的所有成员变量
         class_copyIvarList(Class _Nullable cls：表示获取哪个类中的成员变量, unsigned int * _Nullable outCount：表示这个类有多少成员变量，传入一个Int变量地址，会自动给这个变量赋值)
     返回值Ivar * =
         指的是一个ivar数组，会把所有成员属性放在一个数组中，通过返回的数组就能全部获取到
     */
    // 成员变量个数
    unsigned int count = 0;
    // 获取类中的所有成员变量
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    // 遍历所有成员变量
    for (int i = 0; i < count; i++) {
        // 根据角标，从数组取出对应的成员变量（Ivar：成员变量,以下划线开头）
        Ivar ivar = ivarList[i];
        
        // 获取成员变量名字
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        // 获取成员变量类型
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        
        // 替换: @\"User\" -> User
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
        
        // 处理成员变量名->字典中的key(去掉 _ ,从第一个角标开始截取)
        NSString *key = [ivarName substringFromIndex:1];
        
        // 根据成员属性名去字典中查找对应的value
        id value = dict[key];
        
        // 二级转换：如果字典中还有字典，也需要把对应的字典转换成模型
        // 判断下value是否是字典,并且是自定义对象才需要转换
        if ([value isKindOfClass:[NSDictionary class]] && ![ivarType hasPrefix:@"NS"]) {
            
            // 字典转换成模型 userDict => User模型, 转换成哪个模型
            // 根据字符串类名生成类对象
            Class modelClass = NSClassFromString(ivarType);
            
            if (modelClass) { // 有对应的模型才需要转
                // 把字典转模型
                value = [modelClass modelWithDict2:value];
            }
        }
        
        // 给模型中属性赋值
        if (value) {
            [objc setValue:value forKey:key];
        }
    }
    return objc;
}


@end
