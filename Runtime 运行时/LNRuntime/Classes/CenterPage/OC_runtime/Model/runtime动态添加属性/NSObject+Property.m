/*
 * NSObject+Property.h
 * 不知名开发者 https://dwz.cn/rC1LGk2f | https://github.com/CoderLN/Runtime-RunLoop
 * 
 */

#import "NSObject+Property.h"
#import <objc/message.h>
//#import <objc/runtime.h>

@implementation NSObject (Property)

- (NSString *)name
{
    // 将对象中存储的参数key对应属性取出来
    return objc_getAssociatedObject(self, @"name");
}

- (void)setName:(NSString *)name
{
    // 将某个属性跟对象用参数key关联起来 
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


@end
