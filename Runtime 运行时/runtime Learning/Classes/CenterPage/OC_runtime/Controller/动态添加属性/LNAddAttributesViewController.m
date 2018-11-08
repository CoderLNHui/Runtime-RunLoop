/*
 * LNAddAttributesViewController.m
 *「Public_不知名开发者 | https://github.com/CoderLN | https://www.jianshu.com/u/fd745d76c816」
 *
 * 各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」.
 *
 */

#import "LNAddAttributesViewController.h"
#import "NSObject+Property.h"

@interface LNAddAttributesViewController ()

@end

@implementation LNAddAttributesViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self addAttribute];
}


//--------------------------- Runtime(动态添加属性) ------------------------------//
//
- (void)addAttribute
{
    NSObject *objc = [[NSObject alloc] init];
    objc.name = @"19";
    objc.height = @"172";
    
    NSLog(@"\n我的年龄是%@ \n我的身高是%@",objc.name,objc.height);
}


#pragma mark - 子类可重写实现
- (NSString *)controllerTitle
{
    return @"Runtime动态添加属性";
}

@end
