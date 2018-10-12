/*
 * File:  User.h
 *
 * Public、简书 - 不知名开发者 / https://github.com/CoderLN
 * 该模块将系统化学习，后续「替换、补充文章内容 或 新增文章」
 *
 *【Runtime 字典转模型】
 */

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, assign) BOOL vip;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, assign) NSInteger mbrank;

@end
