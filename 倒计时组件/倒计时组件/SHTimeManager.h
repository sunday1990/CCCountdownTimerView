//
//  SHTimeManager.h
//  SpaceHome
//
//  Created by ccSunday on 16/8/5.
//
//

#import <Foundation/Foundation.h>
#import "SHTimerUIModel.h"
#import "SHTimerModel.h"
#import "SHTimeUnitLabel.h"
#import "NSString+FCExtension.h"
@interface SHTimeManager : NSObject
/**
 *  通过携带倒计时的基本UI信息model和数据model来获取一个封装好了的倒计时view
 *
 *  @param frameModel
 *  @param dataModel
 *
 *  @return 
 */
+ (instancetype)managerWithTimerFrameModel:(SHTimerUIModel *)frameModel andTimerDataModel:(SHTimerModel *)dataModel;

/**
 *  根据传入的秒数和基本UI信息Model获得一个封装好了的倒计时view
 *
 *  @param time  传入的秒数
 *  @param uiModel UImodel
 *
 *  @return
 */
+ (instancetype)managerWithTime:(NSInteger)time andBaseUIModel:(SHTimerUIModel *)uiModel andSeperateArray:(NSArray *)seperateArray;

@property (nonatomic, strong)UIView *timerView;
/**
 *  位置及颜色等基础UI信息模型
 */
@property (nonatomic, strong)SHTimerUIModel *frameModel;
/**
 *  携带数据的模型
 */
@property (nonatomic, strong)SHTimerModel *dataModel;
/**
 *  分隔符数组
 */
@property (nonatomic, strong)NSArray *seperateArray;


/**
 *  放入定时器方法中刷新
 *
 *  @param timerModel
 */
- (void)updateTimeWithModel:(SHTimerModel *)timerModel;
/**
 *  放入定时器中刷新
 *
 *  @param remainTime 剩余时间
 */
- (void)updateTimeWithRemainTime:(NSNumber *)remainTime;
/**
 *  放入定时器中刷新
 *
 *  @param remainTime 剩余时间
 */
- (void)updateTimeWithRemainIntegerTime:(NSInteger )remainTime;


@end