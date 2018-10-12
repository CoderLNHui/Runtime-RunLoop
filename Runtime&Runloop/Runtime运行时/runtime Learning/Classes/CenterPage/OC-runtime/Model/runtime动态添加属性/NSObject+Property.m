/*
 * File:  NSObject+Property.h
 * Author:  白开水ln（https://github.com/CustomPBWaters）
 *
 * Public、简书 - 不知名开发者 / https://github.com/CoderLN
 * 该模块将系统化学习，后续「替换、补充文章内容 或 新增文章」
 *
 *【Runtime 动态添加属性】
 */

#import "NSObject+Property.h"
#import <objc/message.h>
//#import <objc/runtime.h>

@implementation NSObject (Property)

- (NSString *)name
{
    // 利用参数key 将对象object中存储的对应值取出来
    return objc_getAssociatedObject(self, @"name");
}

- (void)setName:(NSString *)name
{
    /**
     objc_setAssociatedObject(<#id  _Nonnull object#>：给哪个对象添加属性, <#const void * _Nonnull key#>：属性名称, <#id  _Nullable value#>：属性值, <#objc_AssociationPolicy policy#>：保存策略)
     */
    // 将某个值跟某个对象关联起来，将某个值存储到某个对象中
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSLog(@"name---->%p",name);
}


- (NSString *)height {
    return objc_getAssociatedObject(self, @"height");
}

- (void)setHeight:(NSString *)height {
    objc_setAssociatedObject(self, @"height", height, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    NSLog(@"height---->%p",height);
}


@end
