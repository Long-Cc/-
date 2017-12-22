//
//  CLMeFootButton.m
//  百思不得其解
//
//  Created by LongCh on 2017/12/19.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLMeFootButton.h"
#import "UIButton+WebCache.h"

@implementation CLMeFootButton

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
    }
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.CL_Y = self.CL_height * 0.15;
    self.imageView.CL_height = self.CL_height * 0.5;
    self.imageView.CL_wight = self.imageView.CL_height;
    self.imageView.CL_centerX = self.CL_wight * 0.5;
    
    self.titleLabel.CL_X = 0;
    self.titleLabel.CL_Y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.CL_wight = self.CL_wight;
    self.titleLabel.CL_height = self.CL_height - self.titleLabel.CL_Y;
}

- (void) setSquare:(CLSquare *)square {
    _square = square;
    
    [self setTitle:square.name forState:UIControlStateNormal];
    [self sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"setup-head-default"]];
}

@end
