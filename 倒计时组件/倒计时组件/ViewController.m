//
//  ViewController.m
//  倒计时组件
//
//  Created by ccSunday on 16/8/10.
//  Copyright © 2016年 ccSunday. All rights reserved.
//

#import "ViewController.h"
#import "SHTimeHeaders.h"
@interface ViewController ()

@property (nonatomic, strong)SHTimeManager *timeManager;
@property (nonatomic, strong)TimerController *timerController;
@property (nonatomic, strong)UIView *timerView;//时分秒
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = GetColor(redColor);
    // Do any additional setup after loading the view, typically from a nib.
    __weakSelf
    [self.timerController setDurationTime:60*60 TimeInterval:1 timerOnCallBack:^(NSNumber *remainTime, NSInteger remainIntegerTime) {
        if (_timerView == nil) {
            [weakSelf.view addSubview:weakSelf.timerView];
        }
        [weakSelf.timeManager updateTimeWithRemainTime:remainTime];
        
    } timeOutCallBack:^(TimerController *controller) {
        NSLog(@"定时结束");//可以销毁定时器
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIView *)timerView{
    
    if (!_timerView) {
        _timerView = self.timeManager.timerView;
        _timerView.centerX = self.view.centerX;
        _timerView.centerY = self.view.centerY;
    }
    return _timerView;
}
- (SHTimeManager *)timeManager{
    if (!_timeManager) {
        //设置各种frame信息和颜色信息
        SHTimerUIModel *frameModel = [SHTimerUIModel modelWithUnitFrame:CGRectMake(0, 0, 14, 19) unitSpace:1 sectionSpace:10 sectionNum:3];
        frameModel.unitBackColor = [UIColor colorWithHexString:@"#f5fffb"];
        frameModel.unitTextColor = [UIColor colorWithHexString:@"#02beb5"];
        frameModel.sectionTextColor = GetColor(whiteColor);
        //设置manager
        _timeManager = [SHTimeManager managerWithTime:60*60 andBaseUIModel:frameModel andSeperateArray:@[@":",@":"]];
    }
    return _timeManager;
}

#pragma mark 封装NSTimer,快速生成一个倒计时
- (TimerController *)timerController{
    if (!_timerController) {
        _timerController = [[TimerController alloc]init];
    }
    return _timerController;

}
@end
