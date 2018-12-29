/*
 * LNAddMethodsViewController.h
 * Public|JShu_不知名开发者 https://github.com/CoderLN
 * Runtime 动态添加方法；[person performSelector:@selector(run:) withObject:@10]
 */


#import "LNBaseViewController.h"

@interface LNAddMethodsViewController : LNBaseViewController

/**
 1、Runtime(动态添加方法)
    OC都是懒加载机制,只要一个方法实现了,就会马上添加到方法列表中.

    下面问题考察的就是，Runtime动态添加方法.
    有没有使用过performSelector,什么时候使用? 动态添加方法的时候使用过? 怎么动态添加方法? 用runtime?
    为什么要动态添加方法?
 */


@end
