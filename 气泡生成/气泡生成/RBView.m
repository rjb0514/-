//
//  RBView.m
//  气泡生成
//
//  Created by 茹 on 16/8/31.
//  Copyright © 2016年 rujianbin. All rights reserved.
//

#import "RBView.h"

@implementation RBView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    UIImage *imageBJ = [UIImage imageNamed:@"01"];
    [imageBJ drawInRect:rect];
    
    UIImage *backImage = [UIImage imageNamed:@"ReceiverVoiceNodeBkg"];
    [backImage drawInRect:rect blendMode:kCGBlendModeDestinationIn alpha:1];

}

@end
