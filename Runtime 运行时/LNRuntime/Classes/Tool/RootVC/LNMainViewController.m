/*
 * LNMainViewController.m
 * 不知名开发者 https://dwz.cn/rC1LGk2f | https://github.com/CoderLN/Runtime-RunLoop
 * 
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
