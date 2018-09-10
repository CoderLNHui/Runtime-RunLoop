/*
 * File:  NSObject+Property.h
 *
 * Public - CoderLN / https://githubidea.github.io / https://github.com/CoderLN
 * 🏃🏻‍♂️ ◕该模块将系统化学习，后续替换、补充文章内容 ~
 *
 *【Runtime 动态添加属性】
 */

#import <Foundation/Foundation.h>

@interface NSObject (Property)

// @property分类:只会生成get,set方法声明,不会生成实现,也不会生成下划线成员属性
@property NSString *name;
@property NSString *height;
@end



