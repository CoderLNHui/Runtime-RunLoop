/*
 * File:  LNExchangeMethodViewController.m
 *
 * About ME『Public：Codeidea / https://githubidea.github.io』.
 * Copyright © All members (Star|Fork) have the right to read and write『https://github.com/CoderLN/Runtime-RunLoop』.
 *
 * 🏃🏻‍♂️ ◕该模块将系统化学习，后续替换、补充文章内容 ~
 *
 *【Runtime 交换方法】
 */

#import "LNExchangeMethodViewController.h"
#import "UIImage+Image.h"


@interface LNExchangeMethodViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation LNExchangeMethodViewController

- (NSString *)controllerTitle {
    return @"runtime动态交换两个方法";
}


- (IBAction)addFunctionality:(id)sender
{
    [self interactionMethods];
}

//--------------------------- Runtime(交换方法) ------------------------------//
//
/**
 方案一：先搞个分类，定义一个能加载图片并且能打印的方法+ (instancetype)imageWithName:(NSString *)name;
 方案二：交换 imageNamed 和 ln_imageNamed 的实现，就能调用 imageNamed，间接调用 ln_imageNamed 的实现。
 */
- (void)interactionMethods{
    
    // imageNamed => ln_imageNamed 交换这两个方法实现
    self.imageView.image = [UIImage imageNamed:@"PBwaterln1"];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
