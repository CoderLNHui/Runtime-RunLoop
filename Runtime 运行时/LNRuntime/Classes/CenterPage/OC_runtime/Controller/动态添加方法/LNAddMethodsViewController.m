/*
 * LNAddMethodsViewController.m
 * 简/众_不知名开发者 | https://github.com/CoderLN
 * 
 */

#import "LNAddMethodsViewController.h"
#import "Person.h"

@interface LNAddMethodsViewController ()

@end

@implementation LNAddMethodsViewController

//--------------------------- runtime(动态添加方法) ------------------------------//
//

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 默认person，没有实现run:方法，可以通过performSelector调用，但是会警告。
    // 动态添加方法就不会报错
    Person *p = [[Person alloc] init];
    
    // 执行某个方法
    [p performSelector:@selector(roll:) withObject:@"11"];
    [p performSelector:@selector(go:) withObject:@10];
}

#pragma mark - 子类可重写实现
- (NSString *)controllerTitle
{
    return @"runtime动态添加方法";
}
 
@end
