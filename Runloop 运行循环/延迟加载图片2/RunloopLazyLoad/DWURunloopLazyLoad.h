//
//  DWURunloopLazyLoad.h
//  RunloopLazyLoad
// 
#import <UIKit/UIKit.h>

typedef BOOL(^DWURunloopLazyLoadUnit)(void);

@interface DWURunloopLazyLoad : NSObject

@property (nonatomic, assign) NSUInteger maximumQueueLength;

+ (instancetype)sharedRunloopLazyLoad;

- (void)addTask:(DWURunloopLazyLoadUnit)unit withKey:(id)key;

- (void)removeAllTasks;

@end

@interface UITableViewCell (DWURunloopLazyLoad)

@property (nonatomic, strong) NSIndexPath *currentIndexPath;

@end
