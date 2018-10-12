/*
 * File:  LNOperateBtn.h
 *
 * Public、简书 - 不知名开发者 / https://github.com/CoderLN
 * 该模块将系统化学习，后续「替换、补充文章内容 或 新增文章」
 *
 *【自定义操作按钮Btn】
 */

#import <UIKit/UIKit.h>

@interface LNOperateBtn : UIButton

/**
 初始化按钮
 */
- (instancetype)initWithFrame:(CGRect)frame withBtnTitle:(NSString *)btnTitle;

/**
 根据传入下标返回操作按钮的frame
 */
+ (CGRect)rectForBtnAtIndex:(NSUInteger)btnAtIndex;
@end
