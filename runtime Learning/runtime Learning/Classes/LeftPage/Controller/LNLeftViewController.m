//
//  LNLeftViewController.m
//  🔍白开水ln（https://github.com/CustomPBWaters）
//
//  Created by 【🔍Plain Boiled Water ln】 on Elegant programming16.
//  Copyright © Unauthorized shall（https://githubidea.github.io）not be reproduced reprinted.
//
//  @PBWLN_LICENSE_HEADER_END@
//

#import "LNLeftViewController.h"
#import "LNMainViewController.h"
#import "RuntimeDictViewController.h"
#import "LNMessageViewController.h"
#import "LNExchangeMethodViewController.h"
#import "LNAddAttributesViewController.h"
#import "LNAddMethodsViewController.h"



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
    _dataArray = [NSArray arrayWithObjects:@"我是左侧菜单",@"☕️Objective-C -> runtime",@"runtime 字典转模型",@"runtime消息机制",@"runtime动态交换两个方法实现",@"runtime动态添加属性",@"runtime动态添加方法",@"Runtime字典转模型KVC实现",@"拦截并替换方法",@"实现NSCoding自动归档和解档",@"☕️Swift -> runtime（待）",@"runtime 字典转模型",@"runtime消息机制",@"runtime动态交换两个方法实现",@"runtime动态添加属性",@"runtime动态添加方法",@"Runtime字典转模型KVC实现",@"拦截并替换方法",@"实现NSCoding自动归档和解档", nil];
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
    SWRevealViewController *revealVC = self.revealViewController;
    UIViewController *viewController;
    switch (indexPath.row) {
        //Objective-C -> runtime 续更场景（欢迎后续下载阅读）
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
        case 5:
            viewController = [[LNAddAttributesViewController alloc] init];
            break;
        case 6:
            viewController = [[LNAddMethodsViewController alloc] init];
            break;
     
        //Swift -> runtime 待总结（欢迎后续下载阅读）
        case 8:
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


















