//
//  WXSMessage.m
//  WXSRuntime
//
//  Created by 王小树 on 16/4/21.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import "WXSMessage.h"

@implementation WXSMessage


// 第一步：实现此方法，在调用对象的某方法找不到时，会先调用此方法，允许
// 我们动态添加方法实现
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    // 我们这里没有声明有eat方法，因此，我们可以动态添加eat方法
    if ([NSStringFromSelector(sel) isEqualToString:@"dynamicMehod"]) {
        class_addMethod(self, sel, (IMP)dynamicMehod, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

// 动态添加方法
void dynamicMehod(id self, SEL cmd) {
    NSLog(@"%@ dynamicMehod", self);
}


// 第二步，备选提供响应aSelector的对象，我们不备选，因此设置为nil，就会进入第三步
// 上一步返回NO，就会进入这一步，用于指定备选响应此SEL的对象
// 千万不能返回self，否则就会死循环
// 自己没有实现这个方法才会进入这一流程，因此成为死循环
- (id)forwardingTargetForSelector:(SEL)aSelector {
    return nil;
}

// 第三步，返回方法签名。如果返回nil，则表示无法处理消息 调用-doesNotRecognizeSelector
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if ([NSStringFromSelector(aSelector) isEqualToString:@"dynamicMehod"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

// 第四步，返回了方法签名，都会进入这一步，这一步用户调用方法
// 改变调用对象等
// 当我们实现了此方法后，-doesNotRecognizeSelector:不会再被调用
// 如果要测试找不到方法，可以注释掉这一个方法
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
    // 我们还可以改变方法选择器
    [anInvocation setSelector:@selector(wxsMethod)];
    // 改变方法选择器后，还需要指定是哪个对象的方法
    [anInvocation invokeWithTarget:self];
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"无法处理消息：%@", NSStringFromSelector(aSelector));
}

- (void)wxsMethod {
    NSLog(@"dynamicMehod -> wxsMethodwxsMethod");
}

+ (void)test {
    
    WXSMessage *message = [[WXSMessage alloc] init];
    [message dynamicMehod];

    
}



@end
