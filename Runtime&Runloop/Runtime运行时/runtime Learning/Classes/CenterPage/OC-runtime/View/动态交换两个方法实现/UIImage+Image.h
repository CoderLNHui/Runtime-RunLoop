/*
 * File:  UIImage+Image.h
 *
 * Public - CoderLN / https://githubidea.github.io / https://github.com/CoderLN
 * 🏃🏻‍♂️ ◕该模块将系统化学习，后续替换、补充文章内容 ~
 *
 *【Runtime 交换方法实现 -> imageNamed => ln_imageNamed】
 */

#import <UIKit/UIKit.h>

@interface UIImage (Image)

+ (UIImage *)ln_imageNamed:(NSString *)name;
@end
