//
//  CLClearCacheTableViewCell.m
//  百思不得其解
//
//  Created by LongCh on 2017/12/25.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLClearCacheTableViewCell.h"
#import "SDImageCache.h"
#import "NSString+CLExtension.h"
#import "SVProgressHUD.h"
#define CustomCacheFile [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"custom"]

@implementation CLClearCacheTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
         UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [loadingView startAnimating];
        self.accessoryView = loadingView;
        self.textLabel.text = @"清除缓存(正在计算缓存大小...)";
        // 禁止点击
        self.userInteractionEnabled = NO;
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            unsigned long long size = CustomCacheFile.fileSize;
            size += [SDImageCache sharedImageCache].getSize;
            NSString *sizeText = nil;
            if (size >= pow(10, 9)) {//10^9B = 1GB
                sizeText = [NSString stringWithFormat:@"%.2fGB",size / pow(10, 9)];
            } else if (size >= pow(10, 6)) {//10^6B = 1MB
                sizeText = [NSString stringWithFormat:@"%.2fMB",size / pow(10, 6)];
            } else if (size >= pow(10, 3)) {//10^3B = 1kB
                sizeText = [NSString stringWithFormat:@"%.2fKB",size / pow(10, 3)];
            } else {
                sizeText = [NSString stringWithFormat:@"%zdB",size];
            }
            NSString *text = [NSString stringWithFormat:@"清除缓存(%@)", sizeText];
            dispatch_async(dispatch_get_main_queue(), ^{
                // 设置文字
                self.textLabel.text = text;
                // 清空右边的指示器
                self.accessoryView = nil;
                // 显示右边的箭头
                self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
                // 添加手势监听器
                [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clearCache)]];
                
                // 恢复点击事件
                self.userInteractionEnabled = YES;
            });
        });
        
    }
    return self;
}

- (void) clearCache {
    [SVProgressHUD showWithStatus:@"正在清除缓存..."];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSFileManager *mgr = [NSFileManager defaultManager];
            [mgr removeItemAtPath:CustomCacheFile error:nil];
            [mgr createDirectoryAtPath:CustomCacheFile withIntermediateDirectories:YES attributes:nil error:nil];
#warning 睡眠
            // [NSThread sleepForTimeInterval:2.0];
            
            // 所有的缓存都清除完毕
            dispatch_async(dispatch_get_main_queue(), ^{
                // 隐藏指示器
                [SVProgressHUD dismiss];
                
                // 设置文字
                self.textLabel.text = @"清除缓存(0B)";
            });
        });
    }];
}

@end
