/*
 * LNMainViewController.m
 * Public_不知名开发者 https://github.com/CoderLN，该模块将系统化学习，后续「坚持新增文章，替换、补充文章内容」
 * 主显示界面
 */

#import "LNMainViewController.h"

@interface LNMainViewController ()

@end

@implementation LNMainViewController

- (NSString *)controllerTitle
{
    return @"学习分解";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setlogImage];
}

- (void)setlogImage
{
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.bounds = CGRectMake(0, 0, kScreenWidth - 40, kScreenHeight * 0.5);
    imageV.center = CGPointMake(kScreenWidth * 0.5, kScreenHeight * 0.5);
    imageV.image = [UIImage imageNamed:@"不知名开发者"];
    imageV.layer.cornerRadius = 10;
    imageV.layer.masksToBounds = YES;
    imageV.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:imageV];
}

@end
