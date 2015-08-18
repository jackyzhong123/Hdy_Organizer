#import <UIKit/UIKit.h>
#import "WebRequestHelper.h"


@interface CollectionViewPageVC : UICollectionViewController <WebRequestDelegate>



@property (strong, nonatomic) WebRequestHelper *http;









@end