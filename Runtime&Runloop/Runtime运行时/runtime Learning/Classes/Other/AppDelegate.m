/*
 * AppDelegate.m
 *
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
