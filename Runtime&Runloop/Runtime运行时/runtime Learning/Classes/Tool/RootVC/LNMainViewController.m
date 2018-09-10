/*
 * LNMainViewController.m
 *
 * Public - CoderLN / https://githubidea.github.io / https://github.com/CoderLN
 * 🏃🏻‍♂️ ◕该模块将系统化学习，后续替换、补充文章内容 ~
 *
 * 主界面
 */

#import "LNMainViewController.h"

@interface LNMainViewController ()

@end

@implementation LNMainViewController

- (NSString *)controllerTitle {
    return @"学习思想";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.imageV];
}

@end
