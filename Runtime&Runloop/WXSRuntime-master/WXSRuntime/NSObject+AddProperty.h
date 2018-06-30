//
//  NSObject+AddProperty.h
//  WXSRuntime
//
//  Created by 王小树 on 16/4/21.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

typedef  void(^TestBlock)();
@interface NSObject (AddProperty)

@property (nonatomic,strong) NSString *wxsTitle;
@property (nonatomic,copy) TestBlock testBlock;

+(void)logforTest;

@end
