//
//  NSObject+objc.m
//  02-动态的加属性
//
//  Created by 茹 on 2017/8/8.
//  Copyright © 2017年 kkx. All rights reserved.
//

#import "NSObject+objc.h"

#import <objc/message.h>


@implementation NSObject (objc)



- (void)setName:(NSString *)name {
    NSLog(@"1111111");
    
    //添加属性 跟对象有关
    //根据keY 或许关联的对象
    //  void * 就等于 id
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_COPY);
    
    
}

- (NSString *)name {
    
   return  objc_getAssociatedObject(self, @"name");
    
    
}


@end
