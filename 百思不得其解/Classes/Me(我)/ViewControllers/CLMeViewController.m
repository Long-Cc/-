//
//  CLMeViewController.m
//  百思不得其解
//
//  Created by LongCh on 2017/12/3.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLMeViewController.h"
#import "CLSettingController.h"
#import "CLLoginRegisterViewController.h"
#import "CLMeTableViewCell.h"
#import "CLTableViewFootView.h"


@implementation CLMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CLLogFunc
    [self initNavigationItem];
    self.tableView.contentInset = UIEdgeInsetsMake(CLMargin - 35, 0, 0, 0);
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = CLMargin;
    self.tableView.tableFooterView = [[CLTableViewFootView alloc] init];
}


#pragma -mark -数据源方法 代理方法
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"meCell";
    CLMeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[CLMeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = @"登录/注册";
        [cell.imageView setImage:[UIImage imageNamed:@"setup-head-default"]];
    } else {
        cell.textLabel.text = @"离线下载";
        cell.imageView.image = nil;//重用Cell时删除队列中的cell设置的image
    }
    return cell;
}


#pragma -mark -点击事件
- (void) setterClick {
    CLSettingController *settingController = [[CLSettingController alloc] init];
    [self.navigationController pushViewController:settingController animated:YES];
}
- (void) moonClick {
    CLLogFunc
}


#pragma -mark -私有方法
- (void) initNavigationItem {
    [self.view setBackgroundColor:CLGrayColor(206)];
    [self.navigationItem setTitle:@"我的"];
    UIBarButtonItem *setItemBtn = [CLItemManager itemWithImage:@"mine-setting-icon" hightImage:@"mine-setting-icon-click" target:self action:@selector(setterClick)];
    UIBarButtonItem *moonItemBtn = [CLItemManager itemWithImage:@"mine-moon-icon" hightImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
    self.navigationItem.rightBarButtonItems = @[setItemBtn,moonItemBtn];
}
@end
