/*
 * File:  LNMessageViewController.m
 *
 * About ME『Public：Codeidea / https://githubidea.github.io』.
 * Copyright © All members (Star|Fork) have the right to read and write『https://github.com/CoderLN/Runtime-RunLoop』.
 *
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
    [self privateMethods];
   // [self test];
}


//--------------------------- Runtime(发送消息，调用私有方法) ------------------------------//
//

// 调用私有方法
- (void)privateMethods{
    
    /**
     id:谁发送消息; SEL:发送什么消息;
     objc_msgSend(id self, SEL op, ...)
     
     // 用最底层写
     objc_getClass(const char *name) 获取当前类
     sel_registerName(const char *str) 注册个方法编号
     让LNPerson这个类对象发送了一个alloc消息，返回一个分配好的内存对象给你;再发送一个消息初始化.
     */
    //id objc = [NSObject alloc];
    LNPerson *person = objc_msgSend(objc_getClass("LNPerson"), sel_registerName("alloc"));
    
    //objc = [objc init];
    objc_msgSend(person,@selector(eat)); // 无参
    objc_msgSend(person,@selector(run:),10); // 有残
 
}

// 方法二：
- (void)test {
    
    // id objc = [NSObject alloc];
    id objc = objc_msgSend([NSObject class], @selector(alloc));
    
    // objc = [objc init];
    objc = objc_msgSend(objc, @selector(eat));
    
}

@end
