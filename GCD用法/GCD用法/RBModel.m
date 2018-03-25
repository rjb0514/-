//
//  RBModel.m
//  GCD用法
//
//  Created by 茹 on 2017/9/14.
//  Copyright © 2017年 kkx. All rights reserved.
//

#import "RBModel.h"

@implementation RBModel


+ (instancetype)shardeModel {
    
    static id _model = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _model = [[RBModel alloc] init];
    });
    return _model;
}


+ (void)name:(NSString *)name withAge:(NSInteger)age {
    
    
}


@end


