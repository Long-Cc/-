//
//  CLSettingController.m
//  百思不得其解
//
//  Created by LongCh on 2017/12/6.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLSettingController.h"
#import "CLClearCacheTableViewCell.h"

@interface CLSettingController () <UITableViewDelegate,UITableViewDataSource>

@end

static NSString *ID = @"CellIdentifier";

@implementation CLSettingController
- (instancetype) init {
   return [self initWithStyle:UITableViewStyleGrouped];
}

- (void) viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    self.tableView.delegate = self;
    [self.tableView registerClass:[CLClearCacheTableViewCell class] forCellReuseIdentifier:ID];
   // [self geCacheSize];
    
    
}


#pragma -mark -UITableViewDelegate,UITableViewDataSource 方法
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:ID];
}



- (void) geCacheSize {
    unsigned long long size = 0;
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    NSString *dirPath = [cachePath stringByAppendingPathComponent:@"default"];
    NSLog(@"%@",dirPath);
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *subPaths = [manager subpathsAtPath:dirPath];
    for (NSString *subPath in subPaths) {
        NSString *fullSubPath = [dirPath stringByAppendingPathComponent:subPath];
        size += [manager attributesOfItemAtPath:fullSubPath error:nil].fileSize;
    }
    CLNSLog(@"%lld",size);
}

@end




