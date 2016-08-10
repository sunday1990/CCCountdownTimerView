//
//  TimerController.h
//  FocusCircle
//
//  Created by Liang Zhao on 15/6/25.
//  Copyright © 2015年 Liang Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum{
    TimerStopped = 0,
    TimerPausing,
    TimerRunning
}Status;
@interface TimerController : NSObject
@property (copy, nonatomic) NSNumber *durationTime; //总的时间 秒数
@property (nonatomic,assign)NSInteger interval;     //时间间隔
@property (copy, nonatomic) NSNumber *remainingTime;//剩余时间 秒数
@property (strong, nonatomic) NSTimer *timer;       //定时器
@property (nonatomic) Status currentStatus;         //定时器状态
@property (nonatomic,copy)void(^TimerOnBlock)(NSNumber *remaintime,NSInteger remainIntegerTime);
@property (nonatomic,copy)void(^TimerOutBlock)(TimerController *controller);

/**
 *
 *
 *  @param durationTime  设置倒计时开始的秒数
 *  @param interval      时间间隔
 *  @param onCallBack    倒计时开始后的回调
 *  @param outCallBack   倒计时结束时候的回调
 */
- (void)setDurationTime:(NSInteger )durationTime TimeInterval:(NSInteger)interval timerOnCallBack:(void(^)(NSNumber *remainTime,NSInteger remainIntegerTime))onCallBack timeOutCallBack:(void(^)(TimerController *controller))outCallBack;

@end
