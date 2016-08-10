//
//  NSString+FCExtension.m
//  FocusCircle
//
//  Created by Liang Zhao on 15/6/24.
//  Copyright © 2015年 Liang Zhao. All rights reserved.
//

#import "NSString+FCExtension.h"
#import <objc/runtime.h>
static void *groupArrayKey = &groupArrayKey;
static void *unitArrayKey = &unitArrayKey;

@implementation NSString (FCExtension)

+ (void)load{
    NSMutableArray *groupArr = [NSMutableArray array];
    objc_setAssociatedObject(self, groupArrayKey,groupArr ,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    NSMutableArray *unitArr = [NSMutableArray array];
    objc_setAssociatedObject(self, unitArrayKey, unitArr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (NSString *)stringWithSeconds:(NSNumber *)time ifShowHour:(BOOL)showHour{
    if (showHour == YES) {
        NSInteger hours = time.integerValue/3600;
        NSInteger minutes = time.integerValue/60%60;
        NSInteger seconds = time.integerValue%3600 - minutes*60;
        NSString *string = [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)hours, (long)minutes, (long)seconds];
        return string;
    }else{
        NSInteger minutes = time.integerValue/60%60;
        NSInteger seconds = time.integerValue%3600 - minutes*60;
        NSString *string = [NSString stringWithFormat:@"%02ld:%02ld", (long)minutes, (long)seconds];
        return string;
    }
}

+ (NSMutableArray *)arrayWithTimeString:(NSString *)timeString{
    
    NSMutableArray *groupArr = objc_getAssociatedObject(self, groupArrayKey);
    NSMutableArray *unitArr = objc_getAssociatedObject(self, unitArrayKey);
    [groupArr removeAllObjects];
    [unitArr removeAllObjects];
    
    [groupArr addObjectsFromArray:[timeString componentsSeparatedByString:@":"]];
    for (NSString *str in groupArr) {
       char a = [str characterAtIndex:0];
       char b = [str characterAtIndex:1];
        NSString *stra = [NSString stringWithFormat:@"%c",a];
        NSString *strb = [NSString stringWithFormat:@"%c",b];
       [unitArr addObjectsFromArray:[NSArray arrayWithObjects:stra,strb,nil]];
    }
    return unitArr;
}

@end