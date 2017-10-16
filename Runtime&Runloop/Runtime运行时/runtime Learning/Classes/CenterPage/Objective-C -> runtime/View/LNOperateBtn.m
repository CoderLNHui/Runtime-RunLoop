/*
 * File:  LNOperateBtn.m
 * Author:  白开水ln（https://github.com/CustomPBWaters）
 *
 * Created by 【WechatPublic-Codeidea】 on Elegant programming16.
 * Copyright © Reprinted（https://githubidea.github.io）Please indicate the source.Mustbe.
 *
 * JaneBook:  http://www.jianshu.com/u/fd745d76c816
 *
 * @HEADER_WELCOME YOU TO JOIN_GitHub & Codeidea_END@
 *
 *【自定义操作按钮Btn】
 */

#import "LNOperateBtn.h"

@implementation LNOperateBtn

- (instancetype)initWithFrame:(CGRect)frame withBtnTitle:(NSString *)btnTitle {
   self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:btnTitle forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:12.f];
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

/**
 根据传入下标返回操作按钮的frame
 btnAtIndex 下标
 */
+ (CGRect)rectForBtnAtIndex:(NSUInteger)btnAtIndex {
    // 每行最多显示4个
    NSUInteger maxRowNum = 4;
    // 每个按钮列间距
    CGFloat columnSpacing = 20;
    // 每个按钮行间距
    CGFloat rowSpacing = 20;
    // 每个按钮的宽度
    CGFloat width = (kScreenWidth - columnSpacing *5)/4;
    // 每个按钮的高度
    CGFloat height = 30;
    
    // 每个按钮的偏移量
    CGFloat offsetX = columnSpacing + (width + columnSpacing) * (btnAtIndex % maxRowNum);
    CGFloat offsetY = rowSpacing + (height + rowSpacing) * (btnAtIndex / maxRowNum);
    
    return CGRectMake(offsetX, offsetY, width, height);
}

@end























