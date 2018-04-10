//
//  StudentModel.h
//  runtime
//
//  Created by 茹 on 2018/4/9.
//  Copyright © 2018年 kkx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserModel;

@interface StudentModel : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *sex;

@property (nonatomic, copy) NSString *age;

@property (nonatomic, assign) int number;

@property (nonatomic, strong) UserModel *model;


@end
