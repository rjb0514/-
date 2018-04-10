//
//  ViewController.m
//  02-const
//
//  Created by 茹 on 2017/8/14.
//  Copyright © 2017年 kkx. All rights reserved.
//

#import "ViewController.h"


static int sum = 20;
// 宏的命名规范: 都是以项目前缀开头 ，以key结尾
#define RJBAccoun  @"减肥的索拉卡解放路口打手机临汾就放大垃圾费倒垃圾及的垃圾费垃圾浪费静安寺冷风机的撒家乐福"
//苹果把常用的字符串定义为const




/*
 1.常用的字符串定义为宏
 2.常用的代码用 宏
 
 const
 1.苹果推介我们使用const （当有字符串常量的时候）
 2.const 与 宏的区别
    1.在编译时刻 宏:是预编译  const:在编译的时候
    2.编译检查  宏:不会检查错误  cons: 会做编译检查
    3.宏：可以定义代码
    4.宏的坏处： 编译时间过长   const只编译一次  大大减少编译时间  因此常用字符串常量用const
 

 
 const:
    1.仅仅用来修饰右边的变量（只能修饰变量： 基本变量，指针变量，对象变量）
    2.用const修饰的变量 表示只读变量 而不是常量
 
 在开发中的使用
    1.定义一个只读全局变量
    2.方法中定义只读参数
 
 */


/*
 static作用
 1.修饰局部变量
    *延长局部变量的生命周期  只要程序运行，局部变量就会一直存在
    *局部变量只会分配一次内存 为什么?用static修饰的代码，只会在程序一启动就会执行，以后就不会执行了
 2.修饰全局变量
    *只会修改全局变量的作用域，表示只能在当前文件中使用
 
 */

/*
 extern
    1.声明一个全局变量，不能定义变量
    注意：extern修饰的变量不能初始化
 
 */


/*
 static  与 const 连用
    表示 静态的全部只读变量
 
 */


#define RJBScreenW [UIScreen mainScreen].bounds.size.width
#define RJBScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UIView *contentView;
@end





@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    
    //宏不会增加内存  但是左边的指针变量会增加内存
    NSString *str = RJBAccoun;
    NSString *str1 = RJBAccoun;
    
    NSLog(@"%p",str);
    NSLog(@"%p",str1);
    
    
    

 
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int num = 20;
    num++;
}




@end
