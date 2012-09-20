//
//  ViewController.m
//  wallet
//
//  Created by Natalia Terlecka on 9/20/12.
//  Copyright (c) 2012 Natalia Terlecka. All rights reserved.
//

#import "ViewController.h"
#import "WalleetRepository.h"

@interface ViewController ()
@property (nonatomic, strong) WalleetRepository *client;
@end

@implementation ViewController
@synthesize emailTextField;
@synthesize passwordTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.client = [[WalleetRepository alloc] init];
}

- (void)viewDidUnload
{
    [self setEmailTextField:nil];
    [self setPasswordTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)login:(id)sender
{
    [self.client getUserForEmail:self.emailTextField.text andPassword:self.passwordTextField.text];
}

@end
