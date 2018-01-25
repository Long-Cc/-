//
//  CLTitleButton.m
//  百思不得其解
//
//  Created by LongCh on 2017/12/29.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLTitleButton.h"

@implementation CLTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {
}

@end
