//
//  LNMainViewController.m
//  runtime Learning
//
//  Created by LN on 17/3/18.
//  Copyright © 2017年 Learning point. All rights reserved.
//

#import "LNMainViewController.h"

@interface LNMainViewController ()

@end

@implementation LNMainViewController

- (NSString *)controllerTitle {
    return @"Learning point";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.imageV];
}

@end
