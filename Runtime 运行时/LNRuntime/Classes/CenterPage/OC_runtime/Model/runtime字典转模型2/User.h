/*
 * User.h
 * 简/众_不知名开发者 | https://github.com/CoderLN
 * 
 * runtime 字典转模型；modelWithDict:
 */

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, assign) BOOL vip;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger mbrank;

@end
