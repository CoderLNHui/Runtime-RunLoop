/*
 * LNAddMethodsViewController.m
 *「Public_不知名开发者 | https://github.com/CoderLN | https://www.jianshu.com/u/fd745d76c816」
 *
 * 各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」.
 *
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

#pragma mark - 子类可重写实现
- (NSString *)controllerTitle
{
    return @"Runtime动态添加方法";
}
 
@end
