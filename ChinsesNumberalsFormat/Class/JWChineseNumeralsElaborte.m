//
//  JWChineseNumeralsElaborte.m
//  JWChineseNumeralsElaborateForm
//
//  Created by joe on 2/17/17.
//  Copyright © 2017 Joe. All rights reserved.
//

#import "JWChineseNumeralsElaborte.h"

@implementation JWChineseNumeralsElaborte

+ (NSString *)JW_ChineseNumeralsElaborteFormString:(NSDecimalNumber *)aNumber {
    JWChineseNumeralsElaborte *elaborte = [[JWChineseNumeralsElaborte alloc] init];
    elaborte.moneyNumber = aNumber;
    return [elaborte JW_ChineseNumeralsElaborteFormString];
}

- (NSString *)JW_ChineseNumeralsElaborteFormString {
    if (self.moneyNumber == nil) {
        return nil;
    }
    else {
        return [self translateArabicNumeralsToChinese:self.moneyNumber];
    }
}

- (NSString *)translateArabicNumeralsToChinese:(NSDecimalNumber *)numberals {
    NSString *moneyString = [[NSString stringWithFormat:@"%.2f",numberals.doubleValue] stringByReplacingOccurrencesOfString:@"." withString:@""];
    
    NSArray *units = @[@"分", @"角", @"元", @"拾", @"佰", @"仟", @"万", @"拾", @"佰", @"仟", @"亿", @"拾", @"佰", @"仟", @"兆", @"拾", @"佰", @"仟"];
    NSArray *numbers = @[@"零", @"壹", @"贰", @"叁", @"肆", @"伍", @"陆", @"柒", @"捌", @"玖"];
    
    NSMutableString *chineseNumerals = [[NSMutableString alloc] init];
    for(NSUInteger i=moneyString.length; i>0; i--) {
        // 数值
        NSInteger index = [[moneyString substringWithRange:NSMakeRange(moneyString.length-i, 1)] integerValue];
        [chineseNumerals appendString:numbers[index]];
        
        // 单位
        if([[moneyString substringFromIndex:moneyString.length-i+1] integerValue] == 0 && i != 1 && i != 2) {
            if ( [units[i-1] isEqualToString:@"元"] ) {
                //
            }
            else {
                [chineseNumerals appendString:units[i-1]];
            }
            [chineseNumerals appendString:@"元整"];
            break;
        }
        [chineseNumerals appendString:units[i-1]];
    }
    
    return chineseNumerals;
}

@end
