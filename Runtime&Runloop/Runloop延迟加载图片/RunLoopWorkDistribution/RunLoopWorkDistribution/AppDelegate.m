//
//  AppDelegate.m
//  RunLoopWorkDistribution
 
/** 【本Demo为转载，原作者链接找到会补充上的】 */

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *vc = [ViewController new];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    return YES;
}

 
@end
