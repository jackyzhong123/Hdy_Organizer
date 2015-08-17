#import <UIKit/UIKit.h>
#import "WebRequestHelper.h"


@interface TableViewPageVC : UITableViewController <WebRequestDelegate>



@property (strong, nonatomic) WebRequestHelper *http;









@end