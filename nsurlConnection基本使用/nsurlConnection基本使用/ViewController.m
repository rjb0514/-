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


- (void)viewDidLoad {
    [super viewDidLoad];


                     
    
}


- (void)test {
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"111");
    });
    
    
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"2");
    });
    
    
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"333");
    });
    
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    NSLog(@"555");
    
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"666");
    });
    
    
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"7777");
    });
    
    
    NSLog(@"9090909");
}



@end
