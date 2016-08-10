//
//  SHTimerModel.m
//  SpaceHome
//
//  Created by ccSunday on 16/8/4.
//
//

#import "SHTimerModel.h"

@implementation SHTimerModel
- (SHTimerUIModel *)frameModel{
    if (!_frameModel) {
        _frameModel = [SHTimerUIModel modelWithUnitFrame:CGRectMake(0, 0, 20, 40) unitSpace:1 sectionSpace:10 sectionNum:3];
    }
    return _frameModel;
}

- (NSString *)totalTimeStr{
    if (!_totalTimeStr) {
        _totalTimeStr = [NSString string];
    }
    return _totalTimeStr;
}


@end
