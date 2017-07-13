//
//  LNOperateBtn.h
//  🔍白开水ln（https://github.com/CustomPBWaters）
//
//  Created by 【🔍Plain Boiled Water ln】 on Elegant programming16.
//  Copyright © Unauthorized shall（https://custompbwaters.github.io）not be reproduced reprinted.
//
//  @PBWLN_LICENSE_HEADER_END@
//
//  自定义操作按钮Btn

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
