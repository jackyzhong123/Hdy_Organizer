//
//  AlbumListVC.h
//  Organizer
//
//  Created by Sky on 15/8/18.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewPageVC.h"

@interface AlbumListsVC :CollectionViewPageVC<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>



@property (nonatomic,strong) NSMutableArray* listData;
@end
