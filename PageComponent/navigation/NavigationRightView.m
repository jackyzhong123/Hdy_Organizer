//
//  NavigationRightView.m
//  AnnualCard
//
//  Created by GUZUQIANG on 3/10/15.
//  Copyright (c) 2015 GUZUQIANG. All rights reserved.
//

#import "NavigationRightView.h"

@implementation NavigationRightView




- (void)buttonRightTouched:(id)sender {
    [self.mydelegate buttonNavigationRightTouched];
}


- (void)loadWithImage:(NSString *)imagename {
    if (imagename != nil && self.btnRight == nil) {
        self.btnRight = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 96, 40)];
        [self.btnRight setImage:[UIImage imageNamed:imagename] forState:UIControlStateNormal];
        [self addSubview:self.btnRight];
        [self.btnRight setBackgroundColor:[UIColor clearColor]];
        [self.btnRight addTarget:self action:@selector(buttonRightTouched:) forControlEvents:UIControlEventTouchUpInside];
    }
}


- (void)loadWithText:(NSString *)text {
    if (text != nil && self.btnRight == nil) {
        self.btnRight = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 96, 40)];
        [self.btnRight setTitle:text forState:UIControlStateNormal];
        [self.btnRight setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnRight.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
        [self addSubview:self.btnRight];
        [self.btnRight setBackgroundColor:[UIColor clearColor]];
        [self.btnRight addTarget:self action:@selector(buttonRightTouched:) forControlEvents:UIControlEventTouchUpInside];
    }
}




@end
