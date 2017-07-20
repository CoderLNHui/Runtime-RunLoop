//
//  AppDelegate.m
//  🔍白开水ln（https://github.com/CustomPBWaters）
//
//  Created by 【🔍Plain Boiled Water ln】 on Elegant programming16.
//  Copyright © Unauthorized shall（https://githubidea.github.io）not be reproduced reprinted.
//
//  @PBWLN_LICENSE_HEADER_END@
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
