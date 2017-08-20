//
//  ViewController.m
//  网易新闻
//
//  Created by 茹 on 2017/8/16.
//  Copyright © 2017年 kkx. All rights reserved.
//

#import "ViewController.h"
#import "TopViewController.h"
#import "HotViewController.h"
#import "SocietyViewController.h"
#import "ReaderViewController.h"
#import "ScienceViewController.h"
#import "VidioViewController.h"


static const int labelW = 100;

#define RJBScreenW [UIScreen mainScreen].bounds.size.width
#define RJBScreenH [UIScreen mainScreen].bounds.size.height



@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, weak) UILabel *selLabel;

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@property (weak, nonatomic) IBOutlet UIScrollView *titleScrollView;

@property (nonatomic, strong) NSMutableArray *titleLabels;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildViewController];
    
    //设置子标题
    [self setupTitle];
    
    //ios7会给导航控制器下 所有UIscrollview添加滚动区
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //初始化scrollView的操作
    [self setupScrollView];
}

- (void)setupScrollView {
    self.titleScrollView.contentSize = CGSizeMake(self.childViewControllers.count * labelW, 0);
    self.titleScrollView.bounces = NO;
    
    self.titleScrollView.showsHorizontalScrollIndicator = NO;
    
    //设置内容的滚动条
    self.contentScrollView.contentSize = CGSizeMake(RJBScreenW * self.childViewControllers.count, 0);
    self.contentScrollView.showsHorizontalScrollIndicator = NO;
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.bounces = NO;
    
    self.contentScrollView.delegate = self;
}

//添加所有子控制器
- (void)setupChildViewController {
    
    //头条
    TopViewController *topVC = [[TopViewController alloc] init];
    topVC.title = @"头条";
    [self addChildViewController:topVC];
    
    //热点
    HotViewController *hotVC = [[HotViewController alloc] init];
    hotVC.title = @"热点";
    [self addChildViewController:hotVC];
    
    //视频
    VidioViewController *vidioVC = [[VidioViewController alloc] init];
    vidioVC.title = @"视频";
    [self addChildViewController:vidioVC];
    
    //社会
    SocietyViewController *societyVC = [[SocietyViewController alloc] init];
    societyVC.title = @"社会";
    [self addChildViewController:societyVC];
    
    //阅读
    ReaderViewController *readerVC = [[ReaderViewController alloc] init];
    readerVC.title = @"阅读";
    [self addChildViewController:readerVC];
    
    //科技
    ScienceViewController *scienceVC = [[ScienceViewController alloc] init];
    scienceVC.title = @"科技";
    [self addChildViewController:scienceVC];
    
    
}

//设置子标题
- (void)setupTitle {

    CGFloat labelX = 0;
    CGFloat labelY = 0;
    CGFloat labelH = 44;
    for (NSInteger i = 0; i < self.childViewControllers.count; i++) {
        UILabel *nameLabel = [[UILabel alloc] init];
        labelX = labelW * i;
        nameLabel.frame = CGRectMake(labelX, labelY, labelW, labelH);
        nameLabel.textAlignment = NSTextAlignmentCenter;
        //label标题
        nameLabel.text = self.childViewControllers[i].title;
        //设置文字颜色
        nameLabel.highlightedTextColor = [UIColor redColor];
        //设置tag
        nameLabel.tag = i;
        //添加点按手势
        nameLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleClick:)];
        
        [nameLabel addGestureRecognizer:tap];
        
        [self.titleScrollView addSubview:nameLabel];
        [self.titleLabels addObject:nameLabel];
        
        if (i == 0) {
            [self titleClick:tap];
        }
        
    }
    
    
}


//标题的点击
- (void)titleClick:(UITapGestureRecognizer *)tap {
    
    
    //给标题改成红色
    UILabel *label = (UILabel *)tap.view;
    [self selectedLaebl:label];
    
    //2.先滚动到对应的位置
    NSInteger index = self.selLabel.tag;
        //计算滚动的位置
    CGFloat offsetX = index * RJBScreenW;
    self.contentScrollView.contentOffset = CGPointMake(offsetX, 0);
    //3.给对应的位置添加控制器
    [self showViewController:index];
    
}

- (void)selectedLaebl:(UILabel *)label {
    self.selLabel.transform = CGAffineTransformIdentity;
    self.selLabel.highlighted = NO;
    label.highlighted = YES;
    self.selLabel = label;
    label.transform = CGAffineTransformMakeScale(1.3, 1.3);
}

#pragma mark - scrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"滚动完成");
    NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    //3.给对应的位置添加控制器
 
    [self showViewController:index];
    
    //把对应的标题选中
    UILabel *label = self.titleLabels[index];
    
    [self selectedLaebl:label];
    
    //设置标题居中
    [self setupTitleCenter:label];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    CGFloat index = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    NSLog(@"%F",index);
    
    //获取左边label的角标
    NSInteger leftIndex = (NSInteger)index;
    NSInteger rightIndex = (NSInteger)index + 1;
    
    
    //获取左边label
    UILabel *leftLaebl = self.titleLabels[leftIndex];
    
    UILabel *rightLabel;
    if (rightIndex < self.titleLabels.count - 1) {
        rightLabel = self.titleLabels[rightIndex];
    }
    
    
    //计算比例
    CGFloat rightScale = index - leftIndex;
    CGFloat leftScale = 1 - rightScale;
    
    
    leftLaebl.transform = CGAffineTransformMakeScale(leftScale * 0.3 + 1, leftScale * 0.3 + 1);
    rightLabel.transform = CGAffineTransformMakeScale(rightScale * 0.3 + 1, rightScale * 0.3+ 1);
    
    
    //文字渐变
    leftLaebl.textColor = [UIColor colorWithRed:leftScale green:0 blue:0 alpha:1];
    rightLabel.textColor = [UIColor colorWithRed:rightScale green:0 blue:0 alpha:1];
    
    
}

//MARK: 显示控制器
- (void)showViewController:(NSInteger)index {
    
    UIViewController *VC = self.childViewControllers[index];
    
    //如果控制器的
    if ([VC.view isDescendantOfView:self.contentScrollView]) {
        return;
    }
    
    CGFloat offsetX = index * RJBScreenW;
    
    VC.view.frame = CGRectMake(offsetX, 0, self.contentScrollView.bounds.size.width, self.contentScrollView.bounds.size.height);
    [self.contentScrollView addSubview:VC.view];
    
}

//设滚动的文字
- (void)setupTitleCenter:(UILabel *)centerLaebl {
    
    CGFloat offsetX = centerLaebl.center.x - RJBScreenW * 0.5;
    
    if (offsetX < 0  ) {
        offsetX = 0;
    }
    
    if (offsetX > self.titleScrollView.contentSize.width - RJBScreenW) {
        offsetX = self.titleScrollView.contentSize.width - RJBScreenW;
    }
    
    [self.titleScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}


- (NSMutableArray *)titleLabels {
    if (!_titleLabels) {
        _titleLabels = [NSMutableArray array];
    }
    return _titleLabels;
}

@end
