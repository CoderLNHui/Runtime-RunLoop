/*
 * File:  ViewController.h
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
 Runloop 经典应用：常驻线程
 
 
 
 
 【注解】：线程创建出来就处于等待状态(有或无任务)，想用它的时候就用它执行任务，不想用的时候就处于等待状态）
 【场景】：如：1.聊天发送语音消息,可能会专门开一个子线程来处理；2.在后台记录用户的停留时间或某个按钮点击次数,这些用主线程做可能不太方便,可能会开启一个子线程后台默默收集；
 【需求】:让线程持续存在,可以切换执行其他任务
 【解决】:开启 Runloop循环
 */
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end

