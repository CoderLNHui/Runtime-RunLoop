/*
 * File:  LNAddMethodsViewController.m
 *
 * About ME『Public：Codeidea / https://githubidea.github.io』.
 * Copyright © All members (Star|Fork) have the right to read and write『https://github.com/CoderLN/Runtime-RunLoop』.
 *
 * 🏃🏻‍♂️ ◕该模块将系统化学习，后续替换、补充文章内容 ~
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
 

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addMethods];
}

//--------------------------- Runtime(动态添加方法) ------------------------------//
//

- (void)addMethods {
    // _cmd:当前方法的方法编号
    
    Person *p = [[Person alloc] init];
    
    // 执行某个方法
    [p performSelector:@selector(eat) withObject:@"0.5"];

    [p performSelector:@selector(run:) withObject:@10];
}

@end
