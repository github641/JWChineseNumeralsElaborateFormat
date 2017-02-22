//
//  JWChineseNumeralsElaborte.h
//  JWChineseNumeralsElaborateForm
//
//  Created by joe on 2/17/17.
//  Copyright © 2017 Joe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JWChineseNumeralsElaborte : NSObject

+ (NSString *)JW_ChineseNumeralsElaborteFormString:(NSDecimalNumber *)aNumber;

/**
 金额数值
 */
@property(nonatomic,strong) NSDecimalNumber *moneyNumber;

/**
 获取moneyNumber的中文大写格式字符串

 @return 正确转换，返回字符串；反之，返回nil。
 */
- (NSString *)JW_ChineseNumeralsElaborteFormString;
@end
