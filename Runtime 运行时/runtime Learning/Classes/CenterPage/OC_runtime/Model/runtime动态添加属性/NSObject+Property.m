/*
 * NSObject+Property.h
 *「Public_不知名开发者 | https://github.com/CoderLN | https://www.jianshu.com/u/fd745d76c816」
 *
 * 各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」.
 *
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
    // 将某个值跟某个对象关联起来,将某个值存储到某个对象中
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSLog(@"name---->%p",name);
}


- (NSString *)height
{
    return objc_getAssociatedObject(self, @"height");
}

- (void)setHeight:(NSString *)height
{
    objc_setAssociatedObject(self, @"height", height, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    NSLog(@"height---->%p",height);
}

//----------------------- <#<--- 不知名开发者 --->#> ------------------------//
//
/**
 注解:
 将某个值跟某个对象关联起来
 objc_setAssociatedObject(<#id  _Nonnull object#>:给哪个对象添加属性, <#const void * _Nonnull key#>:属性名称, <#id  _Nullable value#>:属性值, <#objc_AssociationPolicy policy#>:保存策略)
 */

@end
