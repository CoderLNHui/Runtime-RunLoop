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

// 没有返回值，1个参数
// void,(id,SEL)
void LNRoll(id self, SEL _cmd, NSString *meters) {
    
    NSLog(@"我滚了 %@ 米远的屎蛋", meters);
}

void LNGO(id self, SEL _cmd, NSNumber *meters) {
    
    NSLog(@"我走了 %@ 公里才到的家", meters);
}


/**
 调用：只要一个对象调用了一个未实现的方法就会调用这个方法,进行处理
 作用：动态添加方法,处理未实现
 注解：任何方法默认都有两个隐式参数,self,_cmd（当前方法的方法编号）
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    if (sel == NSSelectorFromString(@"roll:")) {
        /**
         动态添加方法
         class_addMethod(<#Class  _Nullable __unsafe_unretained cls#>：给哪个类添加方法, <#SEL  _Nonnull name#>：添加哪个方法，即添加方法的方法编号, <#IMP  _Nonnull imp#>：(IMP)myAddingFunction，IMP是一个函数指针，这里表示指定具体实现方法myAddingFunction, <#const char * _Nullable types#>：方法类型，(返回值+参数类型) v:void @:对象->self :表示SEL->_cmd；0代表没有参数)
         */
        // 给类添加roll:滚了多远方法
        class_addMethod(self, sel, (IMP)LNRoll, "v@:@");
        
        return YES;
    }
    
    if ([NSStringFromSelector(sel) isEqualToString:@"go:"]) {
        // 给类添加go:走了多远方法
        class_addMethod(self, sel, (IMP)LNGO, "v@:@");
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
}

 


@end
