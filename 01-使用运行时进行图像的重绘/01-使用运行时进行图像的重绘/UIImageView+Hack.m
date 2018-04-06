//
//  UIImageView+Hack.m
//  01-使用运行时进行图像的重绘
//
//  Created by 茹 on 16/8/29.
//  Copyright © 2016年 rujianbin. All rights reserved.
//

#import "UIImageView+Hack.h"
#import <objc/runtime.h>

@implementation UIImageView (Hack)

+ (void)load {
    [super load];
    //获取原来方法
    Method old = class_getInstanceMethod([self class], @selector(setImage:));
    //获取现在的方法
    Method new = class_getInstanceMethod([self class], @selector(rb_setImage:));
    //进行方法交换
    method_exchangeImplementations(old, new);

}

- (void)rb_setImage:(UIImage *)image {

    UIGraphicsBeginImageContext(self.bounds.size);
    
    
    //开始绘图
    [image drawInRect:self.bounds];
    
    UIImage *temp = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    //调用系统的方法
    [self rb_setImage:temp];
}

@end
