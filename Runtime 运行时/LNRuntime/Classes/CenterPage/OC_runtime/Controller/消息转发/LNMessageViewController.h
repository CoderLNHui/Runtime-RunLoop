/*
 * LNMessageViewController.h
 * Public|JShu_不知名开发者 https://github.com/CoderLN
 *
 */

#import "LNBaseViewController.h"

@interface LNMessageViewController : LNBaseViewController

/**
 1.runtime 作用：消息转发 objc_msgSend(<#id  _Nullable self#> 谁发送消息, <#SEL  _Nonnull op, ...#> 发送什么消息)
    1.类方法本质:类对象调用[NSObject class]
        ((NSObject *(*)(id, SEL))(void *)objc_msgSend)([NSObject class], @selector(alloc));

    2.任何方法调用，本质就是触发函数objc_msgSend发送一个消息，属于动态调用过程。
        objc_getClass(const char *name) 获取当前类
        sel_registerName(const char *str) 注册个方法编号
 
        # 消息转发
        objc_msgSend(id self：谁发送消息, SEL op：送什么消息, ...)
        objc_msgSend(person,@selector(eat));
 
    xcode6之前，苹果运行使用objc_msgSend，而且有参数提示
    xcode6之后，苹果不推荐我们使用runtime

 2、场景：
    1.gao逼格
    2.不得不用runtime消息机制,可以帮我们调用系统私有方法.
 */




@end 
