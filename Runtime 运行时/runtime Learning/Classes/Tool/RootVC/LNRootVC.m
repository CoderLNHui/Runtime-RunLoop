/*
 * LNRootVC.m
 *「Public_不知名开发者 | https://github.com/CoderLN | https://www.jianshu.com/u/fd745d76c816」
 *
 * 各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」.
 *
 * 选择根控制器
 */

#import "LNRootVC.h"
#import "LNLeftViewController.h"
#import "LNMainViewController.h"
#import "LNRightViewController.h"
#import "SWRevealViewController.h"

@implementation LNRootVC

+ (UIViewController *)chooseWindowRootVC
{
    // 左侧菜单
    LNLeftViewController *leftVC = [[LNLeftViewController alloc] init];
    
    // 主菜单
    LNMainViewController *mainVC = [[LNMainViewController alloc] init];
    
    // 右侧菜单
    LNRightViewController *rightVC = [[LNRightViewController alloc] init];
    
    // 设置左侧VC 和 主显示VC，及右侧VC(可选视图)
    SWRevealViewController *revealVC = [[SWRevealViewController alloc] initWithRearViewController:leftVC frontViewController:mainVC];
    revealVC.rightViewController = rightVC;
    
    // 设置浮动层离左边距的宽度
    revealVC.rearViewRevealWidth = 230;
    
    // 是否让浮动层弹回原位
    //revealVC.bounceBackOnOverdraw = NO;
    
    [revealVC setFrontViewPosition:FrontViewPositionLeft animated:YES];
    
    return revealVC;
}

@end

 
