//
//  CLMeViewController.m
//  百思不得其解
//
//  Created by LongCh on 2017/12/3.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLMeViewController.h"

@interface CLMeViewController ()

@end

@implementation CLMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:CLGrayColor(206)];
    [self.navigationItem setTitle:@"我的"];
    UIBarButtonItem *setItemBtn = [CLItemManager itemWithImage:@"mine-setting-icon" hightImage:@"mine-setting-icon-click" target:self action:@selector(setterClick)];
    UIBarButtonItem *moonItemBtn = [CLItemManager itemWithImage:@"mine-moon-icon" hightImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
    self.navigationItem.rightBarButtonItems = @[setItemBtn,moonItemBtn];
}

- (void) setterClick {
    CLLogFunc
}
- (void) moonClick {
    CLLogFunc
}
@end
