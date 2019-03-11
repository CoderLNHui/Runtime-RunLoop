/*
 * runtimeDictViewController.m
 * 不知名开发者 https://dwz.cn/rC1LGk2f | https://github.com/CoderLN/Runtime-RunLoop
 * 
 */

#import "RuntimeDictViewController.h"
//
#import "StatusItem1.h"
#import "NSObject+Model1.h"
//
#import "StatusItem2.h"
#import "NSObject+Model2.h"
//
#import "StatusItem3.h"
#import "NSObject+Model3.h"

@interface runtimeDictViewController ()

@end

@implementation runtimeDictViewController

- (NSDictionary *)parsingWithFile:(NSString *)str
{
    // 获取Plist文件
    NSString *filePath = [[NSBundle mainBundle] pathForResource:str ofType:nil];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return dict;
}


//--------------------------- <#我是分割线#> ------------------------------//
//
#pragma mark -
#pragma mark - 场景一：字典的key和模型的属性不匹配「模型属性数量大于字典键值对数」，这种情况处理如下：
- (IBAction)runtimeBtnClick1:(id)sender
{
    StatusItem1 *item = [StatusItem1 modelWithDict:[self parsingWithFile:@"status1.plist"]];
    NSLog(@"%@",item);
}





//--------------------------- <#我是分割线#> ------------------------------//
//

#pragma mark - 场景二：模型中嵌套模型「模型属性是另外一个模型对象」，这种情况处理如下：
- (IBAction)runtimeBtnClick2:(id)sender
{
    StatusItem2 *item = [StatusItem2 modelWithDict2:[self parsingWithFile:@"status2.plist"]];
    NSLog(@"%@--%@",item,item.user);
}





//--------------------------- <#我是分割线#> ------------------------------//
//

#pragma mark - 场景三：数组中装着模型「模型的属性是一个数组，数组中是字典模型对象」，这种情况处理如下：
- (IBAction)runtimeBtnClick3:(id)sender
{
    StatusItem3 *item = [StatusItem3 modelWithDict3:[self parsingWithFile:@"status3.plist"]];
    NSLog(@"%@",item);
}

#pragma mark - 子类可重写实现
- (NSString *)controllerTitle
{
    return @"runtime字典转模型三种场景";
}


@end






























