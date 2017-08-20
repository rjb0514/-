//
//  main.m
//  生成二维码
//
//  Created by 茹 on 16/12/25.
//  Copyright © 2016年 kkx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


BOOL areIntsDifferent(int thing1,int thing2);
NSString *boolStirng (BOOL yesNo);

int main(int argc, char * argv[]) {
//    @autoreleasepool {
//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
//    }
    
    BOOL areThyDifferent ;
    areThyDifferent = areIntsDifferent(5, 5);
    NSLog(@"are %d and %d different ? %@",5,5,boolStirng(areThyDifferent));
    
    areThyDifferent = areIntsDifferent(23, 5);
    NSLog(@"are %d and %d different ? %@",23,5,boolStirng(areThyDifferent));
    
    return 0;
    
    
}

BOOL areIntsDifferent (int thing1,int thing2) {
    
//    if (thing1 == thing2) {
//        return NO;
//    }else {
//        
//        return YES;
//    }
    return thing1 - thing2;
}
NSString *boolStirng (BOOL yesNo) {
    if (yesNo == NO) {
        return @"NO";
    }else {
        
        return @"YES";
    }
}


