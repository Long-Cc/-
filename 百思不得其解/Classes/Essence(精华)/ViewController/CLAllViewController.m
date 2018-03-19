//
//  CLAllViewController.m
//  百思不得其解
//
//  Created by LongCh on 2018/2/5.
//  Copyright © 2018年 LongCh. All rights reserved.
//

#import "CLAllViewController.h"
#import "CLTopic.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "UIImageView+WebCache.h"
#import "CLRefreshNormalHeader.h"

@interface CLAllViewController () <UITableViewDataSource>
@property (nonatomic, weak) NSArray<CLTopic *> *topics;
@end

@implementation CLAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(35, 0, 0, 0);
    [self setUpRefresh];
    
}

- (void) setUpRefresh {
    CLRefreshNormalHeader *mj_header = [CLRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadNewData];
    }];
    self.tableView.mj_header = mj_header;
}

- (void) loadNewData {
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"data";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 字典数组 -> 模型数组
        self.topics = [CLTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        // 刷新表格
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求数据失败 %@",error);
        [self.tableView.mj_header endRefreshing];
    }];
}


#pragma mark -UITableViewDataSource
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topics.count;
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CLTopic *topic = self.topics[indexPath.row];
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = topic.name;
    cell.detailTextLabel.text = topic.text;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    return cell;
}
@end
