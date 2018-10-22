/*
 * Person.m
 * Public_不知名开发者 https://github.com/CoderLN，该模块将系统化学习，后续「坚持新增文章，替换、补充文章内容」 
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
        
        // 添加方法：给类添加roll:滚了多远方法
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





//----------------------- [动态添加方法、动态交换两个方法的实现] ------------------------//
// 下面这种方式更好理解一些
- (void)resolveInstanceMethod
{
    //每个类都维护一个方法列表，其中方法名与其实现是一一对应的关系，即SEL(方法编号)和IMP(指向实现的指针)的对应关系。method swizzling 可以在runtime 将SEL和IMP进行交换。比如：SELa原来对应IMPa，SELb原来对应IMPb，而在Method swizzling之后，SELa原来对应IMPb，SELb原来对应IMPa
    
    //场景代码：
    //方法一：SEL（方法编号）和 Method（方法）
    SEL oneSEL        = @selector(methodOne:);//获取方法名
    Method oneMethod  = class_getInstanceMethod(self, oneSEL);//获取方法
    IMP oneImp        = method_getImplementation(oneMethod);//获取方法的实现
    char oneType      =  method_getTypeEncoding(oneMethod);//获取方法编码类型
    
    //方法二：SEL（方法编号）和 Method（方法）
    SEL twoSEL       = @selector(methodTwo:);
    Method twoMethod = class_getInstanceMethod(self, twoSEL);
    IMP twoImp       = method_getImplementation(twoMethod);
    char twoType     =  method_getTypeEncoding(twoMethod);
    
    //给方法一添加方法实现，可以避免方法一没有实现
    BOOL addSucces   = class_addMethod([self class], oneSEL, twoImp, twoType);
    
    if (addSucces) {//添加成功，将方法一的实现替换到方法二上
        class_replaceMethod([self class], twoSEL, oneImp, oneType);//替换原有方法的实现
    }
    else {//添加失败，方法一已经有实现，直接交换方法一和方法二的实现
        method_exchangeImplementations(class_getClassMethod([self class], oneSEL), class_getClassMethod(self, twoSEL));
    }
}















@end
