//

//  NavigationPageVC.m

//  AnnualCard

//

//  Created by GUZUQIANG on 3/10/15.

//  Copyright (c) 2015 GUZUQIANG. All rights reserved.

//



#import "NavigationPageVC.h"







@implementation NavigationPageVC





#pragma mark 处理Notification的消息





#pragma mark 页面生命周期

- (void)viewDidLoad

{
    self.http = [[WebRequestHelper alloc] init];
    self.http.mydelegate = self;
    [super viewDidLoad];
}






- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}







#pragma mark NavigationBarView delegate









#pragma mark 网络请求回调



- (void)requestDataComplete:(id)response requestTag:(NSInteger)tag {
    
}

- (void)requestDataFailed:(NSString *)error {
    
}















@end

