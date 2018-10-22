/*
 * LNOperateBtn.h
 * Public_不知名开发者 https://github.com/CoderLN，该模块将系统化学习，后续「坚持新增文章，替换、补充文章内容」
 * 自定义控件操作按钮Btn
 */

#import "LNOperateBtn.h"

@implementation LNOperateBtn

// 添加子控件，初始化子控件一次性设置
- (instancetype)initWithFrame:(CGRect)frame withBtnTitle:(NSString *)btnTitle
{
    if (self = [super initWithFrame:frame]) {
        [self setTitle:btnTitle forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:12.f];
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

// 根据传入下标返回操作按钮的frame
+ (CGRect)rectForBtnAtIndex:(NSUInteger)btnAtIndex
{
    // 每行最多显示4个
    NSUInteger maxRowNum = 4;
    // 每个按钮列间距
    CGFloat columnSpacing = 20;
    // 每个按钮行间距
    CGFloat rowSpacing = 20;
    // 每个按钮的宽度
    CGFloat width = (kScreenWidth - columnSpacing *5)/4;
    // 每个按钮的高度
    CGFloat height = 30;
    
    // 每个按钮的偏移量
    CGFloat offsetX = columnSpacing + (width + columnSpacing) * (btnAtIndex % maxRowNum);
    CGFloat offsetY = rowSpacing + (height + rowSpacing) * (btnAtIndex / maxRowNum);
    
    return CGRectMake(offsetX, offsetY, width, height);
}

@end
 

