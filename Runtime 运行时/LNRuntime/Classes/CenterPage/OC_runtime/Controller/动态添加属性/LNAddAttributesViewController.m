/*
 * LNAddAttributesViewController.m
 * Public|JShu_不知名开发者 https://github.com/CoderLN
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
