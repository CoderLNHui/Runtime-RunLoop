/*
 * File:  AppDelegate.m
 * Author:  白开水ln（https://github.com/CustomPBWaters）
 *
 * Created by 【WechatPublic-Codeidea】 on Elegant programming16.
 * Copyright © Reprinted（https://githubidea.github.io）Please indicate the source.Mustbe.
 *
 * JaneBook:  http://www.jianshu.com/u/fd745d76c816
 *
 * @HEADER_WELCOME YOU TO JOIN_GitHub & Codeidea_END@
 */

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
