//
//  TestModel.h
//  WXSRuntime
//
//  Created by 王小树 on 16/4/19.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import "WXSModel.h"

@interface TestModel : WXSModel

@property (nonatomic,strong) NSString *myUrl;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSDictionary *dict;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSDictionary *testNil;
@property (nonatomic,assign) NSInteger num;
@property (nonatomic,strong) NSArray *array;
@property (nonatomic,strong) NSNumber *number;





+(void)forTest;

@end
