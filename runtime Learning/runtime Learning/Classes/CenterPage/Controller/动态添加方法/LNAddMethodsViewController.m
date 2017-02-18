//
//  LNAddMethodsViewController.m
//  runtime Learning
//
//  Created by LN on 17/2/18.
//  Copyright © 2017年 Learning point. All rights reserved.
//

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
    
    [p performSelector:@selector(run:) withObject:@10];
}

@end
