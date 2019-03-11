/*
 * LNBaseViewController.h
 * 不知名开发者 https://dwz.cn/rC1LGk2f | https://github.com/CoderLN/Runtime-RunLoop
 *
 * 基类
 */

#import <UIKit/UIKit.h>
#import "LNOperateBtn.h"

@interface LNBaseViewController : UIViewController

#pragma mark - 抽取方法，子类可重写实现

/** 当前Controller的标题 */
- (NSString *)controllerTitle;

/** 初始化View */
- (void)initView;

/** 按钮操作区的数组元素 */
- (NSArray *)operateTitleArray;

/** 每个按钮的点击事件 */
- (void)btnClick : (UIButton *)btn;


@end

