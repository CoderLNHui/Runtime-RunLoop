//
//  ViewController.m
//  🔍白开水ln（https://github.com/CustomPBWaters）
//
//  Created by 【🔍Plainboiledwaterln】 on Elegant programming16.
//  Copyright © Reprinted（https://githubidea.github.io）Please indicate the source.Mustbe.
//
//  @LICENSE_HEADER_微众@白开水ln_如人饮水,冷暖自知_END@
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSThread *thread;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


// 创建线程
- (IBAction)createThread:(id)sender {
    // 1.创建线程
    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(task1) object:nil];
    // 2.开启线程
    [self.thread start];
}

- (void)task1 {
    
    NSLog(@"task1--%@",[NSThread currentThread]);

    // 1.获得子线程对应的runloop
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    
    /**
     【问题重点】：这里如果只调用 开启runloop方法，是不会有效果的？
     【原因】：mode 里面至少要有一个timer(定时器事件) 或者是source(源);
     【解决】：添加 1.timer事件 或 2.source源(采用)
     【分析】：目地是保证runloop不退出，这里开启一个NSTimer定时器用处不大。
     */
    /**
     【Mode1】.添加timer事件
      NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(testTimerMethod) userInfo:nil repeats:YES];
     [runloop addTimer:timer forMode:NSDefaultRunLoopMode];
     */
    [runloop addTimer:[NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(testTimerMethod) userInfo:nil repeats:YES] forMode:NSDefaultRunLoopMode];
    
    
    
    //【Mode2】.添加Source源(采用),基于端口的事件.
    //[runloop addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
    
    
    // 2.开启runloop（这里如果只调用 开启runloop方法，是不会有效果的？）
    //[runloop run];
    [runloop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10.0]];//【可设定时间6s后退出Runloop，打印下面的NSLog】
    
    NSLog(@"---验证Runloop开启循环是否有效：Runloop退出--");
}

// 让线程继续执行任务
- (IBAction)continueTask:(id)sender {
    // 这时调用 start,会crash掉 现在thread处于死亡状态
    //[self.thread start];
    
    // 技巧:线程间通信(再回到执行任务的线程)
    [self performSelector:@selector(task2) onThread:self.thread withObject:nil waitUntilDone:YES];
}

- (void)task2 {
    NSLog(@"可以切换执行其他任务 task2--%@",[NSThread currentThread]);
}


- (void)testTimerMethod
{
    NSLog(@"简书白开水ln == 测试子线程开启Runloop中添加timer事件,让线程持续存在10s");
}



@end
