//
//  LoginViewController.h
//  Organizer
//
//  Created by Sky on 15/8/15.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : NavigationPageVC

- (IBAction)buttonActionTouched:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *txtUserName;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;

@end
