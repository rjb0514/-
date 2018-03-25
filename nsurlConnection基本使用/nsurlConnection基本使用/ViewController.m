//
//  ViewController.m
//  nsurlConnection基本使用
//
//  Created by 茹 on 2017/9/18.
//  Copyright © 2017年 kkx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    
    //1.创建请求路径
    NSString *test = @"{\"ru\":\"haha\"}";
    
    id dict = [NSJSONSerialization JSONObjectWithData:[test dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
    
    NSLog(@"%@",[dict class]);
    
    
    
}

@end
