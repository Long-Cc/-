//
//  CLItemManager.h
//  百思不得其解
//
//  Created by LongCh on 2017/12/4.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLItemManager : NSObject

+ (UIBarButtonItem *) itemWithImage:(NSString *)imageNormol hightImage:(NSString *)hightImage target:(id)target action:(SEL)action;

@end
