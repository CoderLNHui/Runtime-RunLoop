/*
 * File:  LNDictViewController.m
 *
 * Public - CoderLN / https://githubidea.github.io / https://github.com/CoderLN
 * 🏃🏻‍♂️ ◕该模块将系统化学习，后续替换、补充文章内容 ~
 *
 *【KVC 字典转模型】
 */

#import "LNDictViewController.h"
#import "LNStudent.h"
#import "LNDog.h"

@interface LNDictViewController ()

@end

@implementation LNDictViewController

//--------------------------- 【KVC 字典转模型 - 模型转字典】 ------------------------------//
//

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    NSDictionary *dictMode = @{
                               @"name" :@"WeChat-Codeidea",
                               @"age" : @25,
                               @"coder" : @"iOS" // -->问题1:模型的属性和字典不能一一对应
                               /*
                                @"dog" : @{
                                    @"nameDog" : @"wangcai",
                                    @"money" : @8
                                },
                                */ //-->问题2:模型中嵌套模型
                               };
    
    LNStudent *student = [[LNStudent alloc] init];
    student.dog = [[LNDog alloc] init];
    [student setValuesForKeysWithDictionary:dictMode];
    NSLog(@"KVC字典转模型: %@ ,%ld",student.name,student.age);
    
    // 访问私有成员变量
    [student setValue:@110 forKeyPath:@"weight"];
    [student.dog setValue:@6 forKeyPath:@"dogAge"];
    
    NSDictionary *modeDict = [student dictionaryWithValuesForKeys:@[@"name", @"age"]];
    NSLog(@"KVC模型转字典: %@",modeDict);
    
    /**
     2016-06-10 14:45:06.270303+0800 KVCKVO[10781:289524] 白开水ln ,25
     2016-06-10 14:45:06.270699+0800 KVCKVO[10781:289524] {
         age = 25;
         name = "\U767d\U5f00\U6c34ln";
     }
     */
}





/**
 问题1:模型的属性和字典不能一一对应,会报以下错误
    1.reason: '[<Student 0x600000230220> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key coder.'
 
 解决:重写系统方法
    -(void)setValue:(id)value forUndefinedKey:(NSString *)key
 
 补充: 什么时候重写系统方法
    1.想给系统方法添加额外功能；2.不想要系统方法实现
 */



/**
 问题2:模型中嵌套模型
    如果模型中带有模型型，setValuesForKeysWithDictionary 不能用。
 
 解决：思路 - 拿到每一个模型属性，去字典中取出对应的值，给模型赋值（提醒：从字典中取值,不一定要全部取出来）。
 建议使用：MJExtension 字典转模型 和 Runtime（根据模型中属性，去字典中取出对应的 value 给模型属性赋值）
 */


/**
 3、KVC实现原理
     1、[item setValue:@"白开水ln" forKey:@"name"];
        1.首先去模型中查找该对应的key值有没有set方法，若有就会自动调用set方法进行赋值 [self setName:@"白开水ln"]。
        2.如果没有set方法,那么它就判断有没有key相同名称并且带有下划线的成员变量,如果就就给该属性赋值 _name = value.
        3.如果没有带有下划线的成员变量,那么它就会查看有没有跟key值相同名称的属性,如果有就给该属性赋值 name = value.
        4.如果还找不到,就会直接报找不到的错误 ('setValue:forUndefinedKey`).
 
    2、setValuesForKeysWithDictionary:底层原理:
 
        // 1.遍历字典中所有key,去模型中查找有没有对应的属性
        [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {
             // 2.去模型中查找有没有对应属性 KVC
             [item setValue:value forKey:key];
        }];
 */



@end
