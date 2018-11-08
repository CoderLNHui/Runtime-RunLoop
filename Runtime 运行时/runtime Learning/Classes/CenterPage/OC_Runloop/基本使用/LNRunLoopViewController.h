/*
 * LNRunLoopViewController.h
 *「Public_不知名开发者 | https://github.com/CoderLN | https://www.jianshu.com/u/fd745d76c816」
 *
 * 各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」.
 *
 * Runloop基本使用
 */


#import "LNBaseViewController.h"

@interface LNRunLoopViewController : LNBaseViewController

 
@end


#pragma mark - 场景：tableView延迟加载图片
/**
 在主线程下
 指定NSDefaultRunLoopMode模式的延迟加载，滑动textView系统会将Runloop切换到UITrackingRunLoopMode模式下，这样定时器就停止工作，当停止textView滑动系统会将Runloop切换到NSDefaultRunLoopMode模式下，定时器又重新开始工作。

- (void)performLoad
{
    [NSTimer scheduledTimerWithTimeInterval:3 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self performSelector:@selector(runClick) withObject:@"参数" afterDelay:0 inModes:@[NSDefaultRunLoopMode]];
    }];
}
 */
