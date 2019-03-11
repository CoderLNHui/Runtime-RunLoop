/*
 * LNStudent.h
 * 不知名开发者 https://dwz.cn/rC1LGk2f | https://github.com/CoderLN/Runtime-RunLoop
 * 
 * KVC 字典转模型；setValuesForKeysWithDictionary:
 */


#import <Foundation/Foundation.h>

@class LNDog;
@interface LNStudent : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger age;

@property (nonatomic, strong) LNDog * dog;


@end
