//
//  AddNewAlbumVC.h
//  Organizer
//
//  Created by Sky on 15/8/17.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewAlbumVC : NavigationPageVC<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

- (IBAction)buttonActionTouched:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageCover;
@property (strong, nonatomic) IBOutlet UITextField *txtName;

@end
