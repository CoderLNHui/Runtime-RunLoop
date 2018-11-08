/*
 * LNRunLoopViewController.m
 *「Public_不知名开发者 | https://github.com/CoderLN | https://www.jianshu.com/u/fd745d76c816」
 *
 * 各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」.
 *
 * Runloop基本使用
 */


#import "LNRunLoopViewController.h"
#import <CoreFoundation/CFRunLoop.h>
@interface LNRunLoopViewController ()

// 需设置全局变量
@property (nonatomic, strong) dispatch_source_t timer;
@end

@implementation LNRunLoopViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //----------------------- CFRunloopRef RunLoop本身 ------------------------//
    //
    //[self getRunloop];
    //[self runLoopAndThread];
    // 验证：主线程的Runloop是默认自动创建并开启的，子线程的Runloop需要手动获取并开启。
    //[NSThread detachNewThreadSelector:@selector(runLoopAndThread) toTarget:self withObject:nil];
    

    //----------------------- CFRunLoopMode Runloop的运行模式 ------------------------//
    //
    //[self testRunloopMode];
    
    //----------------------- CFRunloopTimerRef 定时器事件 ------------------------//
    //
    //[self gcdTimer];
    
    //--------------------------- CFRunloopObserverRef Runloop的观察者（监听者） ------------------------------//
    //
    //[self runLoopAddObserver];
}

#pragma mark - CFRunloopRef_RunLoop本身
#pragma mark -获取Runloop
// 获得主线程 和 当前线程对应的runloop
- (void)getRunloop
{
    // NOTE：Foundation框架
    NSLog(@"Foundation--%p--%p",[NSRunLoop mainRunLoop], [NSRunLoop currentRunLoop]);

    // NOTE：CoreFoundation框架
    NSLog(@"Core Foundation--%p--%p",CFRunLoopGetMain(), CFRunLoopGetCurrent());
    
    // NOTE：NSRunLoop <--> CFRunloop 转化
    NSLog(@"NSRunLoop <--> CFRunloop == %p--%p",CFRunLoopGetMain() , [NSRunLoop mainRunLoop].getCFRunLoop);
}
/**
 Foundation--0x6040000bda60--0x6040000bda60
 Core Foundation--0x6040001ebe00--0x6040001ebe00
 NSRunLoop <--> CFRunloop == 0x6040001ebe00--0x6040001ebe00
 */


#pragma mark -Runloop和线程的关系
// 验证：主线程的Runloop是默认自动创建并开启的；子线程的Runloop需要手动获取并开启，也可以退出。
- (void)runLoopAndThread
{
    //该方法内部自动添加到Runloop中,并且设置运行模式为默认模式
    //[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(runClick) userInfo:nil repeats:YES];
    /**
     问题1：如果在子线程直接调runLoopAndThread，会没有效果？
     分析：
         1.在主线程下调用，定时器正常工作。原因：主线程的Runloop是默认自动创建并开启的。
         2.在子线程下调用，定时器不能工作。原因：子线程的Runloop需要手动获取并开启。
     解决：获取子线程的runloop并开启，[[NSRunLoop currentRunLoop] run];
     */
    
    /**
     问题2：OC中如何创建子线程对应的Runloop ?
     原因：
         不是通过[alloc init]方法创建，而是直接通过调用currentRunLoop方法来创建。currentRunLoop本身是懒加载的，当第一次调用currentRunLoop 方法获得该子线程对应的 Runloop 的时候,它会先去判断（去字典中查找）这个线程的Runloop 是否存在，如果不存在就会自己创建并且返回，如果存在直接返回。
     解决：获取子线程的runloop：[NSRunLoop currentRunLoop]，也是获得当前线程的runloop。
     */
    
    // 在子线程中调用
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(runClick) userInfo:nil repeats:YES];
    // 获取子线程（当前线程）对应runloop
    NSRunLoop * currentRunloop = [NSRunLoop currentRunLoop];
    // 启动
    //[currentRunloop run];
    
    // 只限用于子线程，启动Runloop并设置多少时间后退出，退出后会才会执行下面的代码、或指定运行模式.
    [currentRunloop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5.0]];
    //[currentRunloop runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:5.0]];

    NSLog(@"Runloop和线程的关系 %@",[NSThread currentThread]);
}



#pragma mark - CFRunLoopMode Runloop的运行模式
// 验证：根据界面UITextView控件是否处于滑动状态验证Runloop的运行模式适应情况
- (void)testRunloopMode
{
    // 1.方式一
    NSTimer *timer =  [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(runClick) userInfo:nil repeats:YES];
    // 2.添加定时器到指定Runloop运行模式中
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];// 默认模式 --> 需求1
    //[[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];// 界面追踪模式，用于ScrollView追踪触摸滑动，保证界面滑动时不受影响。 --> 需求2
    //[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];// 标签(默认和追踪两种结合)，经常使用。--> 需求3
    
    // 1.方式二：该方法内部自动添加到Runloop中,并且设置运行模式为默认模式
    //NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    // 也可以修改Runloop的运行模式
    //[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    
    NSLog(@"获取当前Runloop的运行模式 %@",[NSRunLoop currentRunLoop].currentMode);//kCFRunLoopDefaultMode
    // NOTE：笔记
    /**
     1.问题：ScrollView处于滑动状态时，会造成定时器会停止工作❓
       原因：当滑动ScrollView时，Runloop的运行模式会自动切换到TrackingMode界面追踪模式，这时候其它所有模式下的Sources(触摸事件、定时器事件)都停止工作; 当停止ScrollView滑动时, 运行模式又切换到了Default模式，定时器又开始重新工作;
       解决：修改Runloop的运行模式NSRunLoopCommonModes
     
     2.需求：只在TextView处于滑动状态时，定时器才会工作。
       解决：设置Runloop的运行模式为UITrackingRunLoopMode（界面追踪模式）.
     
     3.需求：不管TextView是否处于滑动状态，定时器都能正常工作。
       解决：设置Runloop的运行模式为NSRunLoopCommonModes.
       注解：
            1.这时打印 .currentMode，结果是运行模式包含 (NSDefaultRunLoopMode 和 UITrackingRunLoopMode)
              也可以说: NSRunLoopCommonModes = NSDefaultRunLoopMode + UITrackingRunLoopMode;
              凡是添加到CommonModes中的事件都会被同时添加到打上Common标签的运行模式上;
            2.在主线程下的，runloop的运行模式默认也是 (NSDefaultRunLoopMode 和 UITrackingRunLoopMode)
     */
}



#pragma mark - CFRunloopTimerRef 定时器事件
#pragma mark -GCD中的定时器 dispatch_source_t timer
- (void)gcdTimer
{
    // 1.创建GCD中的定时器
    /**
     参数一：DISPATCH_SOURCE_TYPE_TIMER:source的类型,表示是定时器
     参数二：描述信息,线程ID
     参数三：更详细的描述信息
     参数四：dispatchQueue:队列,决定GCD定时器中的任务在那个线程执行
     */
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    
    // 2.设置定时器(起始时间,时间间隔,精准度)
    /**
     参数一：timer:定时器对象
     参数二：DISPATCH_TIME_NOW:起始时间,从现在开始
     参数三：intervalInSeconds:时间间隔,GCD中时间单位为纳秒
     参数四：leewayInSeconds:精准度,绝对精准0
     */
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    
    // 3.设置定时器执行的任务
    dispatch_source_set_event_handler(timer, ^{
        NSLog(@"GCD--%@",[NSThread currentThread]);
    });
    // 4.启动执行
    dispatch_resume(timer);
    self.timer = timer;
    
    /**
     问题：GCD定时器不工作❓
     原因：这里（dispatch_source_t timer）是局部变量，但是我在设置定时器执行任务是在2s后，2s后这个变量可能就被释放掉了，所以不工作。
     解决：给timer添加强引用，定义全局变量，目地保证timer不被释放；
          @property (nonatomic, strong) dispatch_source_t timer; //GCDtimer需设置全局变量
     */
}


#pragma mark - CFRunloopObserverRef Runloop的观察者（监听者）
// 需求：监听Runloop现在是否正在工作，如果发现activity没有工作可以主动派发任务
-(void)runLoopAddObserver
{
    //1.创建监听者
    /*
     参数一：怎么分配存储空间(GetDefault 默认分配)
     参数二：要监听的状态 kCFRunLoopAllActivities 所有的状态改变
     参数三：是否持续监听
     参数四：优先级 总是传0
     参数五：当状态改变时候的回调
     */
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
    
        /*
         kCFRunLoopEntry = (1UL << 0),        # 即将进入runloop
         kCFRunLoopBeforeTimers = (1UL << 1), # 即将处理timer事件
         kCFRunLoopBeforeSources = (1UL << 2),# 即将处理source事件
         kCFRunLoopBeforeWaiting = (1UL << 5),# 即将进入睡眠
         kCFRunLoopAfterWaiting = (1UL << 6), # 被唤醒
         kCFRunLoopExit = (1UL << 7),         # runloop退出
         kCFRunLoopAllActivities = 0x0FFFFFFFU # 所有的状态
         */
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"即将进入runloop");
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"即将处理timer事件");
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"即将处理source事件");
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"即将进入睡眠");
                // 如果发现activity没有工作可以主动派发任务
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"被唤醒");
                break;
            case kCFRunLoopExit:
                NSLog(@"runloop退出");
                break;
                
            default:
                break;
        }
    });
    
    /*
     参数一：要监听哪个runloop
     参数二：观察者
     参数三：运行模式
     */
    CFRunLoopAddObserver(CFRunLoopGetCurrent(),observer, kCFRunLoopDefaultMode);
    // Foudation框架 等价于 Core Foudation框架
    // NSDefaultRunLoopMode == kCFRunLoopDefaultMode
    // NSRunLoopCommonModes == kCFRunLoopCommonModes
    
    /*
     CF的内存管理（Core Foundation）
     凡是带有Create、Copy、Retain等字眼的函数，创建出来的对象，都需要在最后做一次release
     GCD在iOS6.0之后已经纳入到了ARC中，所以我们不需要管了
     */
    //CFRelease(observer);
}


- (void)runClick
{
     NSLog(@"%s, line = %d, %@, %@",__FUNCTION__,__LINE__,[NSThread currentThread],[NSRunLoop currentRunLoop].currentMode);
}


#pragma mark - 查看函数调用栈
- (IBAction)btnClick
{
    NSLog(@"%s, line = %d, %@",__FUNCTION__,__LINE__,[NSThread currentThread]);
}

#pragma mark - 子类重写父类方法
- (NSString *)controllerTitle
{
    return @"Runloop 基本使用";
}


@end


















