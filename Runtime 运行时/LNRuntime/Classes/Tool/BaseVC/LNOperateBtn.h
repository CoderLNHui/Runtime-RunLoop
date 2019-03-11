/*
 * LNOperateBtn.h
 * 不知名开发者 https://dwz.cn/rC1LGk2f | https://github.com/CoderLN/Runtime-RunLoop
 * 
 * 自定义控件操作按钮Btn
 */


#import <UIKit/UIKit.h>

@interface LNOperateBtn : UIButton

/** 初始化按钮 */
- (instancetype)initWithFrame:(CGRect)frame withBtnTitle:(NSString *)btnTitle;

/** 根据传入下标返回操作按钮的frame */
+ (CGRect)rectForBtnAtIndex:(NSUInteger)btnAtIndex;

@end
