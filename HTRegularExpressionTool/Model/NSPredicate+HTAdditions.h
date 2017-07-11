//
//  NSPredicate+HTAdditions.h
//  HTRegularExpressionTool
//
//  Created by Huiting Mao on 2017/7/6.
//  Copyright © 2017年 Martell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSPredicate (HTAdditions)

/** 验证中文*/
+ (BOOL)checkChinese:(NSString *)chinese;

/** 验证手机号*/
+ (BOOL)checkPhone:(NSString *)phone;

/** 验证金额*/
+ (BOOL)checkMoney:(NSString *)money;

/** 验证邮箱*/
+ (BOOL)checkEmail:(NSString *)email;

/** 验证身份证*/
+ (BOOL)checkIdentityCardNumber:(NSString *)number;

/** 验证URL前缀*/
+ (BOOL)checkUrl:(NSString *)url;

@end
