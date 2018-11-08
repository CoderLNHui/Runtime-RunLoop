/*
 * User.h
 *「Public_不知名开发者 | https://github.com/CoderLN | https://www.jianshu.com/u/fd745d76c816」
 *
 * 各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」.
 *
 * Runtime 字典转模型；modelWithDict:
 */

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, assign) BOOL vip;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger mbrank;

@end
