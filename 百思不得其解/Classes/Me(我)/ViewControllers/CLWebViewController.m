//
//  CLWebViewController.m
//  百思不得其解
//
//  Created by LongCh on 2017/12/20.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLWebViewController.h"

@interface CLWebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardItem;
@end

@implementation CLWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}
- (IBAction)goForward:(id)sender {
    [self.webView goForward];
}
- (IBAction)goBack:(id)sender {
    [self.webView goBack];
}
- (IBAction)reFlash:(id)sender {
    [self.webView reload];
}

#pragma -mark -UIWebViewDelegate method
- (void) webViewDidFinishLoad:(UIWebView *)webView {
    self.backItem.enabled = webView.canGoBack;
    self.forwardItem.enabled = webView.canGoForward;
}
@end
