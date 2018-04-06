//
//  ViewController.m
//  01-顶部放大
//
//  Created by 茹 on 16/8/23.
//  Copyright © 2016年 rujianbin. All rights reserved.
//

#import "ViewController.h"
#import "RBHeaderViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.center = self.view.center;
    [self.view addSubview:btn];
}
- (IBAction)jopBntClick:(id)sender {
    RBHeaderViewController *vc = [[RBHeaderViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];

    
}
- (void)btnClick:(UIButton *)btn {
    RBHeaderViewController *vc = [[RBHeaderViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];

}

//导航栏返回的时候的动画效果
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

@end
