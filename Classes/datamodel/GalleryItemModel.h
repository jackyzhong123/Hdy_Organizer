//
//  GalleryItemModel.h
//  AnnualCard
//
//  Created by GUZUQIANG on 3/11/15.
//  Copyright (c) 2015 GUZUQIANG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GalleryItemModel : NSObject


@property (strong, nonatomic) NSString *ImageUrl;
@property (strong, nonatomic) NSString *IconUrl;
@property (strong, nonatomic) NSString *Text;
@property (strong, nonatomic) NSString *TargetUrl;


- (void)loadWithDictionary:(NSDictionary *)dict;



@end
