//
//  NavigationRightView.h
//  AnnualCard
//
//  Created by GUZUQIANG on 3/10/15.
//  Copyright (c) 2015 GUZUQIANG. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol NavigationRightViewDelegate <NSObject>

- (void)buttonNavigationRightTouched;

@end


@interface NavigationRightView : UIView


@property (assign) id<NavigationRightViewDelegate> mydelegate;

@property (strong, nonatomic) UIButton *btnRight;


- (void)loadWithImage:(NSString *)imagename;
- (void)loadWithText:(NSString *)text;





@end
