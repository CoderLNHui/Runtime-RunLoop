/*
 * File:  LNStudent.h
 * Author:  白开水ln（https://github.com/CustomPBWaters）
 *
 * Created by 【WechatPublic-Codeidea】 on Elegant programming16.
 * Copyright © Reprinted（https://githubidea.github.io）Please indicate the source.Mustbe.
 *
 * JaneBook:  http://www.jianshu.com/u/fd745d76c816
 *
 * @HEADER_WELCOME YOU TO JOIN_GitHub & Codeidea_END@
 *
 *【KVC 字典转模型】
 */


#import <Foundation/Foundation.h>

@class LNDog;
@interface LNStudent : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger age;

@property (nonatomic, strong) LNDog * dog;


@end
