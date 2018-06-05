/*
 * File:  NSObject+Item.h
 *
 * About ME『Public：Codeidea / https://githubidea.github.io』.
 * Copyright © All members (Star|Fork) have the right to read and write『https://github.com/CoderLN/Runtime-RunLoop』.
 *
 * 🏃🏻‍♂️ ◕该模块将系统化学习，后续替换、补充文章内容 ~
 *
 *【Runtime 字典转模型】
 */

#import <Foundation/Foundation.h>

@protocol ModelDelegate <NSObject>

@optional
//【提供一个协议，只要遵守这个协议的类，都能把数组中的字典转模型】
//【用在三级数组转换】
+ (NSDictionary *)arrayContainModelClass;

@end
@interface NSObject (Item)

// 字典转模型
+ (instancetype)modelWithDict3:(NSDictionary *)dict;
@end
