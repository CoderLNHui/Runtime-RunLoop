//
//  WXSHookViewController.m
//  WXSRuntime
//
//  Created by 王小树 on 16/4/20.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import "WXSHookViewController.h"

@interface WXSHookViewController ()

@end

@implementation WXSHookViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    Method m1 = class_getInstanceMethod([self class], @selector(viewWillAppear:));
    Method m2 = class_getInstanceMethod([self class], @selector(wxs_viewWillAppear:));
    
    BOOL isSuccess = class_addMethod([self class], @selector(viewWillAppear:), method_getImplementation(m2), method_getTypeEncoding(m2));
    if (isSuccess) {
        // 添加成功：说明源方法m1现在的实现为交换方法m2的实现，现在将源方法m1的实现替换到交换方法m2中

        class_replaceMethod([self class], @selector(wxs_viewWillAppear:), method_getImplementation(m1), method_getTypeEncoding(m1));
    }else {
        //添加失败：说明源方法已经有实现，直接将两个方法的实现交换即
        method_exchangeImplementations(m1, m2);
    }
}
-(void)viewWillAppear:(BOOL)animated {
    NSLog(@"viewWillAppear");
}
- (void)wxs_viewWillAppear:(BOOL)animated {
    NSLog(@"Hook : 拦截到viewwillApear的实现，在其基础上添加了这行代码");
    [self wxs_viewWillAppear:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
