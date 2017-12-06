//
//  CLEssenceViewController.m
//  百思不得其解
//
//  Created by LongCh on 2017/12/3.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLEssenceViewController.h"

@interface CLEssenceViewController ()

@end

@implementation CLEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:CLGrayColor(206)];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [CLItemManager itemWithImage:@"MainTagSubIcon" hightImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];;
}

- (void) tagClick {
    CLLogFunc
}

@end
