//
//  SHTimeManager.m
//  SpaceHome
//
//  Created by ccSunday on 16/8/5.
//
//

#import "SHTimeManager.h"
@interface SHTimeManager ()
@property (nonatomic, strong)NSMutableArray *labelArray;
@property (nonatomic, strong)NSMutableArray *numUnitArray;
@end
@implementation SHTimeManager

+ (instancetype)managerWithTimerFrameModel:(SHTimerUIModel *)frameModel andTimerDataModel:(SHTimerModel *)dataModel{
    return [[self alloc]initWithTimerFrameModel:frameModel andTimerDataModel:dataModel];
}

+ (instancetype)managerWithTime:(NSInteger)time andBaseUIModel:(SHTimerUIModel *)uiModel andSeperateArray:(NSArray *)seperateArray{
    return [[self alloc]initWithTotalTime:time andBaseUIModel:uiModel andSeperateArray:seperateArray];
}

- (instancetype)initWithTimerFrameModel:(SHTimerUIModel *)frameModel andTimerDataModel:(SHTimerModel *)dataModel{
    if (self = [super init]) {
        self.frameModel = frameModel;
        self.dataModel = dataModel;
        self.seperateArray = self.dataModel.seperateArray;
        self.labelArray = [NSMutableArray array];
        [self config];
    }
    return self;
}

- (instancetype)initWithTotalTime:(NSInteger)time andBaseUIModel:(SHTimerUIModel *)uiModel andSeperateArray:(NSArray *)seperateArray{

    if (self = [super init]) {
        self.frameModel = uiModel;
        self.labelArray = [NSMutableArray array];
        self.seperateArray = seperateArray;
        [self config];
    }
    return self;
}

- (void)config{
    UIView *baseView = [[UIView alloc]init];
    baseView.backgroundColor = GetColor(clearColor);
    for (int i = 0;i < self.frameModel.sectionNum ; i++) {
        for (int j = 0; j<2; j++) {
            SHTimeUnitLabel *timeLabel = [[SHTimeUnitLabel alloc]initWithFrame:CGRectMake(i*(self.frameModel.unitFrame.size.width*2+self.frameModel.unitSpace+self.frameModel.groupSpace)+j*(self.frameModel.unitFrame.size.width+self.frameModel.unitSpace), 0,self.frameModel.unitFrame.size.width, self.frameModel.unitFrame.size.height)];
            timeLabel.textAlignment = NSTextAlignmentCenter;
            timeLabel.backgroundColor = self.frameModel.unitBackColor == nil?GetColor(whiteColor):self.frameModel.unitBackColor;
            timeLabel.textColor = self.frameModel.unitTextColor == nil?[UIColor colorWithHexString:@"0x666666"]:self.frameModel.unitTextColor;
            timeLabel.layer.cornerRadius = 5;
            timeLabel.layer.borderWidth = 1;
            timeLabel.font = GetFont(13);
            timeLabel.clipsToBounds = YES;
            timeLabel.layer.borderColor = GetColor(whiteColor).CGColor;
            [baseView addSubview:timeLabel];
            if (i == self.frameModel.sectionNum-1&&j==1) {
                baseView.frame = CGRectMake(0, 0, timeLabel.right, timeLabel.height);
            }
            [self.labelArray addObject:timeLabel];
        }
        if (i==self.seperateArray.count) {
            continue;
        }else{
            UILabel *seperateLabel = [[UILabel alloc]initWithFrame:CGRectMake((self.frameModel.unitFrame.size.width*2+self.frameModel.unitSpace)+i*(self.frameModel.unitFrame.size.width*2+self.frameModel.unitSpace+self.frameModel.groupSpace), 0, self.frameModel.groupSpace, self.frameModel.unitFrame.size.height)];
            seperateLabel.font = GetFont(12);
            seperateLabel.textAlignment = NSTextAlignmentCenter;
            seperateLabel.text = self.seperateArray[i];
            seperateLabel.textColor = self.frameModel.sectionTextColor == nil?[UIColor colorWithHexString:@"0x666666"]:self.frameModel.sectionTextColor;
            [baseView addSubview:seperateLabel];
            if (i == self.frameModel.sectionNum-1) {
                baseView.frame = CGRectMake(0, 0, seperateLabel.right, self.frameModel.unitFrame.size.height);
            }
        }
    }
    baseView.layer.cornerRadius = 3;
    self.timerView = baseView;
}

- (void)updateTimeWithModel:(SHTimerModel *)timerModel{

    [self updateTimeWithSpecialTimeString:timerModel.totalTimeStr];
    
}

- (void)updateTimeWithRemainTime:(NSNumber *)remainTime{
    NSString *timeString;
    if (self.frameModel.sectionNum == 2) {
      timeString = [NSString stringWithSeconds:remainTime ifShowHour:NO] ;
    }else{
      timeString = [NSString stringWithSeconds:remainTime ifShowHour:YES] ;
    }
    [self updateTimeWithSpecialTimeString:timeString];
}

- (void)updateTimeWithRemainIntegerTime:(NSInteger)remainTime{
    NSString *timeString;
    if (self.frameModel.sectionNum == 2) {
        timeString = [NSString stringWithSeconds:[NSNumber numberWithInteger:remainTime] ifShowHour:NO] ;
    }else{
        timeString = [NSString stringWithSeconds:[NSNumber numberWithInteger:remainTime] ifShowHour:YES] ;
    }
    [self updateTimeWithSpecialTimeString:timeString];
}

- (void)updateTimeWithSpecialTimeString:(NSString *)timeString{
    [self.numUnitArray removeAllObjects];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        self.numUnitArray = [NSString arrayWithTimeString:timeString];
        int i = 0;
        for (SHTimeUnitLabel *label in self.labelArray) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.numUnitArray.count == 0) {
                    return ;
                }
                label.text = self.numUnitArray[i];
            });
            i++;
        }
    });
}

- (NSMutableArray *)numUnitArray{
    if (!_numUnitArray) {
        _numUnitArray = [NSMutableArray array];
    }
    return _numUnitArray;
}
@end