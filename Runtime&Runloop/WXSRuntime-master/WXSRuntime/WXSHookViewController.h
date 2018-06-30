//
//  WXSHookViewController.h
//  WXSRuntime
//
//  Created by 王小树 on 16/4/20.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <objc/message.h>

@interface WXSHookViewController : UIViewController
- (void)wxs_viewWillAppear:(BOOL)animated;

@end
