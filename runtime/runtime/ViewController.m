//
//  ViewController.m
//  runtime
//
//  Created by 茹 on 2018/4/9.
//  Copyright © 2018年 kkx. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "Person.h"
#import "RJBCreatObject.h"
#import "StudentModel.h"
#import "NSObject+Model.h"
#import "UserModel.h"

@interface ViewController ()

@end

/*
 1. ios5之后苹果不建议使用   要在Buildsetting  搜索msg 设置严查 为NO
 2.在分类里面不能调用super  所以才有分类的存在
 3.交换方法 Method
    1.+ (BOOL)resolveInstanceMethod:(SEL)sel  在这个方法中拦截
    2.判断实现 对应的方法  参照Person 里面的做法
 4.动态的添加属性   参考 UIimage+rjb.m
 5.自定义 字典转模型
 */


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
      self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *arr = @[@{@"name":@"ru",@"age":@"323",@"sex":@"3",@"model":@{@"home":@"lin",@"product":@"1001"}},@{@"name":@"ru",@"age":@"323",@"sex":@"3"}];
    
    NSMutableArray *arrM = [NSMutableArray array];
    [arr enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
        
        StudentModel *model = [StudentModel modelWithDictionary:dic];
        
        [arrM addObject:model];
    }];

    StudentModel *model = arrM.firstObject;
    UserModel *usr = model.model;
    
    NSLog(@"%@",arrM);
    
    
}


- (void)test {
    
    
  
    
    //    id P = NSClassFromString(@"Person");
    //    id q = [P new];
    Person *p  = [[Person alloc] init];
    
    //ios5之后苹果不建议使用   要在Buildsetting  搜索msg 设置严查 为NO
    objc_msgSend(p,@selector(eat));
    
    objc_msgSend(p, @selector(run:),20);
    
    objc_msgSend([Person class], @selector(eat));
    
    
    //动态的添加方法
    [p performSelector:@selector(work:)withObject:@{@"ru":@"rr"}];
    
    
    UIImage *im = [UIImage new];
    [im setValue:@"ruru" forKey:@"name"];
    NSLog(@"%@",[im valueForKey:@"name"]);
    
    
    NSDictionary *dic = @{@"ru":@"rrr",@"key":@2,@"arr":@[@"rr"],@"dic":@{@"r":@"44"}};
    
    [RJBCreatObject creatModelWithDictionary:dic];
    
}


@end
