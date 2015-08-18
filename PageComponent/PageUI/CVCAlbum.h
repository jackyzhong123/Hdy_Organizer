//
//  CVCAlbum.h
//  Organizer
//
//  Created by Sky on 15/8/18.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CVCAlbum : UICollectionViewCell

@property (strong,nonatomic) IBOutlet  UIImageView *imageView;
@property (strong,nonatomic) IBOutlet  UILabel *lblAlbumName;
@property (strong,nonatomic) NSString *AlbumIds;


@end
