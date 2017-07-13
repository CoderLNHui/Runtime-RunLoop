//
//  LNRightViewController.m
//  🔍白开水ln（https://github.com/CustomPBWaters）
//
//  Created by 【🔍Plain Boiled Water ln】 on Elegant programming16.
//  Copyright © Unauthorized shall（https://custompbwaters.github.io）not be reproduced reprinted.
//
//  @PBWLN_LICENSE_HEADER_END@
//

#import "LNRightViewController.h"
#import "LNMainViewController.h"

#define CellID @"cellID"
@interface LNRightViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation LNRightViewController

- (UITableView *)tableView
{
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
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
    //self.automaticallyAdjustsScrollViewInsets = NO;

    [self initData];

    // cell注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellID];                      
}

- (void)initData {
    _dataArray = [NSArray arrayWithObjects:@"我是右侧菜单",@"runloop实战场景", nil];
}

#pragma mark - 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    
    cell.textLabel.text = self.dataArray[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SWRevealViewController *revealVC = self.revealViewController;
    UIViewController *viewController;
    switch (indexPath.row) {
        case 0:
            viewController = [[LNMainViewController alloc] init];
            break;
        case 1:
            //【runloop实战场景文章在我的简书，你的 「Star & Fork」 是对我最大的赞赏 ！】
            viewController = [[LNMainViewController alloc] init];
            break;
            
        default:
            break;
    }
    // 调用pushFrontViewController进行页面切换
    [revealVC pushFrontViewController:viewController animated:YES];
}

#pragma mark - tableView的缩进
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 7;
}

@end
