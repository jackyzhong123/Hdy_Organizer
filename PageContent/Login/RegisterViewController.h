//
//  RegisterViewController.h
//  Organizer
//
//  Created by Sky on 15/8/15.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : NavigationPageVC

- (IBAction)buttonActionTouched:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtNickName;

@property (strong, nonatomic) IBOutlet UITextField *txtPassword;

@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtOrgName;

@end
