//
//  AdvertisementModel.m
//  AnnualCard
//
//  Created by GUZUQIANG on 5/18/15.
//  Copyright (c) 2015 GUZUQIANG. All rights reserved.
//

#import "AdvertisementModel.h"
#import "GalleryItemModel.h"

@implementation AdvertisementModel



- (void)loadWithDictionary:(NSDictionary *)dict
{
    if (dict == nil) {
        self.ItemID = 0;
        return;
    }
    if ([dict objectForKey:@"ItemID"] == nil) {
        self.ItemID = 0;
        return;
    }
    self.ItemID = [[dict objectForKey:@"ItemID"] intValue];
    @try {
        self.Title = [dict objectForKey:@"Title"];
        self.ImageUrl = [dict objectForKey:@"ImageUrl"];
        self.TargetUrl = [dict objectForKey:@"TargetUrl"];
        
        self.RichTextContent = [dict objectForKey:@"RichtextContent"];
        self.GalleryContentList = [[NSMutableArray alloc] initWithCapacity:0];
        NSArray *items = [dict objectForKey:@"GalleryContent"];
        for (int i=0; i<[items count]; i++) {
            GalleryItemModel *item = [[GalleryItemModel alloc] init];
            [item loadWithDictionary:[items objectAtIndex:i]];
            if(![DataAccessHelper stringIsNullOrEmpty:item.ImageUrl])
                [self.GalleryContentList addObject:item];
        }
        
        
    }
    @catch (NSException *exception) {
        NSLog(@"Invalid AnnualCard Format %@", [dict description]);
    }
    @finally {
    }
}




@end
