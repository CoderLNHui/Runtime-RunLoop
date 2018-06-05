/*
 * File:  LNOperateBtn.h
 *
 * About ME『Public：Codeidea / https://githubidea.github.io』.
 * Copyright © All members (Star|Fork) have the right to read and write『https://github.com/CoderLN/Runtime-RunLoop』.
 *
 * 🏃🏻‍♂️ ◕该模块将系统化学习，后续替换、补充文章内容 ~
 *
 *【自定义操作按钮Btn】
 */

#import <UIKit/UIKit.h>

@interface LNOperateBtn : UIButton

/**
 初始化按钮
 frame,
 btnTitle 标题
 */
- (instancetype)initWithFrame:(CGRect)frame withBtnTitle:(NSString *)btnTitle;

/**
 根据传入下标返回操作按钮的frame
 btnAtIndex 下标
 */
+ (CGRect)rectForBtnAtIndex:(NSUInteger)btnAtIndex;
@end
