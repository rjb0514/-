//
//  ViewController.m
//  生成二维码
//
//  Created by 茹 on 16/12/25.
//  Copyright © 2016年 kkx. All rights reserved.
//

#import "ViewController.h"


#import <CoreImage/CoreImage.h>

@interface ViewController ()

@property (nonatomic, strong) UIImageView *icon;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 150, 150)];
    [self.view addSubview:icon];
    icon.center = self.view.center;
    self.icon = icon;
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    
    CIFilter *filter =  [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
    
    [filter setDefaults];
    
    NSString *str = @"78987987";
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    [filter setValue:data forKey:@"inputMessage"];
    
    CIImage *putImage = [filter outputImage];
    
    
    self.icon.image = [UIImage imageWithCIImage:putImage];
    
    

    
}


@end
