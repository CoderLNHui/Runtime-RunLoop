/*
 * Person.h
 * Public|JShu_不知名开发者 https://github.com/CoderLN
 * runtime 作用：动态添加方法
 */

#import <Foundation/Foundation.h>

@interface Person : NSObject

@end



/**
 1、runtime 作用：动态添加方法
    下面问题考察的就是，runtime动态添加方法.
    有没有使用过performSelector,什么时候使用? 动态添加方法的时候使用过? 怎么动态添加方法? 用runtime?
    为什么要动态添加方法?
 
 
    OC都是懒加载机制,只要一个方法实现了,就会马上添加到方法列表中.
    调用：只要一个对象调用了一个未实现的方法就会调用这个方法,进行处理
    作用：在方法内部动态添加方法,处理未实现
    注解：任何方法默认都有两个隐式参数,self,_cmd（当前方法的方法编号）
    + (BOOL)resolveInstanceMethod:(SEL)sel

 
 # 动态添加方法
 class_addMethod(<#Class  _Nullable __unsafe_unretained cls#>：给哪个类添加方法, <#SEL  _Nonnull name#>：添加哪个方法，即添加方法的方法编号, <#IMP  _Nonnull imp#>：(IMP)myAddingFunction，IMP是一个函数指针，这里表示指定具体方法的实现myAddFunction, <#const char * _Nullable types#>：方法编码类型，(返回值+参数类型) v:void @:对象->self :表示SEL->_cmd；0代表没有参数)
 class_addMethod(self, sel, (IMP)LNGO, "v@:@");
 class_addMethod(self, @selector(LNGO), (IMP)LNGO, "V@:");
 */
