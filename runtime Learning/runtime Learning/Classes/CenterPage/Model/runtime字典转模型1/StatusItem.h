//
//  StatusItem.h
//  runtime Learning
//
//  Created by LN on 17/2/18.
//  Copyright © 2017年 Learning point. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Model.h"

@interface StatusItem : NSObject

/**
 runtime 字典转模型-->
 字典的 key 和模型的属性不匹配「模型属性数量 大于 字典键值对数」，这种情况处理如下：
 */

@property (nonatomic, assign) NSInteger attitudes_count;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *text;

// 多余的模型属性，键值和模型属性不匹配
@property (nonatomic, assign) NSInteger age;

@end
