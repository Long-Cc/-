//
//  CLTableViewFootView.m
//  百思不得其解
//
//  Created by LongCh on 2017/12/17.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLTableViewFootView.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "CLSquare.h"
#import "UIButton+WebCache.h"
#import "CLMeFootButton.h"
#import "CLWebViewController.h"
#import <SafariServices/SafariServices.h>

@implementation CLTableViewFootView
//http://api.budejie.com/api/api_open.php?a=square&c=topic
- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
       //参数
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params setValue:@"square" forKey:@"a"];
        [params setValue:@"topic" forKey:@"c"];
        
        [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
//            [responseObject writeToFile:@"/Users/mac/Desktop/me.plist" atomically:YES];
            // 字典数组 -> 模型数组
            NSArray *squares = [CLSquare mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
            // 根据模型数据创建对应的控件
            [self createSquares:squares];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"请求失败：%@",error);
        }];
        
    }
    return self;
}
//根据模型创建对应得控件
- (void) createSquares:(NSArray *)squares {
    //方块个数
    NSInteger cout = squares.count;
    //方块的大小
    int maxColsCount = 4;//一行多少个按钮；
    CGFloat buttonW = self.CL_wight / maxColsCount;
    CGFloat buttonH = buttonW;
    //循环创建方块按钮
    for (int i = 0; i < cout; ++i) {
        //得到模型数据
        CLSquare *square = squares [i];
        //创建按钮
        CLMeFootButton *button = [CLMeFootButton buttonWithType:UIButtonTypeCustom];
        button.CL_X = (i % maxColsCount) * buttonW;
        button.CL_Y = (i / maxColsCount) * buttonH;
        button.CL_wight = buttonW;
        button.CL_height = buttonH;

        [button addTarget:self action:@selector(buttonClcik:) forControlEvents:UIControlEventTouchUpInside];
        
        //设置数据
        button.square = square;
        
        self.CL_height = CGRectGetMaxY(((CLTableViewFootView *)[self.subviews lastObject]).frame);
        [self addSubview:button];
    }
    // 设置footer的高度 == 最后一个按钮的bottom(最大Y值)
    self.CL_height = CGRectGetMaxY(self.subviews.lastObject.frame);
    UITableView *tableView =(UITableView *)[self superview];
    tableView.tableFooterView = self;
    [tableView reloadData]; // 重新刷新数据(会重新计算contentSize)
}

- (void) buttonClcik:(CLMeFootButton *)button {
    CLSquare *square = button.square;
    NSString *url = square.url;
    if ([url hasPrefix:@"http"]) {
        UITabBarController *tabBarVc = (UITabBarController *)self.window.rootViewController;
//        UINavigationController *nav = tabBarVc.selectedViewController;
//        CLWebViewController *webViewCOntroller = [[CLWebViewController alloc] init];
//        webViewCOntroller.url = url;
//        webViewCOntroller.navigationItem.title = square.name;
//        [nav pushViewController:webViewCOntroller animated:YES];
        SFSafariViewController *safari = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:url]];
        [tabBarVc presentViewController:safari animated:YES completion:nil];
        
        
    } else if ([url hasPrefix:@"mod:"]) {
        NSLog(@"跳转到自己的定义的页面");
    } else {
        NSLog(@"不是http或者mod协议的");
    }
}

//- (NSArray *) removeRepetitionWithArray:(NSArray *)array {
//    NSMutableArray *mutableArr = [NSMutableArray arrayWithArray:array];
//    if (!mutableArr.count) {
//
//    }
//    return mutableArr;
//}


@end
