//
//  NSObject+Model.h
// 【runtime】（https://github.com/CustomPBWaters）
//
//  Created by 简书:白开水ln on 15/-/-.
//  Copyright © 2015年（https://custompbwaters.github.io）All rights reserved.
//
//  Runtime:根据模型中属性,去字典中取出对应的value给模型属性赋值

#import <Foundation/Foundation.h>

@interface NSObject (Model)
// 字典转模型
+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
