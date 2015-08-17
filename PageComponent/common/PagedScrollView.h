//
//  PagedScrollView.h
//  AnnualCard
//
//  Created by GUZUQIANG on 5/19/15.
//  Copyright (c) 2015 GUZUQIANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PagedScrollView : UIScrollView



@property (strong, nonatomic) UIView *parentView;

@property (readwrite) BOOL touchBegan;
@property (readwrite) CGFloat touchFrom;
@property (readwrite) CGFloat contentOffsetFrom;

@property (readwrite) CGFloat cellViewHeight;



@end
