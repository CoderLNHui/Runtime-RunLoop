//
//  LNAddAttributesViewController.m
//  🔍白开水ln（https://github.com/CustomPBWaters）
//
//  Created by 【🔍Plain Boiled Water ln】 on Elegant programming16.
//  Copyright © Unauthorized shall（https://custompbwaters.github.io）not be reproduced reprinted.
//
//  @PBWLN_LICENSE_HEADER_END@
//

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
    
    objc.name = @"35";
    objc.height = @"172";
    
    NSLog(@"\n我的年龄是%@ \n我的身高是%@",objc.name,objc.height);
}

@end
