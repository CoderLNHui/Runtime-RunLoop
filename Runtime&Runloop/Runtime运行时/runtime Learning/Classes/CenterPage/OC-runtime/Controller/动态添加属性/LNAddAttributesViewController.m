/*
 * File:  LNAddAttributesViewController.m
 *
 * Public - CoderLN / https://githubidea.github.io / https://github.com/CoderLN
 * 🏃🏻‍♂️ ◕该模块将系统化学习，后续替换、补充文章内容 ~
 */

#import "LNAddAttributesViewController.h"
#import "NSObject+Property.h"

@interface LNAddAttributesViewController ()

@end

@implementation LNAddAttributesViewController


- (NSString *)controllerTitle {
    return @"Runtime动态添加属性";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self addAttribute];
}


//--------------------------- Runtime(动态添加属性) ------------------------------//
//

- (void)addAttribute{
    NSObject *objc = [[NSObject alloc] init];
    
    objc.name = @"19";
    objc.height = @"172";
    
    NSLog(@"\n我的年龄是%@ \n我的身高是%@",objc.name,objc.height);
}

@end
