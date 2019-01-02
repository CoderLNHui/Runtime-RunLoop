/*
 * StatusItem3.h
 * Public|JShu_不知名开发者 https://github.com/CoderLN
 * runtime 字典转模型；modelWithDict:
 */

#import <Foundation/Foundation.h>
#import "NSObject+Model3.h"

@interface StatusItem3 : NSObject <ModelDelegate>

/**
 runtime 字典转模型-->
 场景三：数组中装着模型「模型的属性是一个数组，数组中是字典模型对象」，这种情况处理如下：
 */

@property (nonatomic, assign) NSInteger attitudes_count;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *text;

@property (nonatomic, assign) NSInteger age;

// 属性是一个数组(数组名也要和字典中的一致), （再定义数组模型时好像要以Array才行）
@property (nonatomic, strong) NSArray *pic_urls;

@end
