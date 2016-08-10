//
//  SHTimerModel.h
//  SpaceHome
//
//  Created by ccSunday on 16/8/4.
//
//


#import <Foundation/Foundation.h>
#import "SHTimerUIModel.h"
#import "NSString+FCExtension.h"
@interface SHTimerModel : NSObject

@property (nonatomic, strong)NSString *auction;//auction string  是否开始竞拍    0 竞拍已结束  1正在竞拍中，不显示倒计时   2 还未开始竞拍，显示倒计时
@property (nonatomic, strong)NSString *startHour;
@property (nonatomic, strong)NSString *hour;
@property (nonatomic, strong)NSString *minute;
@property (nonatomic, strong)NSString *second;

/********************************以上是服务器获得的数据************************/

@property (nonatomic, strong)SHTimerUIModel *frameModel;//暂未用到

/**
 *  倒计时剩余时间：需要用NSString+FCExtension分类转化成 00：00：00的格式
 */
@property (nonatomic, strong)NSString *totalTimeStr;
/**
 *  分隔字符传入自定义分隔字符如：时分秒等
 */
@property (nonatomic, strong)NSArray *seperateArray;
@end
