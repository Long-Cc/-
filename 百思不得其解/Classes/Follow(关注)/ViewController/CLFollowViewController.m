//
//  CLFollowViewController.m
//  百思不得其解
//
//  Created by LongCh on 2017/12/3.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLFollowViewController.h"

@interface CLFollowViewController ()

@end

@implementation CLFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CLLogFunc
    
    [self.view setBackgroundColor:CLGrayColor(206)];
    [self.navigationItem setTitle:@"我的关注"];
    self.navigationItem.leftBarButtonItem = [CLItemManager itemWithImage:@"friendsRecommentIcon" hightImage:@"friendsRecommentIcon-click" target:self action:@selector(tagClick)];;
}

- (void) tagClick {
    CLLogFunc
}

@end
