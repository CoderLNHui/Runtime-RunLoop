//
//  DWURunLoopWorkDistribution.h
//  RunLoopWorkDistribution
//
/** 【本Demo为转载】 */

#import <UIKit/UIKit.h>

typedef BOOL(^DWURunLoopWorkDistributionUnit)(void);

@interface DWURunLoopWorkDistribution : NSObject

@property (nonatomic, assign) NSUInteger maximumQueueLength;

+ (instancetype)sharedRunLoopWorkDistribution;

- (void)addTask:(DWURunLoopWorkDistributionUnit)unit withKey:(id)key;

- (void)removeAllTasks;

@end

@interface UITableViewCell (DWURunLoopWorkDistribution)

@property (nonatomic, strong) NSIndexPath *currentIndexPath;

@end
