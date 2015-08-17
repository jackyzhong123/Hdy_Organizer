//
//  LoginViewController.m
//  Organizer
//
//  Created by Sky on 15/8/15.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [self.navigationController setNavigationBarHidden:NO animated:YES];

    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
  }


- (IBAction)buttonActionTouched:(id)sender {
    
    //NSDictionary *data=[NSDictionary dictionaryWithObject:@"dd" forKey:@"name"];
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
    [dic setValue:self.txtUserName.text  forKey:@"NickName"];
    [dic setValue:self.txtPassword.text forKey:@"Password"];
    
    
    [self.http httpPostApi:@"api/Login/OrgLogin" withBody:dic withTag:1];
    
    
}



#pragma mark 网络请求回调

- (void)requestDataComplete:(id)response requestTag:(NSInteger)tag {
    NSDictionary *arr = response;
    // NSLog(@"%@",[arr objectForKey:@"IsValid"]);
    
    switch (tag) {
        case 1:
            if([ [arr objectForKey:@"IsValid"]  boolValue])
            {
                
                [Utilities saveLocalStr:[arr objectForKey:@"token"] withKey:@"access_token"];
                
                
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                self.view.window.rootViewController = [storyboard instantiateInitialViewController];

                
                                 
            }else
            {
                //NSLog(@"不可以注册%@",[arr objectForKey:@"error"]);
            }
            
            break;
         
        default:
            break;
    }
    
}

- (void)requestDataFailed:(NSString *)error
{
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
