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

@interface CLEssenceViewController () <UIScrollViewDelegate>
@property (nonatomic, weak) CLTitleButton *selectedTitleButton;
@property (nonatomic, weak) UIView *indicatorView;
@property (nonatomic, weak) UIScrollView *scrollView;
/** 标题栏 */
@property (nonatomic, weak) UIView *titlesView;
@end

@implementation CLEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationItem];
    [self setupChildViewController];
    [self setupScrollView];
    [self setupTitleView];
    // 默认添加子控制器的view
    [self addChildVcView];
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
    self.titlesView = titleView;
    //添加标题
    NSArray *titleArr = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    NSInteger count = titleArr.count;
    CGFloat buttonW = self.view.CL_wight / count;
    CGFloat buttonH = titleView.CL_height;
    for (int i = 0; i < count; ++i) {
        CLTitleButton *button = [CLTitleButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
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
    // 不允许自动调整scrollView的内边距
    scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    scrollView.frame = self.view.bounds;
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * scrollView.CL_wight,0);
    self.scrollView = scrollView;
}


- (void) setNavigationItem {
    self.view.backgroundColor = CLCommandBgColor;
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
    // 让UIScrollView滚动到对应位置
    CGPoint contentOffset = self.scrollView.contentOffset;
    contentOffset.x = titleButton.tag * self.scrollView.CL_wight;
    [self.scrollView setContentOffset:contentOffset animated:YES];
}
/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 人为拖拽scrollView产生的滚动动画
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 选中\点击对应的按钮
    NSUInteger index = scrollView.contentOffset.x / scrollView.CL_wight;
    CLTitleButton *titleButton = self.titlesView.subviews[index];
    [self titleClick:titleButton];
    
    // 添加子控制器的view
    [self addChildVcView];
}
/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 使用setContentOffset:animated:或者scrollRectVisible:animated:方法让scrollView产生滚动动画
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self addChildVcView];
}

- (void) tagClick {
    CLLogFunc
}

#pragma mark - 添加子控制器的view
- (void) addChildVcView {
     NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.CL_wight;
    UIView *childVcView = self.childViewControllers[index].view;
    if (childVcView.superview) return;
    childVcView.frame = self.scrollView.bounds;
    [self.scrollView addSubview:childVcView];
}
@end
