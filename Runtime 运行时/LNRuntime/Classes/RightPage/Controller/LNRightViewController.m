/*
 * LNRightViewController.m
 * 简/众_不知名开发者 | https://github.com/CoderLN
 * 
 * 右侧菜单
 */

#import "LNRightViewController.h"
#import "LNMainViewController.h"
#import "SWRevealViewController.h"
#import "LNRunLoopViewController.h"
#import "LNThreadPersistViewController.h"
#import "LNRunloopFixedTaskViewController.h"

// 1.CellID标识
static NSString * const CellID = @"CellID";
@interface LNRightViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation LNRightViewController

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initData];
    [self.view addSubview:self.tableView];
    // 2.Cell注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellID];
}

- (void)initData
{
    _dataArray = @[
                   @"不知名开发者-右侧菜单",
                   @"OC_runloop",
                   @"1、基本使用",
                   @"2、场景：常驻线程",
                   @"3、场景：固定间隔几秒执行任务",
                   ];
}

#pragma mark - 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 3.Cell复用队列 (访问缓存池)
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    // 4.Cell设置数据 (传递模型)
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWRevealViewController *revealVC = self.revealViewController;
    UIViewController *viewController;
    switch (indexPath.row) {
        case 0:
            //演示操作区按钮示例代码, 可以切换成这个类，查看具体效果.
            viewController = [[LNMainViewController alloc] init];
            break;
        case 2:
            viewController = [[LNRunLoopViewController alloc] init];
            break;
        case 3:
            viewController = [[LNThreadPersistViewController alloc] init];
            break;
        case 4:
            viewController = [[LNRunloopFixedTaskViewController alloc] init];
            break;
            
        default:
            return;
            break;
    }
    // 调用pushFrontViewController进行页面切换
    [revealVC pushFrontViewController:viewController animated:YES];
}


#pragma mark - tableView的缩进
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 5;
}

@end





