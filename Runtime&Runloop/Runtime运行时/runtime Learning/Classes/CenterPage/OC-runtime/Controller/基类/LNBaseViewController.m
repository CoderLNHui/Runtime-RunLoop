/*
 * File:  LNBaseViewController.m
 *
 * Public - CoderLN / https://githubidea.github.io / https://github.com/CoderLN
 * 🏃🏻‍♂️ ◕该模块将系统化学习，后续替换、补充文章内容 ~
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
        _imageV = [[UIImageView alloc] init];
        _imageV.frame = CGRectMake(0, 0, 300, 400);
        _imageV.center = self.view.center;
        _imageV.image = [UIImage imageNamed:@"CoderLN300x400"];
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


@end





















