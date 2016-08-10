//
//  SHTimerFrameModel.m
//  SpaceHome
//
//  Created by ccSunday on 16/8/5.
//
//

#import "SHTimerUIModel.h"

@implementation SHTimerUIModel
+ (instancetype)modelWithUnitFrame:(CGRect)unitFrame unitSpace:(CGFloat)unitSpace sectionSpace:(CGFloat)groupSpace sectionNum:(NSInteger)num{
    return [[self alloc]initWithUnitFrame:unitFrame unitSpace:unitSpace sectionSpace:groupSpace sectionNum:num];
}

- (instancetype)initWithUnitFrame:(CGRect)unitFrame unitSpace:(CGFloat)unitSpace  sectionSpace:(CGFloat)groupSpace sectionNum:(NSInteger)num{
    if (self = [super init]) {
        self.unitFrame = unitFrame;
        self.unitSpace = unitSpace;
        self.sectionNum = num;
        self.groupSpace = groupSpace;
    }
    return self;
}
@end
