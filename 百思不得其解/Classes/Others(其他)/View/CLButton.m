//
//  CLButton.m
//  百思不得其解
//
//  Created by LongCh on 2017/12/11.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLButton.h"

@implementation CLButton

- (void) awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    self.imageView.CL_Y = 0;
    self.imageView.CL_centerX = self.CL_wight * 0.5;
    
    self.titleLabel.CL_X = 0;
    self.titleLabel.CL_Y = self.imageView.CL_height;
    self.titleLabel.CL_height = self.CL_height - self.imageView.CL_height;
    self.titleLabel.CL_wight = self.CL_wight;
}
@end
