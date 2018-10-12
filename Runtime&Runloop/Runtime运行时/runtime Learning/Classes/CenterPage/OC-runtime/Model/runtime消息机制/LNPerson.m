/*
 * File:  LNPerson.m
 *
 * Public、简书 - 不知名开发者 / https://github.com/CoderLN
 * 该模块将系统化学习，后续「替换、补充文章内容 或 新增文章」
 *
 *【Runtime 消息机制】
 */

#import "LNPerson.h"

@implementation LNPerson

- (void)eat
{
    NSLog(@"小刘很好吃");
}

- (void)run:(NSInteger)metre
{
    NSLog(@"小刘，今天跑了%ld米",metre);
}

@end
