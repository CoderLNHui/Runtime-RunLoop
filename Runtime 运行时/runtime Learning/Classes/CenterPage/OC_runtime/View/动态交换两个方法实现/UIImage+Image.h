/*
 * UIImage+Image.h
 *「Public_不知名开发者 | https://github.com/CoderLN | https://www.jianshu.com/u/fd745d76c816」
 *
 * 各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」.
 *
 * Runtime 交换方法实现；imageNamed => ln_imageNamed 交换这两个方法实现
 */

#import <UIKit/UIKit.h>

@interface UIImage (Image)

+ (UIImage *)ln_imageNamed:(NSString *)name;

@end
