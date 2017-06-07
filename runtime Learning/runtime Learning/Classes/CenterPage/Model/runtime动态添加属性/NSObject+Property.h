//
//  NSObject+Property.h
// 【runtime】（https://github.com/CustomPBWaters）
//
//  Created by 简书:白开水ln on 16/-/-.
//  Copyright (c) 2016年（https://custompbwaters.github.io）All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Property)

// @property分类:只会生成get,set方法声明,不会生成实现,也不会生成下划线成员属性
@property NSString *name;
@property NSString *height;
@end
