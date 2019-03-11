/*
 * User.h
 * 不知名开发者 https://dwz.cn/rC1LGk2f | https://github.com/CoderLN/Runtime-RunLoop
 * 
 * runtime 字典转模型；modelWithDict:
 */

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, assign) BOOL vip;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger mbrank;

@end
