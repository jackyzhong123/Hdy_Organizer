//
//  NavigationLeftView.h
//  AnnualCard
//
//  Created by GUZUQIANG on 3/10/15.
//  Copyright (c) 2015 GUZUQIANG. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol NavigationLeftViewDelegate <NSObject>

- (void)buttonNavigationBackTouched;

@end


@interface NavigationLeftView : UIView



@property (assign) id<NavigationLeftViewDelegate> mydelegate;

@property (strong, nonatomic) UIButton *btnBack;


- (void)load;
- (void)loadWithImage:(NSString *)imagename;
- (void)loadWithText:(NSString *)text;


@end
