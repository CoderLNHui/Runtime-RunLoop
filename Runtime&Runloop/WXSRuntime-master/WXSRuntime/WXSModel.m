//
//  WXSModel.m
//  WXSRuntime
//
//  Created by 王小树 on 16/4/18.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import "WXSModel.h"

@implementation WXSModel


-(instancetype)initWithDic:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self creatModelWithDic:dict];
    }
    return self;
}


-(void)creatModelWithDic:(NSDictionary *)dict {
    
//    for (NSString *key in dict) {
//        
//        SEL setterSel = [self creatSetterWithKey:key];
//        id value = dict[key];
//        
//        if (setterSel != nil) {
//            ((void (*)(id,SEL,id))objc_msgSend)(self,setterSel,value);
//        }
//    }
//    
    
    
//    unsigned int outCount = 0;
//    Ivar *ivars = class_copyIvarList(self.class, &outCount);
//    for (int i = 0; i < outCount; i++) {
//        
//        Ivar ivar = ivars[i];
//        const char *typeC = ivar_getTypeEncoding(ivar);
//        NSString *type = [NSString stringWithUTF8String:typeC];
//        
//        const char *nameC = ivar_getName(ivar);
//        NSString *name = [NSString stringWithUTF8String:nameC];
//        NSLog(@"type %@ name %@",type,name);
//        
//    }
    
    
    unsigned int outCount = 0;
    objc_property_t *properties = class_copyPropertyList(self.class, &outCount);
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propertyName = property_getName(property);
        NSString *key = [NSString stringWithUTF8String:propertyName];
        
        id value = nil;
        
        if (![dict[key] isKindOfClass:[NSNull class]]) {
            value = dict[key];
        }
    
        unsigned int count = 0;
        objc_property_attribute_t *atts =  property_copyAttributeList(property, &count);
        objc_property_attribute_t att = atts[0];
        NSString *type = [NSString stringWithUTF8String:att.value];
        type = [type stringByReplacingOccurrencesOfString:@"“" withString:@""];
        type = [type stringByReplacingOccurrencesOfString:@"@" withString:@""];
        
        NSLog(@"type%@",type);
        
        //数据为数组时
        if ([value isKindOfClass:[NSArray class]]) {
            Class class = NSClassFromString(key);
            NSMutableArray *temArr = [[NSMutableArray alloc] init];
            for (NSDictionary *tempDic in value) {
                if (class) {
                    id model = [[class alloc] initWithDic:tempDic];
                    [temArr addObject:model];
                }
            }
            value = temArr;
        }
        
        //数据为字典时
        if ([value isKindOfClass:[NSDictionary class]] && ![type hasPrefix:@"NS"] ) {
            Class class = NSClassFromString(key);
            if (class) {
                value = [[class alloc] initWithDic:value];
            }

        }
        
//        赋值
        SEL setterSel = [self creatSetterWithKey:key];
        if (setterSel != nil) {
            ((void (*)(id,SEL,id))objc_msgSend)(self,setterSel,value);
        }
    
    }
}

-(NSDictionary *)modelToDic {
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    unsigned int outCount = 0;
    objc_property_t *properties = class_copyPropertyList(self.class, &outCount);
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *pName = property_getName(property);
        NSString *key = [NSString stringWithUTF8String:pName];
        
        SEL getter = [self creatGetterWithKey:key];
        
        if (getter) {
            
            //有几种方式获得value
            
//            id value = [self performSelector:getter];

//            id value = [self valueForKey:key];
            
            
//            NSMethodSignature *signature = [self methodSignatureForSelector:getter];
//            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
//            [invocation setSelector:getter];
//            [invocation invokeWithTarget:self];
//            __unsafe_unretained NSObject *value = nil;
//            [invocation getReturnValue:&value];
            
            
            id value = ((id (*)(id,SEL))objc_msgSend)(self,getter);
            
            if (value == nil) {
            
                unsigned int outCount = 0;
                
                objc_property_attribute_t *attributes = property_copyAttributeList(property, &outCount);
                for (int i = 0; i <outCount; i++) {
                    
                    objc_property_attribute_t att = attributes[i];
                    NSString *attValue = [NSString stringWithUTF8String:att.value];
                    
                    if ([attValue isEqualToString:@"@\"NSDictionary\""]) {//字典
                        NSLog(@"key %@ is NSDictionary but nil",key);
                        value = [[NSDictionary alloc] init];
                    }
                    if ([attValue isEqualToString:@"@\"NSString\""]) {
                        NSLog(@"key %@ is NSString but nil",key);
                        value = @"";
                    }
            
                    if ([attValue isEqualToString:@"@\"NSInteger\""]) {
                        NSLog(@"key %@ is NSInteger but nil",key);
                        value = 0;
                    }
                    
                    if ([attValue isEqualToString:@"@\"NSArray\""]) {
                        NSLog(@"key %@ is NSArray but nil",key);
                        value = @[];
                    }
                }
                
            }
            
            [dic setValue:value forKey:key];
        }
        
    }
    
    free(properties);
    
    return dic;
    
}
#pragma mark NSCoding

//解码后赋值
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
    
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList(self.class, &outCount);
        for (int i = 0; i<  outCount; i++) {
            Ivar ivar = ivars[i];
            const char *ivarName = ivar_getName(ivar);
            NSString *ivarNameStr = [NSString stringWithUTF8String:ivarName];
            NSString *setterName = [ivarNameStr substringFromIndex:1];
            
            //解码
            id obj = [aDecoder decodeObjectForKey:setterName]; //要注意key与编码的key是一致的
            SEL setterSel = [self creatSetterWithKey:setterName];
            if (obj) {
                ((void (*)(id ,SEL ,id))objc_msgSend)(self,setterSel,obj);
            }
            

        }
        free(ivars);
    }
    return self;
}
//取值后编码
-(void)encodeWithCoder:(NSCoder *)aCoder {
    
    unsigned int outCount = 0;
    Ivar *ivarList = class_copyIvarList(self.class,&outCount);
    for (int i = 0; i< outCount; i++) {
        Ivar ivar = ivarList[i];
        const char *name = ivar_getName(ivar);
        
//        const char *type = ivar_getTypeEncoding(ivar);//可以获取type ，根据type 编码
        
        NSString *ivarName = [NSString stringWithUTF8String:name];
        NSString *getterName = [ivarName substringFromIndex:1];
        
        SEL getterSel = [self creatGetterWithKey:getterName];
        
        id value = ((id (*)(id,SEL))objc_msgSend)(self,getterSel);
        if (value != nil) {
            [aCoder encodeObject:value forKey:getterName]; 
        }
    }
    free(ivarList);
    
}

#pragma mark Private Method
-(SEL)creatSetterWithKey:(NSString *)key {
    NSString *selStr = [NSString stringWithFormat:@"set%@:",key.capitalizedString];
    SEL setterSEL = NSSelectorFromString(selStr);
    if ([self respondsToSelector:setterSEL]) { //必须使用respondsToSelector:判断是否有相应方法 这里与Message Forwarding相关,防止异常，
        return setterSEL;
    }
    return nil;
}
-(SEL)creatGetterWithKey:(NSString *)key{
    SEL getter =  NSSelectorFromString(key);
    if ([self respondsToSelector:getter]) {
        return getter;
    }
    return nil;
    
}
#pragma mark ForTest


@end
