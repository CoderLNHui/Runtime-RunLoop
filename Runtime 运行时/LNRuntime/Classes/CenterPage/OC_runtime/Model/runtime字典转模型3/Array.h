/*
 * Array.h
 * 不知名开发者 https://dwz.cn/rC1LGk2f | https://github.com/CoderLN/Runtime-RunLoop
 * 
 * runtime 字典转模型；modelWithDict:
 */

#import <Foundation/Foundation.h>

@interface Array : NSObject

// 属性是一个数组(数组名也要和字典中的一致), （再定义数组模型时好像要以Array才行）
@property (nonatomic, strong) NSString *Janes;
@property (nonatomic, strong) NSString *book;

@end
