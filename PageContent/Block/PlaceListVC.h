//
//  PlaceListVC.h
//  Organizer
//
//  Created by Sky on 15/8/18.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//




#import <UIKit/UIKit.h>
#import "MJRefresh.h"
#import "TableViewPageVC.h"

@interface PlaceListVC :TableViewPageVC <UITableViewDelegate,UITableViewDataSource>
//保存数据列表
@property (nonatomic,strong) NSMutableArray* listData;
@end