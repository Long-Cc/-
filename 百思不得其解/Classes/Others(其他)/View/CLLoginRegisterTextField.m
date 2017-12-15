//
//  CLLoginRegisterTextField.m
//  百思不得其解
//
//  Created by LongCh on 2017/12/13.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLLoginRegisterTextField.h"


static NSString *const placeholderColorKey = @"placeholderLabel.textColor";

@implementation CLLoginRegisterTextField

- (void) awakeFromNib {
    [super awakeFromNib];
    //设置光标颜色
    self.tintColor =[UIColor whiteColor];
    
//    #import <objc/runtime.h>
//    unsigned int count;
//    Ivar *ivarList = class_copyIvarList([UITextField class], &count);
//    for (int i = 0; i < count; ++i) {
//        Ivar ivar = ivarList[i];
//        NSLog(@"%s",ivar_getName(ivar));
//    }
    
}

/**
 *  调用时刻 : 成为第一响应者(开始编辑\弹出键盘\获得焦点)
 */
- (BOOL)becomeFirstResponder
{
    self.placeholderColor = [UIColor whiteColor];
    //[self setValue:[UIColor whiteColor] forKeyPath:placeholderColorKey];
    return [super becomeFirstResponder];
}

/**
 *  调用时刻 : 不做第一响应者(结束编辑\退出键盘\失去焦点)
 */
- (BOOL)resignFirstResponder
{
    self.placeholderColor = [UIColor grayColor];
    //[self setValue:[UIColor grayColor] forKeyPath:placeholderColorKey];
    return [super resignFirstResponder];
}

@end
