//
//  NSString+FCExtension.h
//  FocusCircle
//
//  Created by Liang Zhao on 15/6/24.
//  Copyright © 2015年 Liang Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FCExtension)
/**
 *  根据是否显示小时，来返回一个时间字符串---格式--- 00：00：00 或者 00：00
 *
 *  @param time
 *  @param showHour 是否需要显示小时数
 *
 *  @return
 */
+ (NSString *)stringWithSeconds:(NSNumber *)time ifShowHour:(BOOL)showHour;
/**
 *  根据传入的规定格式的字符串获得一个时间单元数组
 *
 *  @param timeString  传入的规定格式的字符串
 *
 *  @return   时间单元数组
 */
+ (NSMutableArray *)arrayWithTimeString:(NSString *)timeString;

@end
