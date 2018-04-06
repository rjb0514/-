//
//  ViewController.m
//  生成二维码1
//
//  Created by 茹 on 2017/4/24.
//  Copyright © 2017年 kkx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>



@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UITextField *RRtextFiled;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    NSArray *arr = [CIFilter filterNamesInCategory:kCICategoryBuiltIn];
    
    NSLog(@"%@",arr);
    
    self.RRtextFiled.delegate = self;
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
    
    //CICode128BarcodeGenerator  条形码
    //CIQRCodeGenerator
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    [filter setDefaults];
    
    NSString *str = @"解放大路房间jfdal";
    
    [filter setValue:[str dataUsingEncoding:NSUTF8StringEncoding] forKey:@"inputMessage"];
    
    CIImage *temp = [filter outputImage];
    
    UIImage *tempImage = [UIImage imageWithCIImage:temp];
    
    NSLog(@"----%@",NSStringFromCGSize(tempImage.size));
    
    
    temp = [temp imageByApplyingTransform:CGAffineTransformMakeScale(9, 9)];
    
    //创建颜色过滤器
    CIFilter *colorFilter = [CIFilter filterWithName:@"CIFalseColor"];
    
    [colorFilter setDefaults];
    
    // 设定图片
    [colorFilter setValue:temp forKey:@"inputImage"];
    // 设定前景色
    [colorFilter setValue:[CIColor colorWithRed:0 green:0 blue:1 ] forKey:@"inputColor0"];
    // 设定背景色
    [colorFilter setValue:[CIColor colorWithRed:1 green:0 blue:0] forKey:@"inputColor1"];
    
    
    CIImage *tempCIiamge = [colorFilter outputImage];
    
    UIImage *temp2 = [UIImage imageWithCIImage:tempCIiamge];
    
    NSLog(@"----%@",NSStringFromCGSize(temp2.size));
    
    
    self.iconImageView.image = [UIImage imageWithCIImage:tempCIiamge];
    
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    
    NSLog(@"----%@",textField.text);
    
}



@end
