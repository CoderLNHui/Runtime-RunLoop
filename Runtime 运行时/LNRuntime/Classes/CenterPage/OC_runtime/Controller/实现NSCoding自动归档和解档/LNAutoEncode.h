/*
 * LNAutoEncode.h
 * 简/众_不知名开发者 | https://github.com/CoderLN
 * 
 * runtime 作用：实现NSCoding的自动归档和解档
 */

//如果你实现过自定义模型数据持久化的过程，那么你也肯定明白，如果一个模型有许多个属性，那么我们需要对每个属性都实现一遍`encodeObject` 和 `decodeObjectForKey`方法，如果这样的模型又有很多个，这还真的是一个十分麻烦的事情。下面来看看简单的实现方式。

//假设现在有一个`Movie`类，有3个属性。先看下 .h文件
//1. 如果想要当前类可以实现归档与反归档，需要遵守一个协议NSCoding
@interface Movie : NSObject<NSCoding>

@property (nonatomic, copy) NSString *movieId;
@property (nonatomic, copy) NSString *movieName;
@property (nonatomic, copy) NSString *pic_url;

@end





