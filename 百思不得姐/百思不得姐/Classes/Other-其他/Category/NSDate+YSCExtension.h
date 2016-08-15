//
//  NSDate+YSCExtension.h
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/4/30.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (YSCExtension)
/**
 * 比较from和self的时间差值
 */
- (NSDateComponents *)deltaFrom:(NSDate *)from;

/**
 * 是否为今年
 */
- (BOOL)isThisYear;

/**
 * 是否为今天
 */
- (BOOL)isToday;

/**
 * 是否为昨天
 */
- (BOOL)isYesterday;
@end
