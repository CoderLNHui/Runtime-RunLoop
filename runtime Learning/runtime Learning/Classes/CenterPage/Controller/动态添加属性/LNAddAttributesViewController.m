//
//  LNAddAttributesViewController.m
//  runtime Learning
//
//  Created by LN on 17/2/18.
//  Copyright © 2017年 Learning point. All rights reserved.
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
