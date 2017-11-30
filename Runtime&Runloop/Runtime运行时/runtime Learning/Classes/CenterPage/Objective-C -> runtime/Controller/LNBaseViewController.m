/*
 * File:  LNBaseViewController.m
 * Author:  白开水ln（https://github.com/CustomPBWaters）
 *
 * Created by 【WechatPublic-Codeidea】 on Elegant programming16.
 * Copyright © Reprinted（https://githubidea.github.io）Please indicate the source.Mustbe.
 *
 * JaneBook:  http://www.jianshu.com/u/fd745d76c816
 *
 * @HEADER_WELCOME YOU TO JOIN_GitHub & Codeidea_END@
 *
 *【基类】
 */

#import "LNBaseViewController.h"
#import "SWRevealViewController.h"

@interface LNBaseViewController ()

/** 按钮操作区的数组元素 */
@property (nonatomic, strong) NSArray *operateTitleArray;

@end

@implementation LNBaseViewController

- (UIImageView *)imageV {
    if (!_imageV) {
        _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2 -100, kScreenHeight/2 - 110, 200, 220)];
        _imageV.image = [UIImage imageNamed:@"PBwaterln"];
        _imageV.layer.cornerRadius = 10;
        _imageV.layer.masksToBounds = YES;
        _imageV.backgroundColor = [UIColor redColor];
        _imageV.userInteractionEnabled = YES;
    }
    return _imageV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initView];
    [self initData];
}

- (void)initData {
    _operateTitleArray = [self operateTitleArray];
}


- (void)initView {
    UIView *navBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    navBarView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:navBarView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth, 40)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text = [self controllerTitle];
    titleLabel.font = [UIFont systemFontOfSize:18.f];
    [navBarView addSubview:titleLabel];
    
    
    if (self.operateTitleArray && self.operateTitleArray.count > 0) {
        // 按钮行数
        NSUInteger row = self.operateTitleArray.count%4 == 0 ? self.operateTitleArray.count/4 : self.operateTitleArray.count/4 +1;
        // 按钮区背景的大小
        UIView *operateView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - (row *50 +20), kScreenWidth, row *50 +20)];
        operateView.backgroundColor = [UIColor redColor];
        [self.view addSubview:operateView];
        
        for (int i= 0; i < self.operateTitleArray.count; i++) {
            LNOperateBtn *btn = [[LNOperateBtn alloc] initWithFrame:[LNOperateBtn rectForBtnAtIndex:i] withBtnTitle:[self.operateTitleArray objectAtIndex:i]];
            btn.tag = i;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.backgroundColor = [UIColor blueColor];
            [operateView addSubview:btn];
        }
    }
    
    SWRevealViewController *revealVC = self.revealViewController;
    // 添加手势,可以执行滑动切换
    [self.view addGestureRecognizer:revealVC.panGestureRecognizer];
    [self.view addGestureRecognizer:revealVC.tapGestureRecognizer];

}

//- (NSArray *)operateTitleArray {
//    return [NSArray arrayWithObjects:@"暂无数据", nil];
//}

- (void)btnClick:(UIButton *)btn {
    
}

-(NSString *)controllerTitle{
    return @"默认标题";
}


// 截取字符串(延迟执行,弹框提示用户登录请求结果)
- (void)showWithResult:(NSString *)result {
    
    NSUInteger loc = [result rangeOfString:@":\""].location + 2;
    NSUInteger len =  [result rangeOfString:@"\"}"].location - loc;
    NSString *msg = [result substringWithRange:NSMakeRange(loc, len)];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([result containsString:@"error"]) {
            [SVProgressHUD showErrorWithStatus:msg];
        }else {
            [SVProgressHUD showSuccessWithStatus:msg];
        }
    });
    NSLog(@"\n%@",[NSThread currentThread]);
}

@end





















