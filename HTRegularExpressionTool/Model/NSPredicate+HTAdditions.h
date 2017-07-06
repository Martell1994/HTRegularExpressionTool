//
//  NSPredicate+HTAdditions.h
//  HTRegularExpressionTool
//
//  Created by Huiting Mao on 2017/7/6.
//  Copyright © 2017年 Martell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSPredicate (HTAdditions)

/** 验证邮箱*/
+ (BOOL)checkEmail:(NSString *)email;

/** 验证身份证*/
+ (BOOL)checkIdentityCardNumber:(NSString *)number;

@end
