//
//  Person.h
//  01-使用运行时进行图像的重绘
//
//  Created by 茹 on 16/8/29.
//  Copyright © 2016年 rujianbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface Person : NSObject
- (RACSignal *)loadPerson;
@end
