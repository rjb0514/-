//
//  ViewController.m
//  runloop的应用
//
//  Created by 茹 on 2017/9/17.
//  Copyright © 2017年 kkx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSThread *thread;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    
    
}



//按钮的点击
- (IBAction)btnClick:(UIButton *)sender {
    
    NSLog(@"btnClick");
    
    
    [self performSelector:@selector(test1) onThread:self.thread withObject:nil waitUntilDone:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(test) object:nil];
    
    self.thread = thread;
    
    [thread start];
}


- (void)test {
    
    NSLog(@"test--- %@",[NSThread currentThread]);
    
    /*
     1.子线程的runloop需要手动创建
     2.子线程的runloop默认是不开启的
     3.子线程的runloop 里面至少需要一个 source或者timer  obser不行
     */
    
    //1.添加端口的意义就是不让 runloop退出
    [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
    //runloop是懒加载
    [[NSRunLoop currentRunLoop] run];
    
    
    
}


- (void)test1 {
    

    NSLog(@"test1---%@",[NSThread currentThread]);
    
}




@end
