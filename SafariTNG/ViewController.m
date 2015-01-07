//
//  ViewController.m
//  SafariTNG
//
//  Created by Johnny Appleseed on 1/6/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate, UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

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

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // create string using the textfields text
    NSString *addressString = self.textField.text;
    // create URL using string created on line 36
    NSURL *addressURL = [NSURL URLWithString:addressString];
    // create URL request using URL from line 23
    NSURLRequest *addressRequest = [NSURLRequest requestWithURL:addressURL];
    // call the method loadRequest on our webView instance to display the webpage
    [self.webView loadRequest:addressRequest];

    return true;
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.activityIndicator startAnimating];
    self.activityIndicator.hidden = false;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden = true;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.delegate = self;
    alert.title = @"Loading failed";
    alert.message = error.localizedDescription;
    [alert addButtonWithTitle:@"Dismiss"];
    [alert addButtonWithTitle:@"Try Again"];
    [alert addButtonWithTitle:@"Go Home"];
    [alert show];
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden = true;
}

#pragma mark - UITextField Delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        // create string using the textfields text
        NSString *addressString = self.textField.text;
        // create URL using string created on line 36
        NSURL *addressURL = [NSURL URLWithString:addressString];
        // create URL request using URL from line 23
        NSURLRequest *addressRequest = [NSURLRequest requestWithURL:addressURL];
        // call the method loadRequest on our webView instance to display the webpage
        [self.webView loadRequest:addressRequest];
    }
    else if (buttonIndex == 2)
    {
        // create string using the textfields text
        NSString *addressString = @"http://mobilemakers.co";
        // create URL using string created on line 36
        NSURL *addressURL = [NSURL URLWithString:addressString];
        // create URL request using URL from line 23
        NSURLRequest *addressRequest = [NSURLRequest requestWithURL:addressURL];
        // call the method loadRequest on our webView instance to display the webpage
        [self.webView loadRequest:addressRequest];
    }
}

@end
