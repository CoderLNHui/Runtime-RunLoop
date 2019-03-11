/*
 * LNAutoEncode.h
 * 不知名开发者 https://dwz.cn/rC1LGk2f | https://github.com/CoderLN/Runtime-RunLoop
 * 
 * runtime 作用：实现NSCoding的自动归档和解档
 */

//如果是正常写法 .m 文件应该是这样的：
@implementation Movie

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_movieId forKey:@"id"];
    [aCoder encodeObject:_movieName forKey:@"name"];
    [aCoder encodeObject:_pic_url forKey:@"url"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.movieId = [aDecoder decodeObjectForKey:@"id"];
        self.movieName = [aDecoder decodeObjectForKey:@"name"];
        self.pic_url = [aDecoder decodeObjectForKey:@"url"];
    }
    return self;
}
@end


//----------------------- <#<--- 不知名开发者 --->#> ------------------------//
//
//如果这里有100个属性，那么我们也只能把100个属性都给写一遍吗。
//不过你会使用`runtime`后，这里就有更简便的方法，如下。

#import "Movie.h"
#import <objc/runtime.h>
@implementation Movie

- (void)encodeWithCoder:(NSCoder *)encoder

{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([Movie class], &count);
    
    for (int i = 0; i<count; i++) {
        // 取出i位置对应的成员变量
        Ivar ivar = ivars[i];
        // 查看成员变量
        const char *name = ivar_getName(ivar);
        // 归档
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [encoder encodeObject:value forKey:key];
    }
    free(ivars);
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([Movie class], &count);
        for (int i = 0; i<count; i++) {
            // 取出i位置对应的成员变量
            Ivar ivar = ivars[i];
            // 查看成员变量
            const char *name = ivar_getName(ivar);
            // 解档
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [decoder decodeObjectForKey:key];
            // 设置到成员变量身上
            [self setValue:value forKey:key];
            
        }
        free(ivars);
    }
    return self;
}
@end



//----------------------- <#<--- 不知名开发者 --->#> ------------------------//
//
//这样的方式实现，不管有多少个属性，写这几行代码就搞定了。
//下面看看更加简便的方法：两句代码搞定。

#import "Movie.h"
#import <objc/runtime.h>

#define encodeRuntime(A) \
\
unsigned int count = 0;\
Ivar *ivars = class_copyIvarList([A class], &count);\
for (int i = 0; i<count; i++) {\
Ivar ivar = ivars[i];\
const char *name = ivar_getName(ivar);\
NSString *key = [NSString stringWithUTF8String:name];\
id value = [self valueForKey:key];\
[encoder encodeObject:value forKey:key];\
}\
free(ivars);\
\

#define initCoderRuntime(A) \
\
if (self = [super init]) {\
unsigned int count = 0;\
Ivar *ivars = class_copyIvarList([A class], &count);\
for (int i = 0; i<count; i++) {\
Ivar ivar = ivars[i];\
const char *name = ivar_getName(ivar);\
NSString *key = [NSString stringWithUTF8String:name];\
id value = [decoder decodeObjectForKey:key];\
[self setValue:value forKey:key];\
}\
free(ivars);\
}\
return self;\
\

- - -
@implementation Movie
// 归档
- (void)encodeWithCoder:(NSCoder *)encoder {
    encodeRuntime(Movie)
}

// 解档
- (id)initWithCoder:(NSCoder *)decoder {
    initCoderRuntime(Movie)
}
@end


优化：
上面是`encodeWithCoder` 和 `initWithCoder`这两个方法抽成宏。我们可以把这两个宏单独放到一个文件里面，这里以后需要进行数据持久化的模型都可以直接使用这两个宏。

