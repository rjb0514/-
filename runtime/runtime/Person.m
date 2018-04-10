//
//  Person.m
//  runtime
//
//  Created by 茹 on 2018/4/9.
//  Copyright © 2018年 kkx. All rights reserved.
//

#import "Person.h"
//#import <objc/runtime.h>
#import <objc/message.h>



@implementation Person



//交换方法
+ (void)load {
    Method method1 = class_getInstanceMethod([self class], @selector(run));
    Method method2 = class_getInstanceMethod([self class], @selector(eat));
    
    method_exchangeImplementations(method1, method2);
    
    
}

- (void)run {
      NSLog(@"%s",__func__);
    
    
}



- (void)eat {
    NSLog(@"%s",__func__);
}

- (void)run:(int)age {
    NSLog(@"%s--%d",__func__,age);
}

+ (void)eat {
    NSLog(@"类--%s",__func__);
    
}


//接受参数的方法 要这么写
void rujianbin(id self,SEL _cmd,id params) {
    NSLog(@"%s",__func__);
}

//调用的一个没有实现的方法 就会调用这个方法
//找不到selctor  调用的第一个方法
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    if (sel == @selector(work:)) {
        NSLog(@"work");
        
        /**
         添加方法的实现
 “v@:” 是类型编码 ,v 表示void @表示对象  id类型 ，:表示方法选标（SEL ，即看做一个方法的id
         @param class] 类
         @param work selector
         @param IMP 方法的实现 函数的入口 函数名
         @param types 方法的类型
         @return id
         */
        class_addMethod(self, sel, (IMP)rujianbin, "v@:@");
        
        //处理完成
        return YES;
        
    }
    return  [super resolveInstanceMethod:sel];
    
    
}


@end
