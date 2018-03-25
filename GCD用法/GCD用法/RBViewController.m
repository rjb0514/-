//
//  RBViewController.m
//  GCD用法
//
//  Created by 茹 on 2017/9/17.
//  Copyright © 2017年 kkx. All rights reserved.
//

#import "RBViewController.h"

@interface RBViewController ()

@property (nonatomic, weak) dispatch_source_t timer;

@property (nonatomic, weak) NSTimer *nTimer;

@end

@implementation RBViewController


- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
   
    
//    CFRunLoopObserverCreate(<#CFAllocatorRef allocator#>, <#CFOptionFlags activities#>, <#Boolean repeats#>, <#CFIndex order#>, <#CFRunLoopObserverCallBack callout#>, <#CFRunLoopObserverContext *context#>)
    
    
    
    /*
     1.分配存储空间
     2.要监听的状态
     3.是否持续监听
     4.优先级
     5.回调
     */
    CFRunLoopObserverRef obsever = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
       
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"runloop进入");
                break;
                
            case kCFRunLoopBeforeTimers:
                NSLog(@"runloop处理timwe");
                break;
                
            case kCFRunLoopBeforeSources:
                NSLog(@"runloop处理sources");
                break;
                
            case kCFRunLoopBeforeWaiting:
                NSLog(@"runloops睡觉");
                break;
                
            case kCFRunLoopAfterWaiting:
                NSLog(@"runloop睡醒后");
                break;
                
            case kCFRunLoopExit:
                NSLog(@"runloop退出");
                break;

                
            default:
                break;
        }
    });
    
    
    
    /*
     给runloop添加监听者
     1.要监听哪个runloop
     2.监听者
     3.要监听哪种模式下的运行状态
     */
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), obsever, kCFRunLoopDefaultMode);
    
    [self GCDTimer];
}

- (void)GCDTimer {
    
    NSLog(@"点击");
    
    __block NSInteger sum = 20;
    
    //创建队列
    dispatch_queue_t queue =  dispatch_queue_create("ru.com", DISPATCH_QUEUE_CONCURRENT);
    
    //1.创建GCD定时器
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    self.timer = timer;
    
    /*
     第一个参数  要给哪个定时器设置
     第二个参数  GCD单位是纳秒
     第三个参数  精准度
     第四个参数
     第五个参数
     */
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    
    
    //设置定时器要调用的方法
    dispatch_source_set_event_handler(timer, ^{
        
        
        if (sum == 1) {
            dispatch_cancel(timer);
        }else {
            sum --;
        }
        
        
//        [self show];
          NSLog(@"11 111");
    });
    
    //恢复或启动
    dispatch_resume(timer);
}

- (void)nsTimer {
    
    
    self.nTimer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(show) userInfo:nil repeats:YES];
}

- (void)show {
    
    NSLog(@"222222222222");
  
}

- (void)dealloc {

    
//    dispatch_cancel(self.timer);
    NSLog(@"我释放了--%@",self.timer);
    
}


@end
