//
//  CLSettingController.m
//  百思不得其解
//
//  Created by LongCh on 2017/12/6.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLSettingController.h"

@interface CLSettingController ()

@end

@implementation CLSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:CLRandomColor];
    self.navigationItem.title = @"设置";
}

@end
