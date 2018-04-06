//
//  RBHeaderViewController.m
//  01-顶部放大
//
//  Created by 茹 on 16/8/23.
//  Copyright © 2016年 rujianbin. All rights reserved.
//

#import "RBHeaderViewController.h"
#import "HMObjcSugar.h"
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
#import "ThreeViewController.h"

#define KHeaderHight 200

@interface RBHeaderViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation RBHeaderViewController {
    UIImageView     *_headerImageView;
    UIView          *_head;
    UIView          *_lineView;
    UIStatusBarStyle    _statusBarStyle;
    UIView              *_navView;
    UILabel         *_label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //viewController +NAV 会自动调整 tableView的ContentInset
    //取消自动调整滚动视图的间距
    self.automaticallyAdjustsScrollViewInsets = NO;
    //初始状态栏
    _statusBarStyle = UIStatusBarStyleLightContent;
    
    //准备tableView
    [self prepareTableView];
    //准备头部
    [self prepareHeaderView];
    //添加类似导航栏
    [self preparedLikeNav];
    
    
    
}
- (void)preparedLikeNav {
    _navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.hm_width, 64)];
    _navView.backgroundColor = [UIColor yellowColor];
    _navView.alpha = 0;
    [self.view addSubview:_navView];
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake(175, 30, 200, 21)];
//    _label.text = @"哈哈哈哈";
    _label.textColor = [UIColor blackColor];
    [self.view addSubview:_label];
    

}

//导航栏返回的时候的动画效果
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark -准备顶部视图
- (void)prepareHeaderView {
    _head  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.hm_width, KHeaderHight)];
    
    _head.backgroundColor = [UIColor hm_colorWithHex:0xF8F8F8];
    [self.view addSubview:_head];
    
    _headerImageView = [[UIImageView alloc]initWithFrame:_head.bounds];
    _headerImageView.backgroundColor = [UIColor redColor];
    _headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    _headerImageView.clipsToBounds = YES;
    [_head addSubview:_headerImageView];
    //设置图像
    //http://pic.58pic.com/58pic/17/80/90/5594c1a0ab869_1024.jpg
    NSURL *url = [NSURL URLWithString:@"http://pic.58pic.com/58pic/17/80/90/5594c1a0ab869_1024.jpg"];
    [_headerImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"headerView"] options:0];
    
    CGFloat lineH = 1/[UIScreen mainScreen].scale;
    _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, KHeaderHight - lineH, self.view.hm_width, lineH)];
    _lineView.backgroundColor = [UIColor lightGrayColor];
    [_head addSubview:_lineView];

}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return _statusBarStyle;
}

#pragma mark -准备TableView
- (void)prepareTableView {
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //设置数据源
    tableView.dataSource = self;
    tableView.delegate = self;
    //注册
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    //tableView的内边距
    tableView.contentInset = UIEdgeInsetsMake(KHeaderHight, 0, 0, 0);
    //设置滚动指示器的间距
    tableView.scrollIndicatorInsets = UIEdgeInsetsMake(KHeaderHight, 0, 0, 0);
    
    
    [self.view addSubview:tableView];
}

#pragma mark -数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @(indexPath.row).stringValue;
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
   
    
    CGFloat offset = scrollView.contentOffset.y + scrollView.contentInset.top;
    if (offset <= 0) {
        _head.hm_y = 0;
        _head.hm_height = KHeaderHight - offset;
        _headerImageView.hm_height = _head.hm_height;
        _navView.alpha = 0;
        _label.text = @"透明";
        _statusBarStyle = UIStatusBarStyleLightContent;
    }else {
        //整体移动
        _head.hm_height = KHeaderHight;
        _headerImageView.hm_height = _head.hm_height;
        CGFloat min = KHeaderHight - 64;
        offset = MIN(min, offset);
        _head.hm_y = - offset;
        //设置透明度
        _navView.alpha = offset/min;
        _label.text = @"不透明";
        _statusBarStyle = (_navView.alpha <0.5) ? UIStatusBarStyleDefault : UIStatusBarStyleLightContent;
    
    }
    //调用改变状态栏
    [self.navigationController setNeedsStatusBarAppearanceUpdate];
    _lineView.hm_y = _head.hm_height - _lineView.hm_height;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ThreeViewController *vc = [[ThreeViewController alloc]init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];

}

@end
