//
//  ViewController.m
//  02-动态的加属性
//
//  Created by 茹 on 2017/8/8.
//  Copyright © 2017年 kkx. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+objc.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [[NSObject new] name];
    
    NSObject *objc = [NSObject new];
    objc.name = @"3";
    
    NSLog(@"0-----%@",objc.name);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
