//
//  SHTimeHeaders.h
//  SpaceHome
//
//  Created by ccSunday on 16/8/8.
//
//

#ifndef SHTimeHeaders_h
#define SHTimeHeaders_h
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SHTimerModel.h"
#import "SHTimerUIModel.h"
#import "TimerController.h"
#import "NSString+FCExtension.h"
#import "SHTimeManager.h"
#import "UIView+frame.h"
#import "UIColor+expanded.h"

#define GetColor(color) [UIColor color]
#define GetImage(imageName)  [UIImage imageNamed:imageName]
#define GetFont(x) [UIFont systemFontOfSize:x]
#define GetBoldFont(x) [UIFont boldSystemFontOfSize:x]
#define __weakSelf typeof(self) __weak weakSelf = self;

#endif /* SHTimeHeaders_h */
