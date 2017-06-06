//
//  LNExchangeMethodViewController.m
//  runtime Learning
//
//  Created by LN on 17/2/18.
//  Copyright © 2017年 Learning point. All rights reserved.
//

#import "LNExchangeMethodViewController.h"
#import "UIImage+Image.h"


@interface LNExchangeMethodViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation LNExchangeMethodViewController

- (NSString *)controllerTitle {
    return @"Runtime动态交换两个方法";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self interactionMethods];
}


//--------------------------- Runtime(交换方法) ------------------------------//
//

- (void)interactionMethods{
    
    // imageNamed => ln_imageNamed 交互这两个方法实现
    
    self.imageView.image = [UIImage imageNamed:@"https:custompbwaters.github.io"];
}

@end
