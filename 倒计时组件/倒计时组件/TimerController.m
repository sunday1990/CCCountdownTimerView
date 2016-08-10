//
//  TimerController.m
//  FocusCircle
//
//  Created by Liang Zhao on 15/6/25.
//  Copyright © 2015年 Liang Zhao. All rights reserved.
//

#import "TimerController.h"

@implementation TimerController

- (void)sharedNotification{
    static  dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveLogOutNotification) name:@"logout" object:nil];
    });
}

- (void)setDurationTime:(NSInteger)durationTime TimeInterval:(NSInteger)interval timerOnCallBack:(void (^)(NSNumber *, NSInteger))onCallBack timeOutCallBack:(void (^)(TimerController *))outCallBack{

    [self sharedNotification];
    self.interval = interval;
    _remainingTime = [NSNumber numberWithInteger:durationTime];
    _currentStatus = TimerStopped;
    _durationTime = [[NSNumber numberWithInteger:durationTime]copy];
    
    self.TimerOnBlock = onCallBack;
    self.TimerOutBlock = outCallBack;
    
    NSTimer *countdownTimer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(countdownForTimer:) userInfo:self repeats:YES];
    self.timer = countdownTimer;
    countdownTimer = nil;
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.timer fire];

}

-(void)countdownForTimer: (NSTimer *)sender{
    if (sender.valid) {
        TimerController *timerController = (TimerController *)sender.userInfo;
        NSInteger remainIntegerTime = timerController.remainingTime.integerValue;
        if(timerController.remainingTime.integerValue > 0){
            NSNumber *oldNumer = timerController.remainingTime;
            timerController.remainingTime = [[NSNumber numberWithDouble:oldNumer.doubleValue - self.interval] copy];
            oldNumer = nil;
            self.TimerOnBlock(timerController.remainingTime,remainIntegerTime);
        }else{
            [timerController.timer invalidate];
            timerController.timer = nil;
            timerController.currentStatus = TimerStopped;
            timerController.remainingTime = timerController.durationTime;
            self.TimerOutBlock(timerController);
        }
    }
}

- (void)receiveLogOutNotification{
    [self.timer invalidate];
    self.timer = nil;
    self.currentStatus = TimerStopped;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"logout" object:nil];

}

@end