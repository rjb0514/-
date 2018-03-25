//
//  ViewController.m
//  GCD用法
//
//  Created by 茹 on 2017/9/13.
//  Copyright © 2017年 kkx. All rights reserved.
//

#import "ViewController.h"
#import "RBModel.h"
#import "RBOperation.h"

#import "RBViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;


@property (nonatomic, strong) UIImage *imageOne;

@property (nonatomic, strong) UIImage *imageTwo;




@property (nonatomic, assign) NSInteger num;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    

    
    RBViewController *VC = [RBViewController new];
    [self.navigationController pushViewController:VC animated:YES];

    
    
    
}




- (void)test {
    //nsoperation中就2中队列  主队列  并发队列
    /*
     主队列： 凡是放到主队列的任务都在主线程执行
     非主队列： alloc init  同时具备了并发和串行的功能 默认是并发队列
     */
    
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    //默认是-1  最大数
    queue.maxConcurrentOperationCount = 1;
    
    //封装操作
    
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download) object:nil];
    
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download2) object:nil];
    
    NSInvocationOperation *op3 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download3) object:nil];
    
    [queue addOperation:op];
    
    [queue addOperation:op2];
    
    
    
    [queue addOperation:op3];
    
    [queue addOperationWithBlock:^{
        
        
        NSLog(@"4444%@",[NSThread currentThread]);
    }];
    
    RBOperation *rbOp = [[RBOperation alloc] init];
    
    
    [queue addOperation:rbOp];
}


- (void)download {
    
    NSLog(@"111111%@",[NSThread currentThread]);
}

- (void)download2 {
    
    NSLog(@"222222%@",[NSThread currentThread]);
}

- (void)download3 {
    
    NSLog(@"33333%@",[NSThread currentThread]);
}


//合成图片
- (void)demo4 {
    
    
    dispatch_group_t group = dispatch_group_create();
    
    
    
    dispatch_queue_t queue = dispatch_queue_create("com.ru", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_async(group, queue, ^{
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://imgsrc.baidu.com/image/c0%3Dshijue1%2C0%2C0%2C294%2C40/sign=3d2175db3cd3d539d530078052ee8325/b7003af33a87e950c1e1a6491a385343fbf2b425.jpg"]];
        
        
        self.imageOne = [UIImage imageWithData:data];
        
        
    });
    
    
    dispatch_group_async(group, queue, ^{
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://img.taopic.com/uploads/allimg/140322/235058-1403220K93993.jpg"]];
        
        
        self.imageTwo = [UIImage imageWithData:data];
        
        
    });
    
 
    
    dispatch_group_notify(group, queue, ^{
       
        UIGraphicsBeginImageContext(CGSizeMake(200, 200));
        
        [self.imageOne drawInRect:CGRectMake(0, 0, 200, 100)];
        
        [self.imageTwo drawInRect:CGRectMake(0, 100, 200, 100)];
        
        //根据图形上下文拿到图片
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndPDFContext();
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.iconImageView.image = image;
        });
        
    });
    
    
    
    
    
}


//快速迭代 快速遍历
- (void)demo2 {
    
    //第一个参数 执行几次
    //第二个参数 在哪个队列
    //第三个参数 执行任务
    
    //1.创建并发队列
    dispatch_queue_t queue = dispatch_queue_create("com.ru", DISPATCH_QUEUE_CONCURRENT);
    

    dispatch_apply(10, queue, ^(size_t index) {
        NSLog(@"%@--%zd",[NSThread currentThread],index);
        
    });
    
//    for (NSInteger i = 0; i < 10; i++) {
//         NSLog(@"%@--%zd",[NSThread currentThread],i);
//    }
    
}

- (void)demo3 {
    
    NSString *from = @"/Users/ru/Desktop/ATS截屏";
    NSString *to = @"/Users/ru/Desktop/huba";
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    NSArray *arr = [manager subpathsAtPath:from];
    
//    NSLog(@"%@",arr);
    
    
    for (NSInteger i = 0; i < [self num]; i++) {
        NSLog(@"11");
    }
    
}


- (NSInteger)num {
    
    NSLog(@"你猜猜我调用了几次");
    return 10;
}


//栅栏函数
- (void)demo1 {

    
    
    //1.创建并发队列
    dispatch_queue_t queue = dispatch_queue_create("com.ru", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        
        for (NSInteger i = 0; i < 100; i++) {
            NSLog(@"---download 1-%zd--%@",i,[NSThread currentThread]);
        }
    });
    
    
    dispatch_async(queue, ^{
        
        for (NSInteger i = 0; i < 100; i++) {
            NSLog(@"---download 2-%zd--%@",i,[NSThread currentThread]);
        }
    });
    
    //栅栏函数
    dispatch_barrier_async(queue, ^{
        NSLog(@"我是一个栅栏");
    });
    
    
    dispatch_async(queue, ^{
        
        for (NSInteger i = 0; i < 100; i++) {
            NSLog(@"---download 3-%zd--%@",i,[NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        
        for (NSInteger i = 0; i < 100; i++) {
            NSLog(@"---download 4-%zd--%@",i,[NSThread currentThread]);
        }
    });

}






@end
