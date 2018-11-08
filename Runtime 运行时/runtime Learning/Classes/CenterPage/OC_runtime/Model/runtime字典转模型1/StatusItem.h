/*
 * StatusItem.h
 *「Public_不知名开发者 | https://github.com/CoderLN | https://www.jianshu.com/u/fd745d76c816」
 *
 * 各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」.
 *
 * Runtime 字典转模型；modelWithDict:
 */

/**
 runtime 字典转模型
     场景一：字典的 key 和模型的属性不匹配「模型属性数量 大于 字典键值对数」，这种情况处理如下：
 */


#import <Foundation/Foundation.h>
#import "NSObject+Model.h"

@interface StatusItem : NSObject

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
