/*
 * StatusItem1.h
 * 不知名开发者 https://dwz.cn/rC1LGk2f | https://github.com/CoderLN/Runtime-RunLoop
 * 
 * runtime 字典转模型；modelWithDict:
 */

/**
 runtime 字典转模型
 场景一：字典的 key 和模型的属性不匹配「模型属性数量 大于 字典键值对数」，这种情况处理如下：
 */


#import <Foundation/Foundation.h>
#import "NSObject+Model1.h"

@interface StatusItem1 : NSObject

//{
//    int _a; // 私有成员变量
//}

@property (nonatomic, assign) NSInteger attitudes_count; // 属性
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *text;

// 多余的模型属性，键值和模型属性不匹配
@property (nonatomic, assign) NSInteger age;

@end
