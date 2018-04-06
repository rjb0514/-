//
//  ViewController.m
//  01-使用运行时进行图像的重绘
//
//  Created by 茹 on 16/8/29.
//  Copyright © 2016年 rujianbin. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController {

    UIButton *_btn;
}
NSString *str = @"adc";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSLog(@"%@--%p",str,str);
    
    [self changeSTR:@"aaa"];
    NSLog(@"%@--%p=---%zd",str,str,str.length);
    [self textFiledDemo];
    
    
    
}

- (void)changeSTR:(NSString *)str1 {

    str = @"jhg";
    NSLog(@"%@--%p--%zd",str,&str,str.length);
}


#pragma mark - 组合的文本
- (void)textCombinDemo {
    UITextField *nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(20, 40, 300, 40)];
    nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.view addSubview:nameTextField];
    //监听文本就是输入的内容
  
    UITextField *passWordTextField = [[UITextField alloc]initWithFrame:CGRectMake(20, 100, 300, 40)];
    passWordTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.view addSubview:passWordTextField];
    //监听文本就是输入的内容

    
//    [[RACSignal combineLatest:@[nameTextField.rac_textSignal,passWordTextField.rac_textSignal]] subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    [[RACSignal combineLatest:@[nameTextField.rac_textSignal,passWordTextField.rac_textSignal] reduce:^id (NSString *name,NSString *passWord){
        
        NSLog(@"%@--%@",name,passWord);
        return @(name.length > 0 && passWord.length >0);
    }] subscribeNext:^(id x) {
        _btn.enabled = [x boolValue];
    }];
    

  
}

#pragma mark - textField 
- (void)textFiledDemo {
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 40, 300, 40)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textField];
    //监听文本就是输入的内容
    [textField.rac_textSignal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];

}

#pragma mark -按钮的演示
- (void)buttonDemo {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center = self.view.center;
    [self.view addSubview:btn];
    
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside]  subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    _btn = btn;

}

- (void)demo {
    [[[Person new] loadPerson]subscribeNext:^(id x) {
        NSLog(@"%@",x);
    } error:^(NSError *error) {
        NSLog(@"%@",error);
    } completed:^{
        NSLog(@"完成");
    }];
}
- (void)text {

    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    iv.center = self.view.center;
    
    [self.view addSubview:iv];
    
    // 设置图像 - bundle中的 jpg 在加载的时候，需要指定扩展名
    iv.image = [UIImage imageNamed:@"avatar.jpg"];
    //    iv setImage:<#(UIImage * _Nullable)#>
    
    // 目标：在设置图像的时候，干一些事情！NSLog
}

@end
