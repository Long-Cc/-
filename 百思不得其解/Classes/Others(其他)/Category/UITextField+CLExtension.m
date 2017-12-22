//
//  UITextField+CLExtension.m
//  百思不得其解
//
//  Created by LongCh on 2017/12/15.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "UITextField+CLExtension.h"
static NSString *const placeholderColorKey = @"placeholderLabel.textColor";

@implementation UITextField (CLExtension)

- (void) setPlaceholderColor:(UIColor *)placeholderColor {
    //提前设置占位文字, 目的 : 让它提前创建placeholderLabel
    NSString *oldPlaceholder = self.placeholder;
    self.placeholder = @" ";
    self.placeholder = oldPlaceholder;
    if (placeholderColor == nil) {
        //默认占位文字颜色
        placeholderColor = [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
    }
    [self setValue:placeholderColor forKeyPath:placeholderColorKey];
}

//- (void)setPlaceholderColor:(UIColor *)placeholderColor
//{
//    // 提前设置占位文字, 目的 : 让它提前创建placeholderLabel
//    if (self.placeholder.length == 0) {
//        self.placeholder = @" ";
//    }
//    [self setValue:placeholderColor forKeyPath:placeholderColorKey];
//}

- (UIColor *) placeholderColor {
    return [self valueForKeyPath:placeholderColorKey];
}
@end
