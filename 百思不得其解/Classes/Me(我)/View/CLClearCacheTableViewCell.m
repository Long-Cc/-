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
#define CustomCacheFile [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"customer"]

@implementation CLClearCacheTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //设置Cell右边的指示器（用来说明正在处理一些事情）
         UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [loadingView startAnimating];
        self.accessoryView = loadingView;
        //设置cell默认的文字（如果设置文字之前UserInteractionEnable = NO，那么文字文字会自动变成灰色）
        self.textLabel.text = @"清除缓存(正在计算缓存大小...)";
        // 禁止点击
        self.userInteractionEnabled = NO;
        //type(age) = int ---int age=40;
        //__weak CLClearCacheTableViewCell * weakSelf = self;
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            //获得缓存文件夹路径
            unsigned long long size = CustomCacheFile.fileSize;
            size += [SDImageCache sharedImageCache].getSize;
            
            //如果cell已经销毁，直接返回
            if (weakSelf == nil) return ;
            
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
            //生成文字
            NSString *text = [NSString stringWithFormat:@"清除缓存(%@)", sizeText];
            //回到主线程
            dispatch_async(dispatch_get_main_queue(), ^{
                // 设置文字
                weakSelf.textLabel.text = text;
                // 清空右边的指示器
                weakSelf.accessoryView = nil;
                // 显示右边的箭头
                weakSelf.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
                // 添加手势监听器
                [weakSelf addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:weakSelf action:@selector(clearCache)]];
                
                // 恢复点击事件
                self.userInteractionEnabled = YES;
            });
        });
    }
    return self;
}

- (void) clearCache {
    //弹出指示器
    [SVProgressHUD showWithStatus:@"正在清除缓存..."];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    //删除SDImage的缓存
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        //删除自定义的缓存
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSFileManager *mgr = [NSFileManager defaultManager];
            [mgr removeItemAtPath:CustomCacheFile error:nil];
            [mgr createDirectoryAtPath:CustomCacheFile withIntermediateDirectories:YES attributes:nil error:nil];
            
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

- (void)layoutSubviews {
    [super layoutSubviews];
    // cell重新显示的时候, 继续转圈圈
    UIActivityIndicatorView *loadingView = (UIActivityIndicatorView *)self.accessoryView;
    [loadingView startAnimating];
}
@end
