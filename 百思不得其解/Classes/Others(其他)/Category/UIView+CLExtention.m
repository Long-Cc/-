//
//  UIView+CLExtention.m
//  百思不得其解
//
//  Created by LongCh on 2017/11/30.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "UIView+CLExtention.h"

@implementation UIView (CLExtention)

- (void) setCL_size:(CGSize)CL_size {
    CGRect frame = self.frame;
    frame.size = CL_size;
    self.frame = frame;
}
- (CGSize) CL_size {
    return self.frame.size;
}

- (void) setCL_wight:(CGFloat)CL_wight {
    CGRect fame = self.frame;
    fame.size.width = CL_wight;
    self.frame = fame;
}
- (CGFloat) CL_wight {
    return self.frame.size.width;
}

- (void) setCL_height:(CGFloat)CL_height {
    CGRect fame = self.frame;
    fame.size.height = CL_height;
    self.frame = fame;
}
- (CGFloat) CL_height {
    return self.frame.size.height;
}

- (void) setCL_X:(CGFloat)CL_X {
    CGRect fame = self.frame;
    fame.origin.x = CL_X;
    self.frame = fame;
}
- (CGFloat) CL_X {
    return self.frame.origin.x;
}


- (void) setCL_Y:(CGFloat)CL_Y {
    CGRect fame = self.frame;
    fame.origin.y = CL_Y;
    self.frame = fame;
}
- (CGFloat) CL_Y {
    return self.frame.origin.y;
}

- (void) setCL_centerX:(CGFloat)CL_centerX {
    CGPoint center = self.center;
    center.x = CL_centerX;
    self.center = center;
}
- (CGFloat) CL_centerX {
    return self.center.x;
}

- (void) setCL_centerY:(CGFloat)CL_centerY {
    CGPoint center = self.center;
    center.y = CL_centerY;
    self.center = center;
}
- (CGFloat) CL_centerY {
    return self.center.y;
}
@end
