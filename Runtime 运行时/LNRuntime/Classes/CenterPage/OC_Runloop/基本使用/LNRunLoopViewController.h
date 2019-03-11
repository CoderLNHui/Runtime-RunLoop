/*
 * LNRunLoopViewController.h
 * 不知名开发者 https://dwz.cn/rC1LGk2f | https://github.com/CoderLN/Runtime-RunLoop
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
