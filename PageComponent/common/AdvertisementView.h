//
//  AdvertisementView.h
//  AnnualCard
//
//  Created by GUZUQIANG on 5/18/15.
//  Copyright (c) 2015 GUZUQIANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdvertisementView : UIView <UIScrollViewDelegate>


@property (nonatomic) NSInteger currentPageIndex;
@property (nonatomic, retain) NSMutableArray *itemList;

@property (strong, nonatomic) UIScrollView *scroll;
@property (strong, nonatomic) UIPageControl *pager;


- (void)loadContent:(NSMutableArray *)list;

@end
