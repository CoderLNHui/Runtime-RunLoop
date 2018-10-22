/*
 * LNOperateBtn.h
 * Public_不知名开发者 https://github.com/CoderLN，该模块将系统化学习，后续「坚持新增文章，替换、补充文章内容」
 * 自定义控件操作按钮Btn
 */


#import <UIKit/UIKit.h>

@interface LNOperateBtn : UIButton

/** 初始化按钮 */
- (instancetype)initWithFrame:(CGRect)frame withBtnTitle:(NSString *)btnTitle;

/** 根据传入下标返回操作按钮的frame */
+ (CGRect)rectForBtnAtIndex:(NSUInteger)btnAtIndex;

@end
