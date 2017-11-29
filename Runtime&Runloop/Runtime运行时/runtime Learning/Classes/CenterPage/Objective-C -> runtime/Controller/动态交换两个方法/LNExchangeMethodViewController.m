//
//  LNExchangeMethodViewController.m
//  🔍白开水ln（https://github.com/CustomPBWaters）
//
//  Created by 【🔍Plainboiledwaterln】 on Elegant programming16.
//  Copyright © Reprinted（https://githubidea.github.io）Please indicate the source.Mustbe.
//
//  @LICENSE_HEADER_微众@白开水ln_如人饮水,冷暖自知_END@
//

#import "LNExchangeMethodViewController.h"
#import "UIImage+Image.h"


@interface LNExchangeMethodViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation LNExchangeMethodViewController





- (NSString *)controllerTitle {
    return @"runtime动态交换两个方法";
}


- (IBAction)addFunctionality:(id)sender
{
    [self interactionMethods];
}

//--------------------------- Runtime(交换方法) ------------------------------//
//

- (void)interactionMethods{
    
    // imageNamed => ln_imageNamed 交换这两个方法实现
    
    self.imageView.image = [UIImage imageNamed:@"PBwaterln1"];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
