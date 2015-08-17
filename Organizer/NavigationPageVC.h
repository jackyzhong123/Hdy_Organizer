//

//  NavigationPageVC.h

//  AnnualCard

//

//  Created by GUZUQIANG on 3/10/15.

//  Copyright (c) 2015 GUZUQIANG. All rights reserved.

//



#import <UIKit/UIKit.h>
#import "WebRequestHelper.h"
@interface NavigationPageVC : UIViewController <WebRequestDelegate>



@property (strong, nonatomic) WebRequestHelper *http;









@end

