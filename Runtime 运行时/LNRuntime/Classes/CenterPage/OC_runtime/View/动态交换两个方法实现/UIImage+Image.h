/*
 * UIImage+Image.h
 * Public|JShu_不知名开发者 https://github.com/CoderLN
 * Runtime 交换方法实现；imageNamed => ln_imageNamed 交换这两个方法实现
 */

#import <UIKit/UIKit.h>

@interface UIImage (Image)

+ (UIImage *)ln_imageNamed:(NSString *)name;


/**
 注解：
 //获取某个类的方法地址
 class_getClassMethod(Class  _Nullable __unsafe_unretained cls：获取哪个类方法, SEL  _Nonnull name：哪个方法)
 //交换方法实现
 method_exchangeImplementations
 */

@end
