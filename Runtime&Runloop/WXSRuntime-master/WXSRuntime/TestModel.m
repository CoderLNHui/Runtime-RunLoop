//
//  TestModel.m
//  WXSRuntime
//
//  Created by 王小树 on 16/4/19.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel


+(void)forTest {


    NSDictionary *dict = @{
                           @"name"  : @"王小树 Alan_iOS",
                           @"title" : @"Model",
                           @"num"   : @(20),
                           @"array" : @[@"1", @"2", @"3"],
                           @"dict"  : @{@"key1" : @"value1", @"key2":@"value2"},
                           @"myUrl" :@"http://www.jianshu.com/p/f73ea068efd2"
                           };
    
    
    TestModel *model = [[TestModel alloc]initWithDic:dict];
    

    NSDictionary *tem = [model modelToDic];
    NSLog(@"%@",tem);

    
    NSString *path = [NSString stringWithFormat:@"%@/archive",NSHomeDirectory()];
    [NSKeyedArchiver archiveRootObject:model toFile:path];
    
    TestModel *otherModel = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    NSLog(@"otherMoel:%@",otherModel.name);
    
}
@end
