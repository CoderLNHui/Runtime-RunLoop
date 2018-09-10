/*
 * File:  LNMessageViewController.m
 *
 * Public - CoderLN / https://githubidea.github.io / https://github.com/CoderLN
 * 🏃🏻‍♂️ ◕该模块将系统化学习，后续替换、补充文章内容 ~
 *
 *【Runtime 消息机制】
 */

#import "LNMessageViewController.h"
#import <objc/message.h>
#import "LNPerson.h"


@interface LNMessageViewController ()

@end

@implementation LNMessageViewController

- (NSString *)controllerTitle {
    return @"Runtime消息机制";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self msgSend];
   // [self test];
}


//--------------------------- Runtime(发送消息，调用私有方法) ------------------------------//
//

// 调用私有方法
- (void)msgSend
{
    // 方法一：
    //id objc = [NSObject alloc];
    LNPerson *person = objc_msgSend(objc_getClass("LNPerson"), sel_registerName("alloc"));
    
    //objc = [objc init];
    person = objc_msgSend(person, sel_registerName("init"));
    
    // 调用
    //[objc eat];
    //[objc run:10];
    objc_msgSend(person,@selector(eat)); // 无参
    objc_msgSend(person,@selector(run:),10); // 有残

}
/**
 注解：
    // 用最底层写
    objc_getClass(const char *name) 获取当前类
    sel_registerName(const char *str) 注册个方法编号
    objc_msgSend(id self：谁发送消息, SEL op：送什么消息, ...)
    让LNPerson这个类对象发送了一个alloc消息，返回一个分配好的内存对象给你，再发送一个消息初始化.
 */

// 方法二：
#pragma mark - 也许下面这种好理解一点
- (void)test
{
    // id objc = [NSObject alloc];
    id objc = objc_msgSend([NSObject class], @selector(alloc));
    
    // objc = [objc init];
    objc = objc_msgSend(objc, @selector(eat));
    
}

@end
