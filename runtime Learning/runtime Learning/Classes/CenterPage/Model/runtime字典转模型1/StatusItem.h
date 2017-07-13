//
//  StatusItem.h
//  🔍白开水ln（https://github.com/CustomPBWaters）
//
//  Created by 【🔍Plain Boiled Water ln】 on Elegant programming16.
//  Copyright © Unauthorized shall（https://custompbwaters.github.io）not be reproduced reprinted.
//
//  @PBWLN_LICENSE_HEADER_END@
//

#import <Foundation/Foundation.h>
#import "NSObject+Model.h"

@interface StatusItem : NSObject

/**
 runtime 字典转模型-->
 字典的 key 和模型的属性不匹配「模型属性数量 大于 字典键值对数」，这种情况处理如下：
 */
//{
//    int _a; // 成员变量
//}
@property (nonatomic, assign) NSInteger attitudes_count; // 属性
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *text;

// 多余的模型属性，键值和模型属性不匹配
@property (nonatomic, assign) NSInteger age;

@end
