//
//  DWURunloopLazyLoad.m
//  RunloopLazyLoad
 

#import "DWURunloopLazyLoad.h"
#import <objc/runtime.h>

#define DWURunloopLazyLoad_DEBUG 1

@interface DWURunloopLazyLoad ()

@property (nonatomic, strong) NSMutableArray *tasks;

@property (nonatomic, strong) NSMutableArray *tasksKeys;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation DWURunloopLazyLoad

- (void)removeAllTasks {
    [self.tasks removeAllObjects];
    [self.tasksKeys removeAllObjects];
}

- (void)addTask:(DWURunloopLazyLoadUnit)unit withKey:(id)key{
    [self.tasks addObject:unit];
    [self.tasksKeys addObject:key];
    if (self.tasks.count > self.maximumQueueLength) {
        [self.tasks removeObjectAtIndex:0];
        [self.tasksKeys removeObjectAtIndex:0];
    }
}

- (void)_timerFiredMethod:(NSTimer *)timer {
    //We do nothing here
}

- (instancetype)init
{
    if ((self = [super init])) {
        _maximumQueueLength = 30;
        _tasks = [NSMutableArray array];
        _tasksKeys = [NSMutableArray array];
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(_timerFiredMethod:) userInfo:nil repeats:YES];
    }
    return self;
}

+ (instancetype)sharedRunloopLazyLoad {
    static DWURunloopLazyLoad *singleton;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        singleton = [[DWURunloopLazyLoad alloc] init];
        [self _registerRunloopLazyLoadAsMainRunloopObserver:singleton];
    });
    return singleton;
}

+ (void)_registerRunloopLazyLoadAsMainRunloopObserver:(DWURunloopLazyLoad *)RunloopLazyLoad {
    static CFRunLoopObserverRef defaultModeObserver;
    _registerObserver(kCFRunLoopBeforeWaiting, defaultModeObserver, NSIntegerMax - 999, kCFRunLoopDefaultMode, (__bridge void *)RunloopLazyLoad, &_defaultModeRunloopLazyLoadCallback);
}

static void _registerObserver(CFOptionFlags activities, CFRunLoopObserverRef observer, CFIndex order, CFStringRef mode, void *info, CFRunLoopObserverCallBack callback) {
    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
    CFRunLoopObserverContext context = {
        0,
        info,
        &CFRetain,
        &CFRelease,
        NULL
    };
    observer = CFRunLoopObserverCreate(     NULL,
                                            activities,
                                            YES,
                                            order,
                                            callback,
                                            &context);
    CFRunLoopAddObserver(runLoop, observer, mode);
    CFRelease(observer);
}

static void _RunloopLazyLoadCallback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info)
{
    DWURunloopLazyLoad *RunloopLazyLoad = (__bridge DWURunloopLazyLoad *)info;
    if (RunloopLazyLoad.tasks.count == 0) {
        return;
    }
    BOOL result = NO;
    while (result == NO && RunloopLazyLoad.tasks.count) {
        DWURunloopLazyLoadUnit unit  = RunloopLazyLoad.tasks.firstObject;
        result = unit();
        [RunloopLazyLoad.tasks removeObjectAtIndex:0];
        [RunloopLazyLoad.tasksKeys removeObjectAtIndex:0];
    }
}

static void _defaultModeRunloopLazyLoadCallback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    _RunloopLazyLoadCallback(observer, activity, info);
}

@end

@implementation UITableViewCell (DWURunloopLazyLoad)



- (NSIndexPath *)currentIndexPath {
    NSIndexPath *indexPath = objc_getAssociatedObject(self, @selector(currentIndexPath));
    return indexPath;
}

- (void)setCurrentIndexPath:(NSIndexPath *)currentIndexPath {
    objc_setAssociatedObject(self, @selector(currentIndexPath), currentIndexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
