/*
 * LNAddMethodsViewController.h
 *「Public_不知名开发者 | https://github.com/CoderLN | https://www.jianshu.com/u/fd745d76c816」
 *
 * 各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」.
 *
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
