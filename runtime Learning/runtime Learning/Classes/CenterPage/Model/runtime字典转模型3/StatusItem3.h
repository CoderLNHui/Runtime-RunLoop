//
//  StatusItem3.h
//  🔍白开水ln（https://github.com/CustomPBWaters）
//
//  Created by 【🔍Plain Boiled Water ln】 on Elegant programming16.
//  Copyright © Unauthorized shall（https://custompbwaters.github.io）not be reproduced reprinted.
//
//  @PBWLN_LICENSE_HEADER_END@
//

#import <Foundation/Foundation.h>
#import "NSObject+Item.h"

@interface StatusItem3 : NSObject <ModelDelegate>

/**
 runtime 字典转模型-->
 数组中装着模型「模型的属性是一个数组，数组中是字典模型对象」，这种情况处理如下：
 */

@property (nonatomic, assign) NSInteger attitudes_count;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *text;

@property (nonatomic, assign) NSInteger age;

// 属性是一个数组(数组名也要和字典中的一致), （再定义数组模型时好像要以Array才行）
@property (nonatomic, strong) NSArray *pic_urls;

@end
