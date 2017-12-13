//
//  CLTabBar.m
//  百思不得其解
//
//  Created by LongCh on 2017/12/3.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLTabBar.h"

@implementation CLTabBar

#pragma -mark 懒加载
- (UIButton *) publishButton {
    if (!_publishButton) {
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        _publishButton = publishButton;
    }
    return _publishButton;
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
    }
    return self;
}


#pragma -mark 布局子控件
- (void) layoutSubviews {
    [super layoutSubviews];
    //定义控件大小
    CGFloat buttonW = self.CL_wight / 5;
    CGFloat buttonH = self.CL_height;
    
    //重新设置UITabBarButton的frame
    CGFloat tabBarButtonY = 0;
    //按钮索引
    int tabBarButtonIndex = 0;
    //遍历UITabBar所有子控件
    for (UIView *subView in self.subviews) {
        //过滤
        if (subView.class != NSClassFromString(@"UITabBarButton")) {
            continue;
        }
        CGFloat tabBarButtonx = tabBarButtonIndex * buttonW;
        if (tabBarButtonIndex >= 2) {
            tabBarButtonx += buttonW;
        }
        subView.frame = CGRectMake(tabBarButtonx, tabBarButtonY, buttonW, buttonH);
        // 增加索引
        tabBarButtonIndex++;
    }
    //publishButton的Frame
    self.publishButton.CL_wight = buttonW;
    self.publishButton.CL_height = buttonH;
    self.publishButton.CL_centerX = self.CL_wight * 0.5;
    self.publishButton.CL_centerY = self.CL_height * 0.5;
}

/***publishButton 点击事件***/
- (void) publishClick {
    CLLogFunc
}
@end
