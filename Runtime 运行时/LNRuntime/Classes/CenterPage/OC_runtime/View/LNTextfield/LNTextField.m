/*
 * LNTextField.m
 * Public|JShu_不知名开发者 https://github.com/CoderLN
 */

#import "LNTextField.h"
#import "UITextField+TextField.h"
@implementation LNTextField

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.tintColor = [UIColor whiteColor];
    
    [self addTarget:self action:@selector(textBegin) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(textEnd) forControlEvents:UIControlEventEditingDidEnd];

    // 设置文本框占位文字和占位文字颜色
    self.placeholder = @"CoderLN ";
    self.placeholderColor = [UIColor redColor];
}

 
#pragma mark - 文本框开始编辑
- (void)textBegin
{
    // NOTE：方式一：富文本设置文本框占位文字颜色
    //NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    //attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    //[self setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:self.placeholder attributes:attrs]];
    
 
    // NOTE：方式二：KVC设置文本框占位文字颜色
    // 通过对UITextField打断点方式(获取内部label属性名"placeholderLabel")
    //UILabel *placeholderLabel = [self valueForKeyPath:@"placeholderLabel"];
    //placeholderLabel.textColor = [UIColor blueColor];
    
    
    // NOTE：方式三：工具类改进placeholderColor属性,设置文本框占位文字颜色
    //runtime交换方法(修改UITextField的占位文字，且设置文字和文字颜色是无序的)
    self.placeholderColor = [UIColor whiteColor];
}

 
#pragma mark - 文本框结束编辑
- (void)textEnd
{
    // 默认设置文本框占位文字颜色
    self.placeholderColor = [UIColor redColor];
}


@end









