//
//  LNExchangeMethodViewController.m
//  🔍白开水ln（https://github.com/CustomPBWaters）
//
//  Created by 【🔍Plain Boiled Water ln】 on Elegant programming16.
//  Copyright © Unauthorized shall（https://custompbwaters.github.io）not be reproduced reprinted.
//
//  @PBWLN_LICENSE_HEADER_END@
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
