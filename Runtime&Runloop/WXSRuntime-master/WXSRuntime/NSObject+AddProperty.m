//
//  NSObject+AddProperty.m
//  WXSRuntime
//
//  Created by 王小树 on 16/4/21.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import "NSObject+AddProperty.h"

static const void *WXSAddPropertyKeyTitle = @"WXSAddPropertyKeyTitle";
static const void *WXSAddPropertyKeyTestBlock = @"WXSAddPropertyKeyTestBlock";
@implementation NSObject (AddProperty)

-(void)setWxsTitle:(NSString *)wxsTitle {
    objc_setAssociatedObject(self, WXSAddPropertyKeyTitle, wxsTitle, OBJC_ASSOCIATION_RETAIN);
}
-(NSString *)wxsTitle {
    return objc_getAssociatedObject(self, WXSAddPropertyKeyTitle);
}


-(void)setTestBlock:(TestBlock)testBlock {
    objc_setAssociatedObject(self, WXSAddPropertyKeyTestBlock, testBlock, OBJC_ASSOCIATION_COPY);
}
-(TestBlock)testBlock {
    return  objc_getAssociatedObject(self, WXSAddPropertyKeyTestBlock);
}

+(void)logforTest {
    NSString *str = @"s";
    str.testBlock  = ^() {
        NSLog(@"这是block");
    };
    str.testBlock();
    
    [str setWxsTitle:@"类别title"];
    NSLog(@"-----%@",str.wxsTitle);
    
}
@end
