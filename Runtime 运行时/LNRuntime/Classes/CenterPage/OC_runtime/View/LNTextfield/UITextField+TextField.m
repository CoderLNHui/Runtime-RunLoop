/*
 * UITextField+TextField.m
 * Public|JShu_不知名开发者 https://github.com/CoderLN
 */

#import "UITextField+TextField.h"

@implementation UITextField (TextField)

/*
 * 设置占位文字的颜色
 */
- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    // 设置 runtime给系统的类【添加成员属性,保存属性
    objc_setAssociatedObject(self, @"placeholderColor", placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 获取占位文字label控件
    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];

    // 设置占位文字颜色
    placeholderLabel.textColor = placeholderColor;
}

- (UIColor *)placeholderColor
{
    // 获取类成员属性
    return objc_getAssociatedObject(self, @"placeholderColor");
}


/*
 * 设置占位文字 和 文字颜色
 */
- (void)setLN_Placeholder:(NSString *)placeholder
{
    [self setLN_Placeholder:placeholder];
    
    self.placeholderColor = self.placeholderColor;
}


/*
 * runtime 交换方法(一次)
 */
+ (void)load
{
    // class_getInstanceMethod 获取方法
    Method setPlaceholderMethod = class_getInstanceMethod(self, @selector(setPlaceholder:));
    Method setLN_PlaceholderMethod = class_getInstanceMethod(self, @selector(setLN_Placeholder:));
    
    // method_exchangeImplementations 交换方法
    method_exchangeImplementations(setPlaceholderMethod, setLN_PlaceholderMethod);
}


@end
