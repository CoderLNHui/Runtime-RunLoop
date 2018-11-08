/*
 * LNThreadPersistViewController.h
 *「Public_不知名开发者 | https://github.com/CoderLN | https://www.jianshu.com/u/fd745d76c816」
 *
 * 各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」.
 *
 * Runloop场景：常驻线程，让子线程持续存在,也可以切换执行其他任务。
 */

#import "LNBaseViewController.h"

@interface LNThreadPersistViewController : LNBaseViewController

/**
 Runloop场景：常驻线程，让子线程持续存在,也可以切换执行其他任务。
 注解：
 线程创建出来就处于等待状态(有或无任务)，任务执行完成也不退出，想用它的时候就用它执行任务，不想用的时候就处于等待状态）
 场景：
 1.聊天发送语音消息,可能会专门开一个子线程来处理；
 2.在后台记录用户的停留时间或某个按钮点击次数,这些用主线程做可能不太方便,可能会开启一个子线程后台默默收集；
 需求：
 让子线程持续存在,也可以切换执行其他任务
 解决：
 在子线程操作任务方法中，获取子线程对应的runloop并开启，还要添加timer/source至少一种事件，
 原因：
 在通知观察者即将进入runloop前，内部会判断runloop指定mode里面有没有timer/source事件，如果两者都没有就会直接返回。
 添加一种事件的目地就是保证runloop不退出，这里采用添加Source1(基于port)事件，只需要简单的创建端口NSPort对象，
 并使用addPort:的方法将端口对象加入到runloop中，端口对象会处理创建以及配置输入源。
 */

@end

