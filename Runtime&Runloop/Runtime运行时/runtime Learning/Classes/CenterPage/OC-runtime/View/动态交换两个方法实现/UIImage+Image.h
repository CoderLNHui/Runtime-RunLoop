/*
 * File:  UIImage+Image.h
 *
 * Public、简书 - 不知名开发者 / https://github.com/CoderLN
 * 该模块将系统化学习，后续「替换、补充文章内容 或 新增文章」
 *
 *【Runtime 交换方法实现 -> imageNamed => ln_imageNamed】
 */

#import <UIKit/UIKit.h>

@interface UIImage (Image)

+ (UIImage *)ln_imageNamed:(NSString *)name;
@end
