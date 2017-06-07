//
//  LNRootVC.m
// 【runtime】（https://github.com/CustomPBWaters）
//
//  Created by 简书:白开水ln on 16/-/-.
//  Copyright (c) 2016年（https://custompbwaters.github.io）All rights reserved.
//

#import "LNRootVC.h"
#import "LNLeftViewController.h"
#import "LNMainViewController.h"
#import "LNRightViewController.h"
#import "SWRevealViewController.h"

@implementation LNRootVC

+ (UIViewController *)chooseWindowRootVC {
    
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
    
    [revealVC setFrontViewPosition:FrontViewPositionLeft animated:YES];
    
    return revealVC;
}

@end
