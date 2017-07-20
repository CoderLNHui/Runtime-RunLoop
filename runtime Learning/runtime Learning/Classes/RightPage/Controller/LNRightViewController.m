//
//  LNRightViewController.m
//  🔍白开水ln（https://github.com/CustomPBWaters）
//
//  Created by 【🔍Plain Boiled Water ln】 on Elegant programming16.
//  Copyright © Unauthorized shall（https://githubidea.github.io）not be reproduced reprinted.
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
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight -20) style:UITableViewStylePlain];
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
    _dataArray = @[
                   @"我是右侧菜单",
                   @"☕️Objective-C -> runloop（待）",
                   @"runloop1",
                   @"runloop2",
                   @"runloop3",
                   @"☕️Swift -> runloop（待）",
                   @"runloop1",
                   @"runloop2",
                   @"runloop3",
                   ];
    
    
    
    [NSArray arrayWithObjects:@"我是右侧菜单",@"☕️Objective-C -> runloop（待）",@"runloop1",@"runloop2",@"runloop3",@"☕️Swift -> runloop（待）",@"runloop1",@"runloop2",@"runloop3", nil];
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
        //Objective-C -> runloop 待总结（欢迎后续下载阅读）
        case 0:
            viewController = [[LNMainViewController alloc] init];
            break;
            
            
        //Swift -> runloop 待总结（欢迎后续下载阅读）
        case 2:
            viewController = [[LNMainViewController alloc] init];
            break;
            

        default:
            return;
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
