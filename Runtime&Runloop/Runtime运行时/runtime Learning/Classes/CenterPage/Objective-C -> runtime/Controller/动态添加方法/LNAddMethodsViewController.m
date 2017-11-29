//
//  LNAddMethodsViewController.m
//  🔍白开水ln（https://github.com/CustomPBWaters）
//
//  Created by 【🔍Plainboiledwaterln】 on Elegant programming16.
//  Copyright © Reprinted（https://githubidea.github.io）Please indicate the source.Mustbe.
//
//  @LICENSE_HEADER_微众@白开水ln_如人饮水,冷暖自知_END@
//

#import "LNAddMethodsViewController.h"
#import "Person.h"

@interface LNAddMethodsViewController ()

@end

@implementation LNAddMethodsViewController

- (NSString *)controllerTitle {
    return @"Runtime动态添加方法";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self addMethods];
}

//--------------------------- Runtime(动态添加方法) ------------------------------//
//

- (void)addMethods {
    //    _cmd:当前方法的方法编号
    
    Person *p = [[Person alloc] init];
    
    // 执行某个方法
    //    [p performSelector:@selector(eat)];
    
    [p performSelector:@selector(run:) withObject:@10];
}

@end
