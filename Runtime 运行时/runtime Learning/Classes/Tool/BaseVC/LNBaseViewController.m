/*
 * LNBaseViewController.m
 *「Public_不知名开发者 | https://github.com/CoderLN | https://www.jianshu.com/u/fd745d76c816」
 *
 * 各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」.
 *
 * 基类
 */


#import "LNBaseViewController.h"
#import "SWRevealViewController.h"

@interface LNBaseViewController ()
@property (nonatomic, strong) NSArray *operateTitleArray;// 按钮操作区的数组元素
@end

@implementation LNBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1.0];
    
    self.operateTitleArray = [self operateTitleArray];
    
    [self initView];
}

#pragma mark - 初始化UI
- (void)initView
{
    // 导航View
    UIView *navBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    navBarView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:navBarView];
    
    // 导航View中间标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth, 40)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text = [self controllerTitle];
    titleLabel.font = [UIFont systemFontOfSize:18.f];
    [navBarView addSubview:titleLabel];
    
    // 底部操作按钮
    if (self.operateTitleArray && self.operateTitleArray.count > 0) {
        // 按钮行数
        NSUInteger row = self.operateTitleArray.count%4 == 0 ? self.operateTitleArray.count/4 : self.operateTitleArray.count/4 +1;
        // 按钮区背景的大小
        UIView *operateView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - (row *50 +20), kScreenWidth, row *50 +20)];
        operateView.backgroundColor = [UIColor cyanColor];
        [self.view addSubview:operateView];
        
        for (int i= 0; i < self.operateTitleArray.count; i++) {
            LNOperateBtn *btn = [[LNOperateBtn alloc] initWithFrame:[LNOperateBtn rectForBtnAtIndex:i] withBtnTitle:[self.operateTitleArray objectAtIndex:i]];
            btn.tag = i;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.backgroundColor = [UIColor lightGrayColor];
            [operateView addSubview:btn];
        }
    }
    
    // 三方库
    SWRevealViewController *revealVC = self.revealViewController;
    // 添加手势,可以执行滑动切换
    [self.view addGestureRecognizer:revealVC.panGestureRecognizer];
    [self.view addGestureRecognizer:revealVC.tapGestureRecognizer];
}


#pragma mark - 抽取方法,子类可重写实现
-(NSString *)controllerTitle
{
    return @"学习分解";// 默认标题
}

- (NSArray *)operateTitleArray
{
    return nil;
}

- (void)btnClick:(UIButton *)btn
{
    
}

@end
