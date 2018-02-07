//
//  CLAllViewController.m
//  百思不得其解
//
//  Created by LongCh on 2018/2/5.
//  Copyright © 2018年 LongCh. All rights reserved.
//

#import "CLAllViewController.h"

@interface CLAllViewController ()

@end

@implementation CLAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = CLRandomColor;
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
}

@end
