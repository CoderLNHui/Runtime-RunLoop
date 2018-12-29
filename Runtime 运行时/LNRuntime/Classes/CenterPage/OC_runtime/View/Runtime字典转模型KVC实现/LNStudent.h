/*
 * LNStudent.h
 * Public|JShu_不知名开发者 https://github.com/CoderLN
 * KVC 字典转模型；setValuesForKeysWithDictionary:
 */


#import <Foundation/Foundation.h>

@class LNDog;
@interface LNStudent : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger age;

@property (nonatomic, strong) LNDog * dog;


@end
