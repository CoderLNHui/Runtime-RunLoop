/*
 * UIImage+Image.h
 * 简/众_不知名开发者 | https://github.com/CoderLN
 * 
 * runtime 作用：动态交换两个方法实现
 */

#import <UIKit/UIKit.h>

@interface UIImage (Image)

+ (UIImage *)ln_imageNamed:(NSString *)name;


/**
 1、runtime 作用：交换方法 class_getInstanceMethod、method_exchangeImplementations
    场景：只要想修改系统的方法实现。
    需求：给加载图片添加一个功能，提示是否加载成功，给系统的imageNamed方法添加功能，只能使用runtime(交换方法)
 实现：给系统的方法添加分类，然后自己实现一个带有扩展功能的方法，不能在分类中重写系统方法imageNamed，因为会把系统的功能给覆盖掉。交换两个方法的实现,只需要交互一次。交换方法一般会写在load方法中，因为方法应先交换，再去调用。
 示例：交换dealloc方法实现，添加打印功能那个控制器被销毁了
 
    # 获取某个类的方法地址
    class_getClassMethod(<#Class  _Nullable __unsafe_unretained cls#> 获取哪个类的方法, <#SEL  _Nonnull name#> 哪个方法)
    # 交换方法实现（交换方法地址，相当于交换实现方式）
    method_exchangeImplementations(<#Method  _Nonnull m1#> 交换前方法1, <#Method  _Nonnull m2#> 交换后方法2)

    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    Method ln_imageNamedMethod = class_getClassMethod(self, @selector(ln_imageNamed:));
    method_exchangeImplementations(imageNamedMethod, ln_imageNamedMethod);
 */
@end
