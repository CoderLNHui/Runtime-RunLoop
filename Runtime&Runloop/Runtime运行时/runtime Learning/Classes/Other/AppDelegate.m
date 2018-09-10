/*
 * AppDelegate.m
 *
 *  所谓“运行时”其实就是跟“编译时”区分开了。
 *  方法的调用是在程序运行的时候才确定的，而不是在编译的时候确定的，所以叫运行时。
 */


#import "AppDelegate.h"
#import "LNRootVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [LNRootVC chooseWindowRootVC];
    [self.window makeKeyAndVisible];
    return YES;
}




@end
