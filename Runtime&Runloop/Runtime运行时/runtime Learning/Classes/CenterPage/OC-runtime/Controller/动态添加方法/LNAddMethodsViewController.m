/*
 * File:  LNAddMethodsViewController.m
 *
 * About ME『Public：Codeidea / https://githubidea.github.io』.
 * Copyright © All members (Star|Fork) have the right to read and write『https://github.com/CoderLN/Runtime-RunLoop』.
 *
 * 🏃🏻‍♂️ ◕该模块将系统化学习，后续替换、补充文章内容 ~
 */

#import "LNAddMethodsViewController.h"
#import "Person.h"

@interface LNAddMethodsViewController ()

@end

@implementation LNAddMethodsViewController

//--------------------------- Runtime(动态添加方法) ------------------------------//
//

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 默认person，没有实现run:方法，可以通过performSelector调用，但是会报错。
    // 动态添加方法就不会报错
    Person *p = [[Person alloc] init];
    
    // 执行某个方法
    [p performSelector:@selector(roll:) withObject:@"11"];
    [p performSelector:@selector(go:) withObject:@10];
}


- (NSString *)controllerTitle {
    return @"Runtime动态添加方法";
}


@end
