//
//  UIViewController+WXSSwizzing.m
//  WXSRuntime
//
//  Created by 王小树 on 16/4/20.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import "UIViewController+WXSSwizzing.h"


@implementation UIViewController (WXSSwizzing)

-(void)wxscount {
    NSLog(@"变成了wxsCount");
}
-(void)count {
    NSLog(@"count");
}

+(void)forTest{
    UIViewController *vc = [[UIViewController alloc] init];
    Method m1 = class_getClassMethod([vc class], @selector(count));
    Method m2 = class_getClassMethod([vc class], @selector(wxscount));
    method_exchangeImplementations(m1, m2);
    BOOL isSuccess = class_addMethod([vc class], @selector(count), method_getImplementation(m2), method_getTypeEncoding(m2));
    if (isSuccess) {
        // 添加成功：将源方法的实现替换到交换方法的实现
        // count方法实现被m2实现替换
        class_replaceMethod([vc class], @selector(wxscount), method_getImplementation(m2), method_getTypeEncoding(m2));
    }else {
        //添加失败：说明源方法已经有实现，直接将两个方法的实现交换即
        
    }
    
    [vc count];
}
@end
