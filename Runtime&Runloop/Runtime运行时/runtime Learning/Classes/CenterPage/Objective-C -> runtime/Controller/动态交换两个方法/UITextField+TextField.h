//
//  UITextField+TextField.h
//  🔍白开水ln（https://github.com/CustomPBWaters）
//
//  Created by 【🔍Plainboiledwaterln】 on Elegant programming16.
//  Copyright © Reprinted（https://githubidea.github.io）Please indicate the source.Mustbe.
//
//  @LICENSE_HEADER_微众@白开水ln_如人饮水,冷暖自知_END@
//
//  更多好用工具类,关注我GitHub -> Tools

#import <UIKit/UIKit.h>
#import <objc/message.h>

@interface UITextField (TextField)

/*
 *【设置占位文字的颜色】
 * @param placeholderColor  占位文字的颜色
 */
@property UIColor *placeholderColor;


/*
 *【方式三：runtime交换方法(修改UITextField的占位文字，且设置文字和文字颜色是无序的)】
 * @param placeholder       占位文字
 */
- (void)setLN_Placeholder:(NSString *)placeholder;

@end
