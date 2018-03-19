//
//  CLRefreshNormalHeader.m
//  百思不得其解
//
//  Created by LongCh on 2018/3/19.
//  Copyright © 2018年 LongCh. All rights reserved.
//

#import "CLRefreshNormalHeader.h"
@interface CLRefreshNormalHeader()

@end

@implementation CLRefreshNormalHeader

- (void) prepare {
    [super prepare];
    self.automaticallyChangeAlpha = YES;
    self.lastUpdatedTimeLabel.textColor = [UIColor orangeColor];
    self.stateLabel.textColor = [UIColor orangeColor];
    [self setTitle:@"赶紧下拉吧" forState:MJRefreshStateIdle];
    [self setTitle:@"赶紧松开吧" forState:MJRefreshStatePulling];
    [self setTitle:@"正在加载数据..." forState:MJRefreshStateRefreshing];
    //    self.lastUpdatedTimeLabel.hidden = YES;
    //    self.stateLabel.hidden = YES;
    [self addSubview:[[UISwitch alloc] init]];
    
    UIImageView *logo = [[UIImageView alloc] init];
    logo.image = [UIImage imageNamed:@"bd_logo1"];
    [self addSubview:logo];
    self.logo = logo;
}

/**
 *  摆放子控件
 */
- (void)placeSubviews
{
    [super placeSubviews];
    
    self.logo.CL_wight = self.CL_wight;
    self.logo.CL_height = 50;
    self.logo.CL_X = 0;
    self.logo.CL_Y = - 50;
}
@end
