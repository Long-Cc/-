//
//  CLLoginRegisterTextField.m
//  百思不得其解
//
//  Created by LongCh on 2017/12/13.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLLoginRegisterTextField.h"

@implementation CLLoginRegisterTextField

- (void) awakeFromNib {
    [super awakeFromNib];
    NSMutableDictionary *attribute = [NSMutableDictionary dictionary];
    self.tintColor =[UIColor whiteColor];
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:@"" attributes: attribute];
    self.attributedPlaceholder = string;
}

@end
