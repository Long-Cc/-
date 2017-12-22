//
//  TabBarViewController.m
//  百思不得其解
//
//  Created by LongCh on 2017/11/27.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "TabBarViewController.h"
#import "CLTabBar.h"
#import "CLEssenceViewController.h"
#import "CLNewPostsViewController.h"
#import "CLFollowViewController.h"
#import "CLMeViewController.h"


@implementation TabBarViewController

- (void) viewDidLoad {
    
    [super viewDidLoad];
    
    /**** 设置所有UITabBarItem的文字属性 ****/
    [self setupItemTitleTextAttributes];
    
    /**** 添加子控制器 ****/
    [self setupChildViewControllers];
    
    /**** 更换TabBar ****/
    [self setupTabBar];
    
}

- (void) setupItemTitleTextAttributes {
    
    UITabBarItem *item = [UITabBarItem appearance];
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void) setupChildViewControllers {
    //添加子控制器
    [self setupOneChildViewController:[[CLNavigationController alloc] initWithRootViewController:[[CLEssenceViewController alloc] init]] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    [self setupOneChildViewController:[[CLNavigationController alloc] initWithRootViewController:[[CLNewPostsViewController alloc] init]] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    [self setupOneChildViewController:[[CLNavigationController alloc] initWithRootViewController:[[CLFollowViewController alloc] init]] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    [self setupOneChildViewController:[[CLNavigationController alloc] initWithRootViewController:[[CLMeViewController alloc] initWithStyle:UITableViewStyleGrouped]] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
}

- (void) setupTabBar {
    [self setValue:[[CLTabBar alloc]  init] forKeyPath:@"tabBar"];
}

/**
 *  初始化一个子控制器
 *
 *  @param vc            子控制器
 *  @param title         标题
 *  @param image         图标
 *  @param selectedImage 选中的图标
 */
- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    vc.tabBarItem.title = title;
    if (image.length) { // 图片名有具体值
        vc.tabBarItem.image = [UIImage imageNamed:image];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    [self addChildViewController:vc];
}

@end
