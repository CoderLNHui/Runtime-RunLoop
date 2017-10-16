/*
 * File:  LNAddMethodsViewController.m
 * Author:  白开水ln（https://github.com/CustomPBWaters）
 *
 * Created by 【WechatPublic-Codeidea】 on Elegant programming16.
 * Copyright © Reprinted（https://githubidea.github.io）Please indicate the source.Mustbe.
 *
 * JaneBook:  http://www.jianshu.com/u/fd745d76c816
 *
 * @HEADER_WELCOME YOU TO JOIN_GitHub & Codeidea_END@
 *
 *【Runtime 动态添加方法 -> [person performSelector:@selector(run:) withObject:@10]】
 */

#import "LNAddMethodsViewController.h"
#import "Person.h"

@interface LNAddMethodsViewController ()

@end

@implementation LNAddMethodsViewController

- (NSString *)controllerTitle {
    return @"Runtime动态添加方法";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self addMethods];
}

//--------------------------- Runtime(动态添加方法) ------------------------------//
//

- (void)addMethods {
    //    _cmd:当前方法的方法编号
    
    Person *p = [[Person alloc] init];
    
    // 执行某个方法
    //    [p performSelector:@selector(eat)];
    
    [Person performSelector:@selector(run:) withObject:@10];
}

@end
