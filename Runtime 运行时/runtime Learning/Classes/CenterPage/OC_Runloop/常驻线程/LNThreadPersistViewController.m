/*
 * LNThreadPersistViewController.m
 * Public_不知名开发者 https://github.com/CoderLN，该模块将系统化学习，后续「坚持新增文章，替换、补充文章内容」
 * Runloop场景：常驻线程，让子线程持续存在,也可以切换执行其他任务。
 */

#import "LNThreadPersistViewController.h"

@interface LNThreadPersistViewController ()
@property (nonatomic, strong) NSThread *thread;

@end

@implementation LNThreadPersistViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

// 创建线程
- (IBAction)createThread:(id)sender
{
    // 1.创建线程
    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(task1) object:nil];
    // 2.开启线程
    [self.thread start];
}

- (void)task1
{
    NSLog(@"task1--%@",[NSThread currentThread]);
  
    // 1.获得子线程对应的runloop
    NSRunLoop * currentRunLoop = [NSRunLoop currentRunLoop];
    
    /**
     问题：这里获得子线程对应的runloop如果只调用开启runloop方法，没有效果？
     原因：mode 里面至少要有一个timer(定时器事件) 或者是source(源);
     解决：添加timer事件 或 source源(采用)：
     分析：目地是保证runloop不退出，这里开启一个NSTimer定时器用浪费了。
     */
    // Mode1.添加timer事件
    [currentRunLoop addTimer:[NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(testTimerMethod) userInfo:nil repeats:YES] forMode:NSDefaultRunLoopMode];
    
    // Mode2.添加Source1源(采用),基于端口的事件.
    //[currentRunLoop addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
    
    // 2.一直运行runloop，
    [currentRunLoop run];
    
    // 只限用于子线程，启动Runloop并设置多少时间后退出，退出后会才会执行下面的代码、或指定运行模式.
    //[currentRunloop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5.0]];
    
    // 这里的指定模式要和添加Sources源事件模式一致（这里只能切换执行一次，不知道为什么❓）
    //[currentRunloop runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:5.0]];
    
    NSLog(@"---验证Runloop开启循环让线程不被释放：Runloop退出--");
}

// 让线程继续执行任务
- (IBAction)continueTask:(id)sender
{
    // 这时调用start会crash掉，现在thread已经处于死亡状态
    //[self.thread start];
    
    // 线程间通信（再回到执行任务的线程）
    [self performSelector:@selector(task2) onThread:self.thread withObject:nil waitUntilDone:NO];
}

- (void)task2
{
    NSLog(@"测试让子线程持续存在,也可以切换执行其他任务 task2--%@",[NSThread currentThread]);
}

- (void)testTimerMethod
{
    NSLog(@"测试让子线程持续存在多长时间后退出，定时器销毁 taskThread %@, threadTime:%f",[NSThread currentThread],CFAbsoluteTimeGetCurrent());
}


#pragma mark - 子类重写父类方法
- (NSString *)controllerTitle
{
    return @"Runloop场景：常驻线程";
}

@end






