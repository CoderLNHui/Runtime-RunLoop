/*
 * File:  RuntimeDictViewController.m
 *
 * Public、简书 - 不知名开发者 / https://github.com/CoderLN
 * 该模块将系统化学习，后续「替换、补充文章内容 或 新增文章」
 *
 *【Runtime 字典转模型】
 */

#import "RuntimeDictViewController.h"
#import "StatusItem.h"
#import "NSObject+Model.h"
//
#import "StatusItem2.h"
#import "NSObject+Mod.h"

#import "StatusItem3.h"
#import "NSObject+Item.h"

@interface RuntimeDictViewController ()

@end

@implementation RuntimeDictViewController

- (NSString *)controllerTitle {
    return @"Runtime字典转模型三种场景";
}

- (NSDictionary *)parsingWithFile:(NSString *)str{
    // 获取Plist文件
    NSString *filePath = [[NSBundle mainBundle] pathForResource:str ofType:nil];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return dict;
}


//--------------------------- <#我是分割线#> ------------------------------//
//

// 场景一：字典的key和模型的属性不匹配「模型属性数量大于字典键值对数」，这种情况处理如下：
- (IBAction)runtimeBtnClick1:(id)sender {

    StatusItem *item = [StatusItem modelWithDict:[self parsingWithFile:@"status1.plist"]];
    NSLog(@"%@",item);
}





//--------------------------- <#我是分割线#> ------------------------------//
//

// 场景二：模型中嵌套模型「模型属性是另外一个模型对象」，这种情况处理如下：
- (IBAction)runtimeBtnClick2:(id)sender {

    StatusItem2 *item = [StatusItem2 modelWithDict2:[self parsingWithFile:@"status2.plist"]];
    NSLog(@"%@--%@",item,item.user);
}





//--------------------------- <#我是分割线#> ------------------------------//
//

// 场景三：数组中装着模型「模型的属性是一个数组，数组中是字典模型对象」，这种情况处理如下：
- (IBAction)runtimeBtnClick3:(id)sender {

    StatusItem3 *item = [StatusItem3 modelWithDict3:[self parsingWithFile:@"status3.plist"]];
    NSLog(@"%@",item);
}




@end






























