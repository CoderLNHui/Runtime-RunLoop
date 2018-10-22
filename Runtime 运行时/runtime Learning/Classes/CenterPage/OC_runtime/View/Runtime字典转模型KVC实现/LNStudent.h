/*
 * LNStudent.h
 * Public_不知名开发者 https://github.com/CoderLN，该模块将系统化学习，后续「坚持新增文章，替换、补充文章内容」
 * KVC 字典转模型；setValuesForKeysWithDictionary:
 */


#import <Foundation/Foundation.h>

@class LNDog;
@interface LNStudent : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger age;

@property (nonatomic, strong) LNDog * dog;


@end
