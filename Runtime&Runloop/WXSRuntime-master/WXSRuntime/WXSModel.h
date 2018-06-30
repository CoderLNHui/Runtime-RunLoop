//
//  WXSModel.h
//  WXSRuntime
//
//  Created by 王小树 on 16/4/18.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <objc/runtime.h>
#import <objc/message.h>

@interface WXSModel : NSObject <NSCoding>

-(instancetype)init UNAVAILABLE_ATTRIBUTE;
-(instancetype)initWithDic:(NSDictionary *)dict;

-(void)creatModelWithDic:(NSDictionary *)dict ;


-(NSDictionary *)modelToDic;

@end
