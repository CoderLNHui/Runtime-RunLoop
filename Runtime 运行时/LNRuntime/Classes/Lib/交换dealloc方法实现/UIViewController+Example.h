//
//  UIViewController+Example.h
//  MJRefreshExample
//
/**
 利用runtime交换控制器的dealloc 和 自写deallocSwizzle两个方法的实现
 */


#import <UIKit/UIKit.h>

@interface UIViewController (Example)
@property (copy, nonatomic) NSString *method;
@end
