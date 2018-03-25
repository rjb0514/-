//
//  ViewController.m
//  02-const
//
//  Created by 茹 on 2017/8/14.
//  Copyright © 2017年 kkx. All rights reserved.
//

#import "ViewController.h"

#import "SocietyViewController.h"
#import "TopViewController.h"
#import "HotViewController.h"

/*有很多控制器的时候交给一个大的控制器管理
    1.导航控制器  UitabBar
 父子控制器的本质：搞一个控制器容器，管理多个子控制器
 
 模仿 uitabBar控制器
    任何控制器 都可以是一个容器控制器
 
 父子控制器的开发：
    a控制器的view添加到B控制器的view上 就可以
 
 */


#define RJBScreenW [UIScreen mainScreen].bounds.size.width
#define RJBScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) TopViewController *topVC;

@property (nonatomic, strong) HotViewController *hotVC;

@property (nonatomic, strong) SocietyViewController *societyVC;

@property (weak, nonatomic) IBOutlet UIView *contentView;
@end





@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    UILabel *name = [[UILabel alloc] init];
    
    name.text = @"zhaojianping";
    
    name.textColor = [UIColor blackColor];
    
    [name sizeToFit];
    
    [self.view addSubview:name];
    
    name.center = self.view.center;
    
    
    
    
}

//社会
- (IBAction)socityButton:(UIButton *)sender {
    
//    SocietyViewController *VC = [[SocietyViewController alloc] init];
//    
//    VC.view.backgroundColor = [UIColor greenColor];
//    VC.view.frame = CGRectMake(0, 64, RJBScreenW, RJBScreenH);
// 
//    
//    [self.view addSubview:VC.view];
    
    [self.contentView addSubview:self.societyVC.view];
    
    [self.topVC.view removeFromSuperview];
    [self.hotVC.view removeFromSuperview];
}


//头条
- (IBAction)topButton:(UIButton *)sender {
    
//    TopViewController *VC = [[TopViewController alloc] init];
//    
//    VC.view.backgroundColor = [UIColor redColor];
//    VC.view.frame = CGRectMake(0, 64, RJBScreenW, RJBScreenH);
//    
//    
//    [self.view addSubview:VC.view];
    
    [self.contentView addSubview:self.topVC.view];
    
    [self.societyVC.view removeFromSuperview];
    [self.hotVC.view removeFromSuperview];
}


//热点
- (IBAction)hotButton:(UIButton *)sender {
    
//    HotViewController *VC = [[HotViewController alloc] init];
//    
//    VC.view.backgroundColor = [UIColor yellowColor];
//    VC.view.frame = CGRectMake(0, 64, RJBScreenW, RJBScreenH);
//    
//    
//    [self.view addSubview:VC.view];
    
    [self.contentView addSubview:self.hotVC.view];
    
    [self.topVC.view removeFromSuperview];
    [self.societyVC.view removeFromSuperview];
}


/*
 存在的问题：
    1.每次都需要创建控制器
    2.每次都会添加界面，只是想显示当前的view
 
 */


#pragma mark - lazy
- (HotViewController *)hotVC {
    if (!_hotVC) {
        _hotVC = [[HotViewController alloc] init];
        
        _hotVC.view.backgroundColor = [UIColor yellowColor];
//        _hotVC.view.frame = CGRectMake(0, 64, RJBScreenW, RJBScreenH);
        
    }
    
    return _hotVC;
}

- (SocietyViewController *)societyVC {
    if (!_societyVC) {
        _societyVC = [[SocietyViewController alloc] init];
        
        _societyVC.view.backgroundColor = [UIColor greenColor];
//        _societyVC.view.frame = CGRectMake(0, 64, RJBScreenW, RJBScreenH);
        
    }
    
    return _societyVC;
}

- (TopViewController *)topVC {
    if (!_topVC) {
        _topVC = [[TopViewController alloc] init];
        
        _topVC.view.backgroundColor = [UIColor redColor];
//        _topVC.view.frame = CGRectMake(0, 64, RJBScreenW, RJBScreenH);
        
    }
    
    return _topVC;
}

@end
