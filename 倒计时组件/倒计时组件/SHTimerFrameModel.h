//
//  SHTimerFrameModel.h
//  SpaceHome
//
//  Created by ccSunday on 16/8/5.
//
//

#import <Foundation/Foundation.h>
#import "SHTimeHeaders.h"
@interface SHTimerFrameModel : NSObject
/**
 *
 *
 *  @param unitFrame  单个组件的frame
 *  @param unitSpace  单个组件间距
 *  @param groupSpace 组间距
 *  @param num        组个数
 *
 *  @return 包含位置信息的model实例
 */
+ (instancetype)modelWithUnitFrame:(CGRect)unitFrame unitSpace:(CGFloat)unitSpace sectionSpace:(CGFloat)groupSpace sectionNum:(NSInteger)num;
/**
 * 单个组件的frame
 */
@property (nonatomic,assign)CGRect  unitFrame;
/**
 *  单个组件间距
 */
@property (nonatomic,assign)CGFloat unitSpace;
/**
 *  组间距
 */
@property (nonatomic,assign)CGFloat groupSpace;
/**
 *  组个数
 */
@property (nonatomic,assign)NSInteger sectionNum;

/**
 *  组单元的背景色
 */
@property (nonatomic, strong)UIColor *unitBackColor;
/**
 *  组单元的文字颜色
 */
@property (nonatomic, strong)UIColor *unitTextColor;
/**
 *  组提示的文字颜色
 */
@property (nonatomic, strong)UIColor *sectionTextColor;

@end
