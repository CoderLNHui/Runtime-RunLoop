//
//  AppDelegate.m
// 【runtime】（https://github.com/CustomPBWaters）
//
//  Created by 简书:白开水ln on 15/-/-.
//  Copyright © 2015年（https://custompbwaters.github.io）All rights reserved.
//

/**
 【白开水ln】：(我) 也是对所花费时间的一个总结
 
 【白开水ln】：(我) 只是个【有思想的伐码猿🐒】加上【自己的学习总☕️】写出来的文章。
 【对你有帮助或是喜欢，你的 「Star & Fork」 是对我最大的赞赏 ！】
 
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
