/*
 * File:  LNBaseViewController.h
 *
 * Public - CoderLN / https://githubidea.github.io / https://github.com/CoderLN
 * 🏃🏻‍♂️ ◕该模块将系统化学习，后续替换、补充文章内容 ~
 *
 * 基类
 */

#import <UIKit/UIKit.h>
#import "LNOperateBtn.h"

@interface LNBaseViewController : UIViewController
@property (nonatomic, strong) UIImageView *imageV;

/**
 当前Controller的标题
 */
-(NSString *)controllerTitle;


/**
 初始化View
 */
-(void)initView;


/**
 按钮操作区的数组元素
 */
-(NSArray *)operateTitleArray;


/**
 每个按钮的点击事件
 */
-(void)btnClick : (UIButton *)btn;
@end
