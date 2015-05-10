//
//  ViewController.m
//  QRQuickReader
//
//  Created by Li, Jonathan on 4/11/15.
//  Copyright (c) 2015 It21Learning. All rights reserved.
//

#import "ViewController.h"
#import "ReaderHelper.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *viewPreview;
@property (weak, nonatomic) IBOutlet UITextView *txtOutput;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnStart;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnCopy;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnOpenLink;

- (IBAction)start:(id)sender;
@property (nonatomic, strong) ReaderHelper* helper;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.helper){
        self.helper = [[ReaderHelper alloc] init];
    }
 //   [self start:nil];
}

- (void)viewDidAppear:(BOOL)animated{
//    [self start:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)copy:(id)sender {
   UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
   pasteboard.string = self.txtOutput.text;
    
   [self.helper playSound];
}

- (IBAction)launchSafari:(id)sender {
    NSURL *url = [NSURL URLWithString:self.txtOutput.text];
    bool bOK = [[UIApplication sharedApplication] openURL:url];
    if (!bOK){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                message:@"Unable to open the URL, please check URL."
                                                delegate:nil
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)start:(id)sender {
    self.btnStart.enabled = NO;
    self.btnCopy.enabled = NO;
    self.btnOpenLink.enabled = NO;
    self.txtOutput.text = @"";
    [self.helper startRead: self.viewPreview onCompletion:^(NSString* output){
        self.txtOutput.text = output;
        self.btnCopy.enabled = true;
        self.btnOpenLink.enabled = true;
        self.btnStart.enabled = YES;
    }];
}

@end
