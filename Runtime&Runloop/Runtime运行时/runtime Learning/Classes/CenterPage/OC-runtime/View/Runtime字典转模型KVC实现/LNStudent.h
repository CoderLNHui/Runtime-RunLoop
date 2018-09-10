/*
 * File:  LNStudent.h
 *
 * Public - CoderLN / https://githubidea.github.io / https://github.com/CoderLN
 * 🏃🏻‍♂️ ◕该模块将系统化学习，后续替换、补充文章内容 ~
 *
 *【KVC 字典转模型】
 */


#import <Foundation/Foundation.h>

@class LNDog;
@interface LNStudent : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger age;

@property (nonatomic, strong) LNDog * dog;


@end
