/*
 * UIImage+Image.m
 * Public|JShu_不知名开发者 https://github.com/CoderLN
 */

#import "UIImage+Image.h"
#import <objc/message.h>

@implementation UIImage (Image)

/**
 看清楚下面是不会有死循环的
    调用 imageNamed => ln_imageNamed
    调用 ln_imageNamed => imageNamed
 */
// 加载图片 且 带判断是否加载成功
+ (UIImage *)ln_imageNamed:(NSString *)name
{
    UIImage *image = [UIImage ln_imageNamed:name];
    if (image) {
        NSLog(@"runtime交互方法 -> 图片加载成功");
    } else {
        NSLog(@"runtime交互方法 -> 图片加载失败");
    }
    return image;
}

/**
 注解：
    不能在分类中重写系统方法imageNamed，因为会把系统的功能给覆盖掉，而且分类中不能调用super
    所以第二步，我们要 自己实现一个带有扩展功能的方法.
 + (UIImage *)imageNamed:(NSString *)name
 {
 
 }
 */


/**
 作用：把类加载进内存的时候调用,只会调用一次
 调用：方法应先交换，再去调用
 */
+ (void)load
{
    // 1.获取 imageNamed方法地址
    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    // 2.获取 ln_imageNamed方法地址
    Method ln_imageNamedMethod = class_getClassMethod(self, @selector(ln_imageNamed:));
    
    // 3.交换方法地址，相当于交换实现方式;「method_exchangeImplementations 交换两个方法的实现」
    method_exchangeImplementations(imageNamedMethod, ln_imageNamedMethod);
}
 
@end
