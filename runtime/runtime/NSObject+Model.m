//
//  NSObject+Model.m
//  runtime
//
//  Created by 茹 on 2018/4/9.
//  Copyright © 2018年 kkx. All rights reserved.
//

#import "NSObject+Model.h"
#import <objc/runtime.h>

@implementation NSObject (Model)

+ (instancetype)modelWithDictionary:(NSDictionary *)dic {
    
    //首先创建对应类的类型
    id objc = [[self alloc] init];
    
    //1.先遍历所有属性名
    unsigned int num ;
    Ivar* ivarList = class_copyIvarList(self, &num);
    for (NSInteger i = 0; i < num; i++) {
        Ivar ivar = ivarList[i];
        
        //获取成员名
        NSString *propertyName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        //获取成员类型
        NSString *propertyType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        
        NSLog(@"%@---%@",propertyName,propertyType);
        
        //获取key
        NSString *key = [propertyName substringFromIndex:1];
        
        id value = dic[key];
        
        //二级转换  如果就是属性 就不转模型
        if ([value isKindOfClass:[NSDictionary class]] && ![propertyType containsString:@"NS"]) {
            
            //截取字符串 原来的property 是@"@\"User\""
            NSRange rang = [propertyType rangeOfString:@"\""];
            propertyType = [propertyType substringFromIndex:rang.location + rang.length];
            NSRange rang2 = [propertyType rangeOfString:@"\""];
            propertyType = [propertyType substringToIndex:rang2.location];
            Class modelClass = NSClassFromString(propertyType);
            //二级模型
            value =   [modelClass modelWithDictionary:value];
        
        }
        
        
        if (value) {
            [objc setValue:value forKey:key];
        }
        
    }
    
    
    
    
    return objc;
    
}

@end
