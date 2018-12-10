/*
 * LNRunloopFixedTaskViewController.m
 *「Public_不知名开发者 | https://github.com/CoderLN | https://www.jianshu.com/u/fd745d76c816」
 *
 * 各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」.
 *
 * Runloop场景:开一个子线程,在固定分钟内,每隔几秒执行某个任务一次
 */

#import "LNRunloopFixedTaskViewController.h"

@interface LNRunloopFixedTaskViewController ()

@end

@implementation LNRunloopFixedTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    // Do any additional setup after loading the view.
}

- (IBAction)fixedTaskBtn:(id)sender
{
    [NSThread detachNewThreadSelector:@selector(fixedTask) toTarget:self withObject:nil];
}

#pragma mark - Runloop开一个子线程,在固定分钟内,每隔几秒执行某个任务一次
- (void)fixedTask
{
    // 在1分钟内,每隔5s执行某个任务一次
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    NSTimer * updateTimer = [NSTimer timerWithTimeInterval:5 target:self selector:@selector(testTimerMethod) userInfo:nil repeats:YES];
    [runLoop addTimer:updateTimer forMode:NSRunLoopCommonModes];
    [runLoop addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
    [runLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:60*0.5]];
    
    NSLog(@"固定任务,执行完成");
    
    // 任务执行完成,虽然定时器不工作了,但还是要销毁定时器,再置nil
    [updateTimer invalidate];
    updateTimer = nil;
    NSLog(@"%@",updateTimer);
}

- (void)testTimerMethod
{
    NSLog(@"测试让子线程持续存在多长时间后退出,定时器销毁 taskThread %@, threadTime:%f",[NSThread currentThread],CFAbsoluteTimeGetCurrent());
}



@end
