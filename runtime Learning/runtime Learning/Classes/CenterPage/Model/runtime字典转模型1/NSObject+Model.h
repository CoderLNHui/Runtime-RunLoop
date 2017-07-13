//
//  NSObject+Model.h
//  🔍白开水ln（https://github.com/CustomPBWaters）
//
//  Created by 【🔍Plain Boiled Water ln】 on Elegant programming16.
//  Copyright © Unauthorized shall（https://custompbwaters.github.io）not be reproduced reprinted.
//
//  @PBWLN_LICENSE_HEADER_END@
//
//  Runtime:根据模型中属性,去字典中取出对应的value给模型属性赋值

#import <Foundation/Foundation.h>

@interface NSObject (Model)
// 字典转模型
+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
