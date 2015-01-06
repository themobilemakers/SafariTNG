//
//  ViewController.m
//  SafariTNG
//
//  Created by Johnny Appleseed on 1/6/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    // create string using mobile makers web address
    NSString *addressString = @"http://mobilemakers.co";
    // create URL using string from line 22
    NSURL *addressURL = [NSURL URLWithString:addressString];
    // create URL request using URL from line 23
    NSURLRequest *addressRequest = [NSURLRequest requestWithURL:addressURL];
    // call the method loadRequest on our webView instance to display the webpage
    [self.webView loadRequest:addressRequest];
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.activityIndicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityIndicator stopAnimating];
}

@end
