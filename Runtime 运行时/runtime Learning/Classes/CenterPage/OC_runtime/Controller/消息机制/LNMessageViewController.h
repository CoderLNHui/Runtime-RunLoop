/*
 * LNMessageViewController.h
 *「Public_不知名开发者 | https://github.com/CoderLN | https://www.jianshu.com/u/fd745d76c816」
 *
 * 各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」.
 *
 * Runtime 消息机制；objc_msgSend(<#id  _Nullable self#>, <#SEL  _Nonnull op, ...#>)
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
