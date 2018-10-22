/*
 * LNBaseViewController.h
 * Public_不知名开发者 https://github.com/CoderLN，该模块将系统化学习，后续「坚持新增文章，替换、补充文章内容」
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

