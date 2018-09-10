/*
 * File:  LNMessageViewController.h
 *
 * Public - CoderLN / https://githubidea.github.io / https://github.com/CoderLN
 * 🏃🏻‍♂️ ◕该模块将系统化学习，后续替换、补充文章内容 ~
 *
 *【Runtime 消息机制】
 */

#import "LNBaseViewController.h"

@interface LNMessageViewController : LNBaseViewController

/**
 1、Runtime 消息机制
    类方法本质:类对象调用[NSObject class]
    id:谁发送消息
    SEL:发送什么消息
    ((NSObject *(*)(id, SEL))(void *)objc_msgSend)([NSObject class], @selector(alloc));
    xcode6之前，苹果运行使用objc_msgSend.而且有参数提示
    xcode6之后，苹果不推荐我们使用runtime

 2、场景：需要用到runtime,消息机制
    1.gao逼格
    2.不得不用runtime消息机制,可以帮我们 调用系统私有方法.
 */


@end 
