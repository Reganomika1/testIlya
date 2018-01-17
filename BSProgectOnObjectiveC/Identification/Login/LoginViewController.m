//
//  LoginViewController.m
//  BSProgectOnObjectiveC
//
//  Created by Macbook on 16.01.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.logInButton.backgroundColor = [UIColor colorWithRed:0.54 green:0.75 blue:0.24 alpha:1.0];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -Action

- (IBAction)logInButton:(UIButton *)sender {
}

@end
