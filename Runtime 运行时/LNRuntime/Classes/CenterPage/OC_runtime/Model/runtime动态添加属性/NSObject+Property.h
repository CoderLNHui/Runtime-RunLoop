/*
 * NSObject+Property.h
 * Public|JShu_不知名开发者 https://github.com/CoderLN
 * Runtime 动态添加属性；objc.name
 */

#import <Foundation/Foundation.h>

@interface NSObject (Property)

// @property分类:只会生成get,set方法声明,不会生成实现,也不会生成下划线成员属性
@property NSString *name;
@property NSString *height;

@end


// NOTE：抽取注解
/**
 objc_setAssociatedObject(<#id  _Nonnull object#>：给哪个对象添加属性, <#const void * _Nonnull key#>：属性名称, <#id  _Nullable value#>：属性值, <#objc_AssociationPolicy policy#>：保存策略)
 */

