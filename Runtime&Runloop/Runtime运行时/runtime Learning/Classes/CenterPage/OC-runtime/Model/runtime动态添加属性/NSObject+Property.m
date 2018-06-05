/*
 * File:  NSObject+Property.h
 * Author:  白开水ln（https://github.com/CustomPBWaters）
 *
 * About ME『Public：Codeidea / https://githubidea.github.io』.
 * Copyright © All members (Star|Fork) have the right to read and write『https://github.com/CoderLN/Runtime-RunLoop』.
 *
 * 🏃🏻‍♂️ ◕该模块将系统化学习，后续替换、补充文章内容 ~
 *
 *【Runtime 动态添加属性】
 */

#import "NSObject+Property.h"
#import <objc/message.h>

@implementation NSObject (Property)



- (NSString *)name
{
    return objc_getAssociatedObject(self, @"name");
}

- (NSString *)height {
    return objc_getAssociatedObject(self, @"height");
}





- (void)setName:(NSString *)name
{
    // objc_setAssociatedObject（将某个值跟某个对象关联起来，将某个值存储到某个对象中）
    // object:给哪个对象添加属性
    // key:属性名称
    // value:属性值
    // policy:保存策略
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    NSLog(@"name---->%p",name);
}

- (void)setHeight:(NSString *)height {
    objc_setAssociatedObject(self, @"height", height, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    NSLog(@"height---->%p",height);
}


@end
