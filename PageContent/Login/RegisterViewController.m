//
//  RegisterViewController.m
//  Organizer
//
//  Created by Sky on 15/8/15.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
     [self.navigationController setNavigationBarHidden:NO animated:YES];
    [super viewDidLoad];
    
    
    
    UITapGestureRecognizer *tapGestureRecognizer=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    tapGestureRecognizer.cancelsTouchesInView=NO;
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    
    
    
    // Do any additional setup after loading the view.
}


-(void)keyboardHide:(UITapGestureRecognizer *)tap{
    [self.txtNickName resignFirstResponder];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)buttonActionTouched:(id)sender {
    
    //NSDictionary *data=[NSDictionary dictionaryWithObject:@"dd" forKey:@"name"];
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
    [dic setValue:self.txtNickName.text  forKey:@"NickName"];
    [dic setValue:self.txtEmail.text forKey:@"Email"];
    
    
    [self.http httpPostApi:@"api/Login/CheckUserNameExist" withBody:dic withTag:0];


}


#pragma mark 网络请求回调

- (void)requestDataComplete:(id)response requestTag:(NSInteger)tag {
    NSDictionary *arr = response;
   // NSLog(@"%@",[arr objectForKey:@"IsValid"]);
    
    switch (tag) {
        case 0:
            if([ [arr objectForKey:@"IsValid"]  boolValue])
            {
                
                NSLog(@"可以注册");
                
                NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
                [dic setValue:self.txtNickName.text  forKey:@"NickName"];
                [dic setValue:self.txtEmail.text forKey:@"Email"];
                [dic setValue:self.txtPassword.text forKey:@"Password"];
               
                
                [self.http httpPostApi:@"api/Login/OrgRegister" withBody:dic withTag:1];
                
            }else
            {
                NSLog(@"不可以注册%@",[arr objectForKey:@"error"]);
            }

            break;
        case 1:
            
            NSLog(@"xxx%@",[arr
                          objectForKey:@"token"]);
            
            int i=1;
            
            
            
            
            
            break;
        default:
            break;
    }
    
}

- (void)requestDataFailed:(NSString *)error
{
    
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
