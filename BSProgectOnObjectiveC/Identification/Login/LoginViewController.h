//
//  LoginViewController.h
//  BSProgectOnObjectiveC
//
//  Created by Macbook on 16.01.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *loginLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordLabel;
@property (assign, nonatomic) NSInteger pageIndex;
@property (weak, nonatomic) IBOutlet UIButton *logInButton;
@end
