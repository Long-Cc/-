//
//  CLLoginRegisterViewController.m
//  百思不得其解
//
//  Created by LongCh on 2017/12/11.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLLoginRegisterViewController.h"

@interface CLLoginRegisterViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginView_left_constraint;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation CLLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:CLRandomColor];
    CLLogFunc
    //self.loginButton.layer.cornerRadius = 5;
    //[self.loginButton setValue:@5 forKeyPath:@"layer.cornerRadius"];
    //self.loginButton.layer.masksToBounds = YES;
    //[self.loginButton setValue:@YES forKeyPath:@"layer.masksToBounds"];
}

- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (IBAction)close {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)showRegisterOrLogin:(UIButton *)sender {
    [self.view endEditing:YES];
    //改变constraint
    if (self.loginView_left_constraint.constant) {
        self.loginView_left_constraint.constant = 0;
        //[self.registerBtn setTitle:@"注册帐号" forState:UIControlStateNormal];
         [self.registerBtn setSelected:NO];
    } else {
       self.loginView_left_constraint.constant = -self.view.CL_wight;
         [self.registerBtn setSelected:YES];
        //[self.registerBtn setTitle:@"已有账号？" forState:UIControlStateNormal];
    }
    //动画
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}
- (IBAction)login:(id)sender {
    CLLogFunc;
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
@end
