/*
 * LNStudent.m
 * 不知名开发者 https://dwz.cn/rC1LGk2f | https://github.com/CoderLN/Runtime-RunLoop
 * 
 */

#import "LNStudent.h"

@interface LNStudent ()
{
    int _weight;// 私有成员变量
}
@end

@implementation LNStudent

/**
 补充: 什么时候重写系统方法
    1.想给系统方法添加额外功能
    2.不想要系统方法实现
 */
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
