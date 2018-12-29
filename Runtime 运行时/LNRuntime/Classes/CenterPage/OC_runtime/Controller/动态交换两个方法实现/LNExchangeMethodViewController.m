/*
 * LNExchangeMethodViewController.m
 * Public|JShu_不知名开发者 https://github.com/CoderLN
 */

#import "LNExchangeMethodViewController.h"
#import "UIImage+Image.h"


@interface LNExchangeMethodViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation LNExchangeMethodViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
- (void)interactionMethods
{
    // imageNamed => ln_imageNamed 交换这两个方法实现
    self.imageView.image = [UIImage imageNamed:@"PBwaterln1"];
}


#pragma mark - 子类可重写实现
- (NSString *)controllerTitle
{
    return @"runtime动态交换两个方法";
}



@end
