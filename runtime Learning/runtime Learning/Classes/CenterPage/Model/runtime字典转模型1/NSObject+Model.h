//
//  NSObject+Model.h
//  runtime Learning
//
//  Created by LN on 17/2/18.
//  Copyright © 2017年 Learning point. All rights reserved.
//
//  Runtime:根据模型中属性,去字典中取出对应的value给模型属性赋值

#import <Foundation/Foundation.h>

@interface NSObject (Model)
// 字典转模型
+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
