/*
 * File:  LNLeftViewController.m
 *
 * About ME『Public：Codeidea / https://githubidea.github.io』.
 * Copyright © All members (Star|Fork) have the right to read and write『https://github.com/CoderLN/Runtime-RunLoop』.
 *
 * 🏃🏻‍♂️ ◕该模块将系统化学习，后续替换、补充文章内容 ~
 *
 *【左侧菜单】
 */

#import "LNLeftViewController.h"
#import "LNMainViewController.h"
#import "RuntimeDictViewController.h"
#import "LNMessageViewController.h"
#import "LNExchangeMethodViewController.h"
#import "LNAddAttributesViewController.h"
#import "LNAddMethodsViewController.h"
#import "LNDictViewController.h"


#define CellID @"cellID"
@interface LNLeftViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation LNLeftViewController

- (UITableView *)tableView
{
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight - 20) style:UITableViewStylePlain];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initData];
    
    // cell注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellID];
}

- (void)initData {

    _dataArray = @[
                   @"我是左侧菜单",
                   @"OC -> runtime",
                   @"1、字典转模型",// case 2
                   @"2、消息机制",// case 3
                   @"3、动态交换两个方法实现",// case 4
                   @"3.1 给imageNamed添加功能",
                   @"3.1 UITextField占位文字颜色",
                   @"3.1 交换dealloc方法实现",
                   @"4、动态添加属性",// case 8
                   @"5、动态添加方法",// case 9
                   @"6、字典转模型KVC实现",// case 10
                   @"7、拦截并替换方法",
                   @"8、实现NSCoding自动归档和解档",
                   @"Swift -> runtime",// case 13
                   ];
}


#pragma mark - 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectRow = %ld",indexPath.row);
    
    SWRevealViewController *revealVC = self.revealViewController;
    UIViewController *viewController;
    switch (indexPath.row) {
        //Objective-C -> runtime（后续下载阅读）
        case 0:
            viewController = [[LNMainViewController alloc] init];
            break;
        case 2:
            viewController = [[RuntimeDictViewController alloc] init];
            break;
        case 3:
            viewController = [[LNMessageViewController alloc] init];
            break;
        case 4:
            viewController = [[LNExchangeMethodViewController alloc] init];
            break;
        case 8:
            viewController = [[LNAddAttributesViewController alloc] init];
            break;
        case 9:
            viewController = [[LNAddMethodsViewController alloc] init];
            break;
        case 10:
            viewController = [[LNDictViewController alloc] init];
            break;
            
            
        //Swift -> runtime（欢迎后续下载阅读）
        case 13:
            viewController = [[LNMainViewController alloc] init];
            break;
            
        default:
            return;
            break;
    }
    // 调用pushFrontViewController进行页面切换
    [revealVC pushFrontViewController:viewController animated:YES];
    
   
}
@end


















