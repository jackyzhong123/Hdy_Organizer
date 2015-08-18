//
//  AlbumDetailVC.h
//  Organizer
//
//  Created by Sky on 15/8/18.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumDetailVC : NavigationPageVC

@property (strong ,nonatomic) NSString *AlbumId;
@property (nonatomic,strong) NSMutableArray* listData;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UITextField *txtAlbumName;
- (IBAction)btnSave:(id)sender;

@end
