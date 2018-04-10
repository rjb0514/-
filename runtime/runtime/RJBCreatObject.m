//
//  RJBCreatObject.m
//  runtime
//
//  Created by 茹 on 2018/4/9.
//  Copyright © 2018年 kkx. All rights reserved.
//

#import "RJBCreatObject.h"

@implementation RJBCreatObject

+ (void)creatModelWithDictionary:(NSDictionary *)dic {
    
    
    NSMutableString *arrM = [NSMutableString string];
    
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull propertyName, id  _Nonnull value, BOOL * _Nonnull stop) {
        NSLog(@"%@",[value class]);
        NSString *code;
        if ([value isKindOfClass:NSClassFromString(@"__NSCFConstantString")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@",propertyName];
        }else if ([value isKindOfClass:NSClassFromString(@"__NSSingleObjectArrayI")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@",propertyName];
        }else if ([value isKindOfClass:NSClassFromString(@"__NSSingleEntryDictionaryI")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@",propertyName];
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFNumber")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) NSInteger  %@",propertyName];
        }
        [arrM appendString:[NSString stringWithFormat:@"\n%@\n",code]];
        
        
    }];
    
    NSLog(@"%@",arrM);
}

@end
