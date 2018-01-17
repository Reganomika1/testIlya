//
//  IdentificationViewController.h
//  BSProgectOnObjectiveC
//
//  Created by Admin on 16.01.18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSegmentedControl.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
@interface IdentificationViewController : UIViewController

@property (strong) UITextField *LoginLabel;
@property (strong) UITextField *passwordLabel;
@property (strong) UITextField *repeatPasswordLabel;
@property (strong) UIButton *registerOrLogInButton;
@property (strong) UIPageViewController *pageController;
@property (strong) NSArray *arrPageTitles;
@property (strong) NSArray *storyboardIDs;
@property (strong) HMSegmentedControl *segmentCotroller;
@end
