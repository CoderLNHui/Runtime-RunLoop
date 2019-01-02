/*
 * LNMessageViewController.m
 * Public|JShu_不知名开发者 https://github.com/CoderLN
 * runtime 作用：消息转发
 */

#import "LNMessageViewController.h"
#import <objc/message.h>
#import "LNPerson.h"

@interface LNMessageViewController ()

@end

@implementation LNMessageViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self msgSend];
   // [self test];
}


//--------------------------- runtime 发送消息，调用私有方法 ------------------------------//
//

#pragma mark - 调用私有方法
- (void)msgSend
{
    // 方法一：让LNPerson这个类对象发送了一个alloc消息，返回一个分配好的内存对象给你，内存对象再发送一个init消息初始化，然后发送eat消息转发
    //id objc = [NSObject alloc];
    LNPerson *person = objc_msgSend(objc_getClass("LNPerson"), sel_registerName("alloc")); // 获取当前类, 注册个方法编号
    //objc = [objc init];
    person = objc_msgSend(person, sel_registerName("init"));
    
    // 调用
    //[objc eat]; // 无参
    //[objc run:10]; // 有残
    objc_msgSend(person,@selector(eat)); // 消息转发
    objc_msgSend(person,@selector(run:),10);

}


// 方法二：
#pragma mark - 也许下面这种好理解一点
- (void)test
{
    // id objc = [NSObject alloc];
    id objc = objc_msgSend([NSObject class], @selector(alloc));
    
    // objc = [objc init];
    objc = objc_msgSend(objc, @selector(init));
    
    // objc = [objc eat];
    objc = objc_msgSend(objc, @selector(eat));
    
}


#pragma mark - 子类可重写实现
- (NSString *)controllerTitle
{
    return @"runtime 消息机制";
}


@end
