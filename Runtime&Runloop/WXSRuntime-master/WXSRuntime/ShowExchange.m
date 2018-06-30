//
//  ShowExchange.m
//  WXSRuntime
//
//  Created by 王小树 on 16/4/26.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import "ShowExchange.h"

@implementation ShowExchange
-(void)firstMethod {
    NSLog(@"firstMethod");
}
-(void)secondMethod{
    NSLog(@"secondMethod");
}
+(void)forTest {
    
    NSLog(@"------Normal-----\n");
    ShowExchange *normarlTest = [ShowExchange new];
    [normarlTest firstMethod];
    NSLog(@"------Normal-----\n");
    
    //交换实例方法
    NSLog(@"------exchange-----\n");
   
    Method m1 = class_getInstanceMethod([ShowExchange class], @selector(firstMethod));
    Method m2 = class_getInstanceMethod([ShowExchange class], @selector(secondMethod));
    method_exchangeImplementations(m1, m2);

    ShowExchange *test = [ShowExchange new];
    [test firstMethod];
    NSLog(@"------exchange InstanceMethod-----\n");
    
}
@end
