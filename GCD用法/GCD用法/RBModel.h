//
//  RBModel.h
//  GCD用法
//
//  Created by 茹 on 2017/9/14.
//  Copyright © 2017年 kkx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RBModel : NSObject


#define singleH(name) + (instancetype)sharde##name;



singleH(Model)
+ (void)name:(NSString *)name withAge:(NSInteger)age;








@end
