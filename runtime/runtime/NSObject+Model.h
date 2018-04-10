//
//  NSObject+Model.h
//  runtime
//
//  Created by 茹 on 2018/4/9.
//  Copyright © 2018年 kkx. All rights reserved.
//

#import <Foundation/Foundation.h>


//字典转模型
@interface NSObject (Model)


+ (instancetype)modelWithDictionary:(NSDictionary *)dic;

@end
