//
//  StatusItem2.h
// 【runtime】（https://github.com/CustomPBWaters）
//
//  Created by 简书:白开水ln on 16/-/-.
//  Copyright (c) 2016年（https://custompbwaters.github.io）All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Mod.h"

@class User;
@interface StatusItem2 : NSObject

/**
 runtime 字典转模型-->
 模型中嵌套模型「模型属性是另外一个模型对象」，这种情况处理如下：
 */

@property (nonatomic, assign) NSInteger attitudes_count;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *text;

@property (nonatomic, assign) NSInteger age;

// 模型中嵌套模型User
@property (nonatomic, strong) User *user;

@end
