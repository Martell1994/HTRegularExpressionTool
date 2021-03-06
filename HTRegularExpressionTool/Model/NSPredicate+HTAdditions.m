//
//  NSPredicate+HTAdditions.m
//  HTRegularExpressionTool
//
//  Created by Huiting Mao on 2017/7/6.
//  Copyright © 2017年 Martell. All rights reserved.
//

#import "NSPredicate+HTAdditions.h"

@implementation NSPredicate (HTAdditions)

/**
 * 验证正则表达式 推荐网址：https://regex101.com/#javascript
 */

+ (BOOL)checkChinese:(NSString *)chinese {
    NSString *regex = @"^[\\u4e00-\\u9fa5]{0,}$";
    NSPredicate *predicate = [self predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:chinese];
}

+ (BOOL)checkPhone:(NSString *)phone {
    /**
     * 参考：https://www.chahaoba.com
     * 130、131、132、133、134、135、136、137、138、139
     * 145、147
     * 150、151、152、153、155、156、157、158、159
     * 170、171、173、175、176、177、178
     * 180、181、182、183、184、185、186、187、188、189
     * 正确性有待考证
     */
    NSString *regex = @"^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|17[0|1|3|5|6|7|8]|18[0-9])\\d{8}$";
    NSPredicate *predicate = [self predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:phone];
}

+ (BOOL)checkMoney:(NSString *)money {
    NSString *regex = @"^[0-9]+(.[0-9]{2})?$";// 还有问题
    NSPredicate *predicate = [self predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:money];
}

+ (BOOL)checkEmail:(NSString *)email {
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [self predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:email];
}

+ (BOOL)checkIdentityCardNumber:(NSString *)number {
    BOOL flag = NO;
    if (number.length <= 0) {
        return flag;
    }
    NSString *regex = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *predicate = [self predicateWithFormat:@"SELF MATCHES %@", regex];
    flag = [predicate evaluateWithObject:number];
    //如果通过该验证，说明身份证格式正确，但准确性还需计算
    if(flag) {
        if(number.length==18) {
            //将前17位加权因子保存在数组里
            NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
            //这是除以11后，可能产生的11位余数、验证码，也保存成数组
            NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
            //用来保存前17位各自乖以加权因子后的总和
            NSInteger idCardWiSum = 0;
            for(int i = 0;i < 17;i++) {
                NSInteger subStrIndex = [[number substringWithRange:NSMakeRange(i, 1)] integerValue];
                NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
                idCardWiSum+= subStrIndex * idCardWiIndex;
            }
            //计算出校验码所在数组的位置
            NSInteger idCardMod=idCardWiSum%11;
            //得到最后一位身份证号码
            NSString * idCardLast= [number substringWithRange:NSMakeRange(17, 1)];
            //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
            if(idCardMod==2) {
                if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"]) {
                    return flag;
                }else {
                    flag =  NO;
                    return flag;
                }
            }else {
                //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
                if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]]) {
                    return flag;
                } else {
                    flag =  NO;
                    return flag;
                }
            }
        } else {
            flag =  NO;
            return flag;
        }
    } else {
        return flag;
    }
}

+ (BOOL)checkUrl:(NSString *)url {
    NSString *regex = @"http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?";
    NSPredicate *predicate = [self predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:url];
}

@end
