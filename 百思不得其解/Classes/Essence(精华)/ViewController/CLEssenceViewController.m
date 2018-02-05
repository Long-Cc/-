//
//  CLEssenceViewController.m
//  百思不得其解
//
//  Created by LongCh on 2017/12/3.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLEssenceViewController.h"
#import "CLTitleButton.h"
#import "CLAllViewController.h"
#import "CLVideoViewController.h"
#import "CLVoiceViewController.h"
#import "CLPictureViewController.h"
#import "CLWordViewController.h"

@interface CLEssenceViewController ()
@property (nonatomic, weak) CLTitleButton *selectedTitleButton;
@property (nonatomic, weak) UIView *indicatorView;
@end

@implementation CLEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationItem];
    [self setupChildViewController];
    [self setupScrollView];
    [self setupTitleView];
}


- (void) setupChildViewController {
    CLAllViewController *allViewController = [[CLAllViewController alloc] init];
    [self addChildViewController:allViewController];
    
    CLVideoViewController *videoViewController = [[CLVideoViewController alloc] init];
    [self addChildViewController:videoViewController];
    
    CLVoiceViewController *voiceViewController = [[CLVoiceViewController alloc] init];
    [self addChildViewController:voiceViewController];
    
    CLPictureViewController *pictureViewController = [[CLPictureViewController alloc] init];
    [self addChildViewController:pictureViewController];
    
    CLWordViewController *wordViewController = [[CLWordViewController alloc] init];
    [self addChildViewController:wordViewController];
}



- (void) setupTitleView {
    UIView *titleView = [[UIView alloc] init];
    titleView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.2];
    titleView.frame = CGRectMake(0, 64, self.view.CL_wight, 35);
    [self.view addSubview:titleView];
    //添加标题
    NSArray *titleArr = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    NSInteger count = titleArr.count;
    CGFloat buttonW = self.view.CL_wight / count;
    CGFloat buttonH = titleView.CL_height;
    for (int i = 0; i < count; ++i) {
        CLTitleButton *button = [CLTitleButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        button.frame = CGRectMake(i * buttonW, 0, buttonW, buttonH);
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:button];
    }
    
    CLTitleButton *firstTitleButton = titleView.subviews.firstObject;
    
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [firstTitleButton titleColorForState:UIControlStateSelected];
    indicatorView.CL_height = 1;
    indicatorView.CL_Y = titleView.CL_height - indicatorView.CL_height;
    [titleView addSubview:indicatorView];
    self.indicatorView = indicatorView;
    
    [firstTitleButton.titleLabel sizeToFit];
    indicatorView.CL_wight = firstTitleButton.titleLabel.CL_wight;
    indicatorView.CL_centerX = firstTitleButton.CL_centerX;
    // 默认情况 : 选中最前面的标题按钮
    firstTitleButton.selected = YES;
    self.selectedTitleButton = firstTitleButton;
}


- (void) setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    scrollView.backgroundColor = CLRandomColor;
    scrollView.frame = self.view.bounds;
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    
    NSUInteger count = self.childViewControllers.count;
    for (int i = 0; i < count; ++i) {
        UITableView *childVCView = (UITableView *)self.childViewControllers[i].view;
        childVCView.backgroundColor = CLRandomColor;
        childVCView.CL_X =  i * childVCView.CL_wight;
        childVCView.CL_Y = 0;
        childVCView.CL_height = scrollView.CL_height;
        [scrollView addSubview:childVCView];
        //内边距
        childVCView.contentInset =  UIEdgeInsetsMake(99, 0, 49, 0);
        childVCView.scrollIndicatorInsets = childVCView.contentInset;
    }
    scrollView.contentSize = CGSizeMake(count * scrollView.CL_wight,0);
}


- (void) setNavigationItem {
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [CLItemManager itemWithImage:@"MainTagSubIcon" hightImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
}

- (void) titleClick:(CLTitleButton *)titleButton {
    self.selectedTitleButton.selected = NO;
    titleButton.selected = YES;
    self.selectedTitleButton = titleButton;
     // 指示器
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.CL_wight = titleButton.titleLabel.CL_wight;
        self.indicatorView.CL_centerX = titleButton.CL_centerX;
    }];
}


- (void) tagClick {
    CLLogFunc
}
@end
