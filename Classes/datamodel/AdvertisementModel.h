//
//  AdvertisementModel.h
//  AnnualCard
//
//  Created by GUZUQIANG on 5/18/15.
//  Copyright (c) 2015 GUZUQIANG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdvertisementModel : NSObject

@property (readwrite, nonatomic) NSInteger ItemID;
@property (strong, nonatomic) NSString *Title;
@property (strong, nonatomic) NSString *ImageUrl;
@property (strong, nonatomic) NSString *TargetUrl;

@property (strong, nonatomic) NSString *RichTextContent;
@property (strong, nonatomic) NSMutableArray *GalleryContentList;

- (void)loadWithDictionary:(NSDictionary *)dict;


@end
