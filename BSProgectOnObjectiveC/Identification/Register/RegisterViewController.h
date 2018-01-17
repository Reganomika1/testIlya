//
//  RegisterViewController.h
//  BSProgectOnObjectiveC
//
//  Created by Macbook on 16.01.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *loginLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordLabel;
@property (weak, nonatomic) IBOutlet UITextField *repeatPasswordLabel;
@property (assign, nonatomic) NSInteger pageIndex;
@property (weak, nonatomic) IBOutlet UIButton *signUPButton;



@end
