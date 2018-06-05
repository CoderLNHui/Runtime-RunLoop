/*
 * File:  Person.m
 *
 * About ME『Public：Codeidea / https://githubidea.github.io』.
 * Copyright © All members (Star|Fork) have the right to read and write『https://github.com/CoderLN/Runtime-RunLoop』.
 *
 * 🏃🏻‍♂️ ◕该模块将系统化学习，后续替换、补充文章内容 ~
 *
 *【Runtime 动态添加方法】
 */

#import "Person.h"
#import <objc/message.h>

@implementation Person

//--------------------------- Runtime(动态添加方法) ------------------------------//
//

// 没有返回值,也没有参数
// void,(id,SEL)
void bbb(id self, SEL _cmd, NSNumber *meter) {
    
    NSLog(@"我跑了 %@ 米", meter);
}

void aaa(id self, SEL _cmd, NSString *meter) {
    
    NSLog(@"我吃了个 %@ 米大蛋糕", meter);
}






// 任何方法默认都有两个隐式参数,self,_cmd
// 什么时候调用:只要一个对象调用了一个未实现的方法就会调用这个方法,进行处理
// 作用:动态添加方法,处理未实现
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    if (sel == NSSelectorFromString(@"run:")) {
        // eat
        // class: 给哪个类添加方法
        // SEL: 添加哪个方法
        // IMP: 方法实现 => 函数 => 函数入口 => 函数名
        // type: 方法类型
        class_addMethod(self, sel, (IMP)bbb, "v@:@");
        
        return YES;
    }
    
    
    
    if ([NSStringFromSelector(sel) isEqualToString:@"eat"]) {

        class_addMethod(self, sel, (IMP)aaa, "v@:@");
        
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
}


@end
