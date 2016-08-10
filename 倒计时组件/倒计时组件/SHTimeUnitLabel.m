//
//  SHTimeUnitLabel.m
//  SpaceHome
//
//  Created by ccSunday on 16/8/5.
//
//

#import "SHTimeUnitLabel.h"

@implementation SHTimeUnitLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    
        self.backgroundColor = GetColor(clearColor);

    }
    return self;

}

@end
