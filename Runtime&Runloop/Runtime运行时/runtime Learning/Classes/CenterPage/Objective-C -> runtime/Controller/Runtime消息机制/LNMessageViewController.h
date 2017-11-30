/*
 * File:  LNMessageViewController.h
 * Author:  白开水ln（https://github.com/CustomPBWaters）
 *
 * Created by 【WechatPublic-Codeidea】 on Elegant programming16.
 * Copyright © Reprinted（https://githubidea.github.io）Please indicate the source.Mustbe.
 *
 * JaneBook:  http://www.jianshu.com/u/fd745d76c816
 *
 * @HEADER_WELCOME YOU TO JOIN_GitHub & Codeidea_END@
 *
 *【Runtime 消息机制】
 */

#import "LNBaseViewController.h"

@interface LNMessageViewController : LNBaseViewController

/**
 1.
 类方法本质:类对象调用[NSObject class]
 id:谁发送消息
 SEL:发送什么消息
 ((NSObject *(*)(id, SEL))(void *)objc_msgSend)([NSObject class], @selector(alloc));
 xcode6之前,苹果运行使用objc_msgSend.而且有参数提示
 xcode6苹果不推荐我们使用runtime

 2.
 开发中使用场景:
 需要用到runtime,消息机制
 1.gao逼格
 2.不得不用runtime消息机制,可以帮我 调用私有方法.

 */


@end
