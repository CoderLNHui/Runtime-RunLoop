/*
 * LNExchangeMethodViewController.h
 * Public_不知名开发者 https://github.com/CoderLN，该模块将系统化学习，后续「坚持新增文章，替换、补充文章内容」
 * Runtime 交换方法实现；imageNamed => ln_imageNamed 交换这两个方法实现
 */

#import "LNBaseViewController.h"

@interface LNExchangeMethodViewController : LNBaseViewController

/**
 1、Runtime(交换方法)
    应用场景：只要想修改系统的方法实现。

    需求：给加载图片添加一个功能，提示是否加载成功，给系统的imageNamed方法添加功能，只能使用runtime(交换方法)
    分析：
        1.给系统的方法添加分类
        2.自己实现一个带有扩展功能的方法
        3.交互方法,只需要交互一次,
 */


@end
