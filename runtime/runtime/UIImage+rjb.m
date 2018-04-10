//
//  UIImage+rjb.m
//  runtime
//
//  Created by 茹 on 2018/4/9.
//  Copyright © 2018年 kkx. All rights reserved.
//

#import "UIImage+rjb.h"
#import <objc/runtime.h>

@implementation UIImage (rjb)


- (void)setName:(NSString *)name {
    
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY);
}

- (NSString *)name {
   return  objc_getAssociatedObject(self, @selector(name));
}


@end
