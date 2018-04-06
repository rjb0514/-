//
//  Person.m
//  01-使用运行时进行图像的重绘
//
//  Created by 茹 on 16/8/29.
//  Copyright © 2016年 rujianbin. All rights reserved.
//

#import "Person.h"


@implementation Person

- (RACSignal *)loadPerson {

    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendCompleted];
        [subscriber sendNext:@"hello rac"];
        [subscriber sendError:[NSError errorWithDomain:@"cn.cast.error" code:100 userInfo:@{@"error messge":@"异常"}]];
        
        return nil;
    }];
   
    
  
}



@end
