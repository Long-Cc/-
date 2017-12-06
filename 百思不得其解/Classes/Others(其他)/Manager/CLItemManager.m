//
//  CLItemManager.m
//  百思不得其解
//
//  Created by LongCh on 2017/12/4.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLItemManager.h"

@implementation CLItemManager

+ (UIBarButtonItem *) itemWithImage:(NSString *)imageNormol hightImage:(NSString *)hightImage target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageNormol] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
