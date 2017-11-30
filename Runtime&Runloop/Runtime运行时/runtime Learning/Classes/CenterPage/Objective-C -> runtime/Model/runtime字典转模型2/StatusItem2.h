/*
 * File:  StatusItem2.h
 * Author:  白开水ln（https://github.com/CustomPBWaters）
 *
 * Created by 【WechatPublic-Codeidea】 on Elegant programming16.
 * Copyright © Reprinted（https://githubidea.github.io）Please indicate the source.Mustbe.
 *
 * JaneBook:  http://www.jianshu.com/u/fd745d76c816
 *
 * @HEADER_WELCOME YOU TO JOIN_GitHub & Codeidea_END@
 *
 *【Runtime 字典转模型】
 */

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
