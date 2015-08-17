//
//  GalleryItemModel.m
//  AnnualCard
//
//  Created by GUZUQIANG on 3/11/15.
//  Copyright (c) 2015 GUZUQIANG. All rights reserved.
//

#import "GalleryItemModel.h"

@implementation GalleryItemModel



- (void)loadWithDictionary:(NSDictionary *)dict
{
    if (dict == nil) {
        self.ImageUrl = @"";
        return;
    }
    if ([dict objectForKey:@"ImageUrl"] == nil) {
        self.ImageUrl = @"";
        return;
    }
    self.ImageUrl = [dict objectForKey:@"ImageUrl"];
    @try {
        self.IconUrl = [dict objectForKey:@"IconUrl"];
        self.Text = [dict objectForKey:@"Text"];
    }
    @catch (NSException *exception) {
        NSLog(@"Invalid Gallery Item Format %@", [dict description]);
    }
    @finally {
    }
}





@end
