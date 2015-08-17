//
//  FirstViewController.h
//  Organizer
//
//  Created by Sky on 15/7/29.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstViewController : NavigationPageVC<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UILabel *lblOrgNickName;
@property (strong, nonatomic) IBOutlet UICollectionView *cvFunctions;

@property (strong, nonatomic) NSMutableArray * functionsBlock;


- (IBAction)buttonActionTouched:(id)sender;

@end

